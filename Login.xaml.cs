using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Windows.Input;
using System.Configuration;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using MaterialDesignThemes.Wpf;

namespace ChatApp
{
    /// <summary>
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
        public Login()
        {
            InitializeComponent();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString();
        }

        #region form handling
        public bool IsDarkTheme { get; set; }
        public object DataClassesContext { get; private set; }
        public MainWindow MainWindow { get; private set; }
        public Signup Signup { get; private set; }

        private readonly PaletteHelper paletteHelper = new PaletteHelper();

        private void toggleTheme(object sender, RoutedEventArgs e)
        {
            ITheme theme = paletteHelper.GetTheme();
            if (IsDarkTheme = theme.GetBaseTheme() == BaseTheme.Dark)
            {
                IsDarkTheme = false;
                theme.SetBaseTheme(Theme.Light);
            }
            else
            {
                IsDarkTheme = true;
                theme.SetBaseTheme(Theme.Dark);
            }
            paletteHelper.SetTheme(theme);
        }

        private void exitApp(object sender, RoutedEventArgs e)
        {
            //To close
            Application.Current.Shutdown();
        }

        protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonDown(e);
            DragMove();
        }
        #endregion

        private void loginClick(object sender, RoutedEventArgs e)
        {
            //check connection state
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }

            //check user input before login
            if (!AllowLogin())
                return;

            //get data from table to compare/find out existing account
            if (!VerifyUser(txtUsername.Text, txtPassword.Password))
            {
                MessageBox.Show("Login Successfully!", "Congrats", MessageBoxButton.OK, MessageBoxImage.Information);
                MainWindow = new MainWindow();
                MainWindow.Show();
            }
            else
            {
                MessageBox.Show("Username or password is incorrect", "Error", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private bool VerifyUser(string userName, string userPass)
        {
            con.Open();
            com.Connection = con;
            com.CommandText = "select userStatus from userAccount where userName ='"+userName+"' and userPass='"+userPass+"'";
            dr = com.ExecuteReader();
            if (dr.Read())
            {
                if (Convert.ToBoolean(dr["userStatus"]) == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else 
            {
                return false;
            }
        }

        private bool AllowLogin()
        {
            if (txtUsername.Text.Trim() == "")
            {
                MessageBox.Show("Enter your userName", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                txtUsername.Focus();
                return false; //exit when user dont want to enter data
            }
            if (txtPassword.Password.Trim() == "")
            {
                MessageBox.Show("Enter your password", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                txtPassword.Focus();
                return false;
            }

            return true;
        }

        private void signupClick(object sender, RoutedEventArgs e)
        {
            Signup = new Signup();
            Signup.Show();
        }
    }
}
