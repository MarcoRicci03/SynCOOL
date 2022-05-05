using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Essentials;

namespace Prova2
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private async void Button_clicked(object sender, EventArgs e)
        {
            try
            {

                var file = await FilePicker.PickAsync();
                if (file == null)
                    return;

                LabelInfo.Text = file.FileName;

            }
            catch (Exception) { 
            
            }
           
        }
    }
}
