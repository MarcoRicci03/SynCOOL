//CLASSI UTILI

using System;
using System.Collections.Generic;
using System.Text;

namespace App2
{
    public class User
    {
        public string mail { get; set; }
        public string pass { get; set; }
        string data, nome, cognome, citta, ruolo;

        public User() { }

        public User(string mail, string pass) {
            this.mail = mail;
            this.pass = pass;
        }

        public User(string mail, string password, string data, string nome, string cognome, string citta, string ruolo ) {
            this.mail = mail;
            this.pass = password;
            this.data = data;
            this.nome = nome;
            this.cognome = cognome;
            this.citta = citta;
            this.ruolo = ruolo;
        }

        public string insert() {// registrazione
            return "INSERT INTO utenti(mail, password, nome, cognome, citta, data, ruolo) VALUES ('" + mail + "','" + pass + "','" + nome + "','" + cognome + "','" + citta + "','" + data + "','" + ruolo + "')";
        }

        public string insert2()//per il checkLogin
        {
            return "INSERT INTO utenti(mail, password) VALUES ('" + mail + "','" + pass+ "')";
        }


        public string check2() {// se esiste un profilo non lo crea
            return "SELECT * FROM `utenti` WHERE mail='" + mail + "'";
        }

        public string check()//se esiste un profilo con la password corretta accede
        {
            return "SELECT * FROM `utenti` WHERE mail='" + mail + "' and password='"+pass+"'";
        }




    }
}

//

using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace App2
{
    public class Utili
    {
       static public string convertPassToMD5(string passMD5)
        {
            var PASS = MD5.Create();
            byte[] hash = PASS.ComputeHash(Encoding.UTF8.GetBytes(passMD5));
            passMD5 = BitConverter.ToString(hash).Replace("-", "");
            return passMD5;
        }
    }
}




