using MaterialDesignThemes.Wpf;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ChatApp
{
    /// <summary>
    /// Interaction logic for Signup.xaml
    /// </summary>
    public partial class Signup : Window
    {
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
        public Signup()
        {
            InitializeComponent();
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString();
        }
        #region form handling
        public bool IsDarkTheme { get; set; }
        public object DataClassesContext { get; private set; }
        public MainWindow MainWindow { get; private set; }

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

        private void userSignup(object sender, RoutedEventArgs e)
        {
            //check connection state
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
            //check null field
            if (!AllowSignup())
                return;
        }

        private void clearFields(object sender, RoutedEventArgs e)
        {
            txtUserid.Text = "";
            txtUsername.Text = "";
            txtPassword.Password = "";
            txtUserstatus.Text = "";

        }
        private bool VerifyUser(int userID, string userName, string userPass, bool userStatus)
        {
            con.Open();
            com.Connection = con;
            com.CommandText = "select userStatus from userAccount where userName ='" + userName + "' and userPass='" + userPass + "'";
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

        private bool AllowSignup()
        {
            if (txtUserid.Text.Trim() == "")
            {
                MessageBox.Show("Enter your userID", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                txtUserid.Focus();
                return false; //exit when user dont want to enter data
            }
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
            if (txtUserstatus.Text.Trim() == "")
            {
                MessageBox.Show("Enter your status false/true", "Warning", MessageBoxButton.OK, MessageBoxImage.Warning);
                txtUserstatus.Focus();
                return false; //exit when user dont want to enter data
            }

            return true;
        }
    }
}
