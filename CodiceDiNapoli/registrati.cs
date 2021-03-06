using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Xamarin.Essentials;
using System.Security.Cryptography;

namespace App2
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Page1 : ContentPage
    {
        MySqlConnection connection;
        public Page1()
        {
            InitializeComponent();
        }

        private  void btnRegistrati_Clicked(object sender, EventArgs e)
        {
            User user= creaUtente();
            if (user != null)
            {
                if (!checkUser(user))
                {
                    if (user.pass.Equals(Utili.convertPassToMD5(txtConfermaPW.Text)))
                    {
                        MySqlConnection connection = new MySqlConnection("Server=192.168.1.8;Database=syncool2;Uid=root;Pwd='pass';");
                        connection.Open();

                        MySqlCommand cmd = new MySqlCommand(user.insert(), connection);
                        cmd.ExecuteReaderAsync();

                        connection.Close();
                        DisplayAlert("Perfetto", "Hai registrato il tuo profilo", "Ok");
                        Navigation.PopModalAsync();
                        Navigation.PushModalAsync(new MainPage());
                    }
                    else
                        DisplayAlert("Attenzione", "La password di conferma non è uguale alla password scelta!", "Ok");

                }
                else
                    DisplayAlert("Attenzione", "Hai già un profilo registrato con questa mail!", "Ok");
            }
            else
                DisplayAlert("Attenzione", "Non hai completato tutti i campi oppure ricordati che devi avere almeno 6 anni!", "Ok");
            
        }

        bool checkUser(User user) {
            connection = new MySqlConnection("Server=192.168.1.8;Database=syncool2;Uid=root;Pwd='pass';");
            connection.Open();
            MySqlCommand cmd = new MySqlCommand(user.check2(), connection);
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                connection.Close();
                return true;
            }
            else
            {
                connection.Close();
                return false;
            }
        }

        private User creaUtente()
        {
            string ruolo = "";
            User user;

            if (rdbStudente.IsChecked)
                ruolo = (string)rdbStudente.Content;
            else if (rdbTutor.IsChecked)
                ruolo = (string)rdbTutor.Content;
            else
                ruolo = "";
            
            if (txtMail.Text != "" && txtPassword.Text != "" && DateTime.Now.Year - data.Date.Year >= 6 && txtNome.Text != "" && txtCognome.Text != "" && txtCitta.Text != "" && ruolo != "")
                user = new User(txtMail.Text, Utili.convertPassToMD5(txtPassword.Text), data.Date.ToShortDateString(), txtNome.Text, txtCognome.Text, txtCitta.Text, ruolo);
            else
                user = null;

            return user;
            
        }

       

    }
}




//XAML
<?xml version="1.0" encoding="utf-8" ?>
<ContentPage xmlns="http://xamarin.com/schemas/2014/forms"
             xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml"
             x:Class="App2.Page1">
    <ContentPage.Content>
        <StackLayout HorizontalOptions="FillAndExpand">

            <Frame BackgroundColor="#2196F3" Padding="24" >
                <Label Text="SynCool" HorizontalTextAlignment="Center" TextColor="White" FontSize="36"/>
            </Frame>
            <StackLayout Padding="40" Spacing="10">
                <Label Text="Registrati" FontSize="Large" HorizontalOptions="Center"></Label>
                <Entry x:Name="txtNome" Placeholder="Nome"></Entry>
                <Entry x:Name="txtCognome" Placeholder="Cognome"></Entry>
                <Entry x:Name="txtCitta" Placeholder="Città"></Entry>
                <DatePicker x:Name="data"></DatePicker>
                <Entry x:Name="txtMail" Placeholder="E-Mail"></Entry>
                <Entry x:Name="txtPassword" Placeholder="Password" IsPassword="True"></Entry>
                <Entry x:Name="txtConfermaPW" Placeholder="Conferma Password" IsPassword="True"></Entry>
            </StackLayout>

            <Label HorizontalOptions="Center">
                <Label.FormattedText>
                    <FormattedString>
                        <Span Text="Che tipo di utente sei?"></Span>
                    </FormattedString>
                </Label.FormattedText>
            </Label>

            <Grid Padding="20" Margin="10" VerticalOptions="Center">
                <Grid.RowDefinitions>
                    <RowDefinition Height="*"></RowDefinition>
                </Grid.RowDefinitions>
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"></ColumnDefinition>
                </Grid.ColumnDefinitions>
                <RadioButton x:Name="rdbTutor" Content="Tutor" Grid.Row="0" Grid.Column="0" ></RadioButton>
                <RadioButton x:Name="rdbStudente" Content="Studente" Grid.Row="0" Grid.Column="1" ></RadioButton>
            </Grid>

            <Button x:Name="btnRegistrati" 
                Text="Registrati"
                BorderWidth="1.5"
                HorizontalOptions="Center"
                BorderColor="DarkGray"
                Background="transparent"
                CornerRadius="50"
                Clicked="btnRegistrati_Clicked"
        ></Button>

        </StackLayout>
    </ContentPage.Content>
</ContentPage>
