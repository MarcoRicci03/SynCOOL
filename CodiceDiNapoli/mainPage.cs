using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;
using MySqlConnector;
using Xamarin.Forms.Xaml;
//Pagina Principale
namespace App2
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }


        private void TapGestureRecognizer_Tapped(object sender, EventArgs e)
        {
			Navigation.PopModalAsync();
            Navigation.PushModalAsync(new Page1());
        }

        private void btnAccedi_Clicked(object sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection("Server=192.168.1.8;Database=syncool2;Uid=root;Pwd='pass';");
            connection.Open();
            User user = new User(txtMail.Text, Utili.convertPassToMD5(txtPass.Text));
            MySqlCommand cmd = new MySqlCommand(user.check(), connection);
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                Navigation.PopModalAsync();
                Navigation.PushModalAsync(new Home());
            }
            else
                DisplayAlert("Attenzione", "E-Mail o Password non corrette!", "Ok");
            connection.Close();
        }
    }
}


// XAML

<?xml version="1.0" encoding="utf-8" ?>
<ContentPage xmlns="http://xamarin.com/schemas/2014/forms"
             xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml"
             xmlns:helpers="clr-namespace:App2"
             x:Class="App2.MainPage"
             Background="#abcdef">

    <StackLayout>
        <Frame BackgroundColor="#2196F3" Padding="24" >
            <Label Text="SynCool" HorizontalTextAlignment="Center" TextColor="White" FontSize="36"/>
        </Frame>

        <StackLayout Padding="60"  VerticalOptions="Center" HorizontalOptions="FillAndExpand">
            <Image WidthRequest="200" HeightRequest="200"  Source="{helpers:imageResource App2.images.logo.png}"></Image>
            <Entry x:Name="txtMail" Placeholder="E-Mail" ></Entry>
            <Entry x:Name="txtPass" Placeholder="Password" IsPassword="True"></Entry>
            <Button x:Name="btnAccedi" CornerRadius="50" Clicked="btnAccedi_Clicked" VerticalOptions="Center" Text="Accedi" BackgroundColor="Transparent" BorderWidth="1.5" BorderColor="#007fff"></Button>
            <Label HorizontalOptions="Center">
                <Label.FormattedText>
                    <FormattedString>
                        <Span Text="Non hai un profilo? "></Span>
                        <Span Text="Registrati" TextDecorations="Underline"></Span>
                    </FormattedString>
                </Label.FormattedText>
                <Label.GestureRecognizers>
                    <TapGestureRecognizer Tapped="TapGestureRecognizer_Tapped"></TapGestureRecognizer>
                </Label.GestureRecognizers>
            </Label>
        </StackLayout>



    </StackLayout>

</ContentPage>
