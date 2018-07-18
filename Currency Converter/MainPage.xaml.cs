using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;
using Currency_Converter.Pekky;
using System.Net.Http;
// The Blank Page item template is documented at http://go.microsoft.com/fwlink/?LinkId=234238

namespace Currency_Converter
{
    /// <summary>
    /// An empty page that can be used on its own or navigated to within a Frame.
    /// </summary>
    public sealed partial class MainPage : Page
    {
        public MainPage()
        {
            this.InitializeComponent();
            //get currencies
            Query q = new Query();
            //get "from" record
            q.GetExtra("SELECT currency_code,currency_symbol,currency_name,rate FROM currencies WHERE (rate != '') AND !(rate <= 0) ORDER BY currency_name ASC");
            q.Records();
            string[,] currencies = q.Results;
            
            for(int i = 0; i < q.CountRows(); i++){
                object item = currencies[i,2]+" ("+currencies[i,0]+")";
                ConvertFrom.Items.Add(item);
                ConvertTo.Items.Add(item);
            }
        }
        /// <summary>
        /// basically to update the database
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UpdateDBCurrency_Click(object sender, RoutedEventArgs e)
        {
            /*
            var client = new HttpClient();

            // Create the HttpContent for the form to be posted.
            var requestContent = new FormUrlEncodedContent(new[] {
    new KeyValuePair<string, string>("text", "This is a block of text"),
            });

            // Get the response.
            HttpResponseMessage response = new  await client.PostAsync(
                "http://api.repustate.com/v2/demokey/score.json",
                requestContent);

            // Get the response content.
            HttpContent responseContent = response.Content;

            // Get the stream of the content.
            using (var reader = new StreamReader(await responseContent.ReadAsStreamAsync()))
            {
                // Write the output.
               // Console.WriteLine(await reader.ReadToEndAsync());
            }*/
        }

        private void ConvertBtn_Click(object sender, RoutedEventArgs e)
        {
            //CalcPanel.Opacity = .4;
            //overlay.IsEnabled = true;
            PopUp p;
            Filter f = new Filter(); 
             //regular expression to check if it's number or decimal
            string reg = @"^-{0,1}\d+\.{0,1}\d*$";
            if (!System.Text.RegularExpressions.Regex.IsMatch(ConvertValue.Text, reg))
            {
                p = new PopUp("Please type in a valid amount");
                return;
            }
          
            double value = Convert.ToDouble(ConvertValue.Text);
            string fromText = Convert.ToString(ConvertFrom.SelectedItem).Trim();
            string toText = Convert.ToString(ConvertTo.SelectedItem).Trim();
            if (value <= 0)
            {
               p = new PopUp("Please type in a valid amount");  
                return;
            }  
            if(fromText == "" || toText == "")
            {
                p = new PopUp("Please Select a currency to convert from and to");
                return;
            }
            //continue
            string fromCurrencyId = this.GetCurrencyId(fromText);
            string toCurrencyId = this.GetCurrencyId(toText);
            //call the conversion stuff
            convertedValue.Text = this.Conversion(Convert.ToDouble(value), fromCurrencyId, toCurrencyId).ToString("0.######");
            //sorry i had to put it in one line, no time to waste time :)
        }
        ///<summary>
        ///Handling the conversion calculation
        ///</summary>
        ///<param name="amount">The amount we're converting</param>
        ///<param name="fromCur">From what currency</param>
        ///<param name="toCur">To what currency</param>
        ///<returns>The converted value</returns>
        public double Conversion(double amount, string fromCur,string toCur)
        {
            Query q = new Query();
            //get "from" record
            q.GetExtra("SELECT currency_code,currency_symbol,currency_name,rate FROM currencies WHERE currency_code = '"+fromCur+"'");
            q.Record();
            //get the record stored
            string[] fromRec = q.Result;
            //since they're all based on dollar rate, convert the first to dollar
            //first know if the rate is greater than 1, we multiply, else we divide
            double fromRate = Convert.ToDouble(fromRec[3]);
            double fromAmount = this.InnerConversion(amount, fromRate);//in dollar
           
            //get "to" record
            q.GetExtra("SELECT currency_code,currency_symbol,currency_name,rate FROM currencies WHERE currency_code = '" + toCur+"'");
            q.Record();
            //get the record stored
            string[] toRec = q.Result;
            //since they're all based on dollar rate, convert the first to dollar
            //first know if the rate is greater than 1, we multiply, else we divide
            double toRate = Convert.ToDouble(toRec[3]);
            double toAmount = this.InnerConversion(fromAmount, toRate,false);//convert from dollar to the new currency
            //now fill in some stuff
            RateStoryBorder.Opacity = 1;
            RateStory.Opacity = 1;
            RateTitle.Text = "Rate";
            RateFromTo.Text = fromRec[0] + " to " + toRec[0];
            //get the direct conversion .i.e 1 pound = 473 naira, an example
            double theFromRateVal = this.InnerConversion(1, fromRate);
            double theToRateVal = this.InnerConversion(theFromRateVal, toRate, false);
            double rateVal = theToRateVal;//just put it here, no much reason
            RateText.Text = fromRec[1] + "1 ("+fromRec[0]+") = " + toRec[1]+rateVal.ToString("0.#####")+" ("+toRec[0]+")";
            return toAmount;
        }
        /// <summary>
        /// Converts the amount to dollars
        /// </summary>
        /// <param name="amount">Amount we're converting</param>
        /// <param name="rate">the conversion rate of the current currency to dollar</param>
        /// <param name="dollarConvert">if we're to convert to dollar</param>
        /// <returns>returns the dollar amount</returns>
        public double InnerConversion(double amount, double rate,bool dollarConvert = true)
        { //since they're all based on dollar rate, convert the first to dollar
            //first know if the rate is greater than 1, we multiply, else we divide
           double newAmount = 0;
           if (dollarConvert == true)//convert to dollar
           {
               if (rate > 1)//multiply,cause dollar is higher, since we're converting to dollar first
               {
                   newAmount = amount * rate;
               }
               else
               {//divide cause dollar is lower, since we're converting to dollar first
                   newAmount = amount / rate;
               }
           }
           else
           {//guess we're converting from dollar to another currency
               newAmount = amount * rate;//multiply no matter what since both amount and rate are dollar based
           }
            return newAmount;
        }
        /// <summary>
        /// Get's the currency id from the combobox value, e.g Nigerian Naira(NGN), it'll extract the NGN for you
        /// </summary>
        /// <param name="text">The value it takes in, note it must be in this format,e.g Nigerian Naira(NGN) where ngn is the unique currency ID</param>
        /// <returns>The Currency ID</returns>
        private string GetCurrencyId(string text)
        {
            string id = "";
            //split string
            Split s = new Split();
            string value = s.Divide(text, '(')[1];//this will help us break to an extent
            //now remove second ) and trim
            id = value.Replace(')',' ').Trim();
            return id;
        }
    }
}
