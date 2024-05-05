using ChatApp.CustomControls;
using ChatApp.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChatApp.ViewModels
{
    public class ViewModel: INotifyPropertyChanged
    {
        #region MainWindow

        #region Properties
        public string ContactName { get; set; }
        public Uri ContactPhoto { get; set; }
        public string LastSeen { get; set; }
        #endregion

        #endregion

        #region Status Thumbs
        #region Properties
        public ObservableCollection<StatusDataModel> statusThumbsCollection { get; set; }
        #endregion
        #region Logics
        void LoadStatusThumbs()
        {
            statusThumbsCollection = new ObservableCollection<StatusDataModel>()
            {
                //Since we want to keep first status blank for the user to add own status
                new StatusDataModel{
                    IsMeAddStatus=true
                },

                new StatusDataModel{
                    ContactName= "Mike",
                    ContactPhoto= new Uri("/assets/1.png", UriKind.RelativeOrAbsolute),
                    StatusImage= new Uri("/assets/5.jpg", UriKind.RelativeOrAbsolute),
                    IsMeAddStatus= false
                },

                new StatusDataModel{
                    ContactName= "Steve",
                    ContactPhoto= new Uri("/assets/2.jpg", UriKind.RelativeOrAbsolute),
                    StatusImage= new Uri("/assets/8.jpg", UriKind.RelativeOrAbsolute),
                    IsMeAddStatus= false
                },

                new StatusDataModel{
                    ContactName= "Will",
                    ContactPhoto= new Uri("/assets/3.jpg", UriKind.RelativeOrAbsolute),
                    StatusImage= new Uri("/assets/5.jpg", UriKind.RelativeOrAbsolute),
                    IsMeAddStatus= false
                },

                new StatusDataModel{
                    ContactName= "John",
                    ContactPhoto= new Uri("/assets/5.jpg", UriKind.RelativeOrAbsolute),
                    StatusImage= new Uri("/assets/3.jpg", UriKind.RelativeOrAbsolute),
                    IsMeAddStatus= false
                },
            };
            OnPropertyChanged("statusThumbsCollection");
        }
        #endregion

        #endregion

        #region Chats List
        #region Properties
        public ObservableCollection<ChatListData> Chats { get; set; }
        #endregion

        #region Logics
        void LoadChats()
        {
            Chats = new ObservableCollection<ChatListData>()
            {
                new ChatListData{ 
                ContactName = "Billy",
                ContactPhoto = new Uri("/assets/6.jpg", UriKind.RelativeOrAbsolute),
                Message = "Hey, What's up?",
                LastMessageTime = "Tue, 12:58 PM",
                ChatIsSelected = true
                },
                new ChatListData{
                ContactName = "Mike",
                ContactPhoto = new Uri("/assets/1.png", UriKind.RelativeOrAbsolute),
                Message = "Hey, What's up?",
                LastMessageTime = "Tue, 12:58 PM"
                },
                new ChatListData{
                ContactName = "Steve",
                ContactPhoto = new Uri("/assets/7.png", UriKind.RelativeOrAbsolute),
                Message = "Hey, What's up?",
                LastMessageTime = "Tue, 12:58 PM"
                },
                new ChatListData{
                ContactName = "John",
                ContactPhoto = new Uri("/assets/8.jpg", UriKind.RelativeOrAbsolute),
                Message = "Hey, What's up?",
                LastMessageTime = "Tue, 12:58 PM"
                },
            };
            OnPropertyChanged();
        }
        #endregion

        #endregion

        #region Conversations

        #region Properties
        public ObservableCollection<ChatConversation> Conversations;
        #endregion

        #region Logics
        void LoadChatConversation()
        {
            //Since the conversation data is big I will be using database containing contact details & conversations instead...
            //        I will provide you with database file link in Description
            if (connection.State == System.Data.ConnectionState.Closed)
                connection.Open();
            if (Conversations == null)
                Conversations = new ObservableCollection<ChatConversation>();
            using (SqlCommand com = new SqlCommand("Select * from conversations where ContactName='Mike'", connection))
            {
                using (SqlDataReader reader = com.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        //to set date format
                        // Like this Jun 15, 01:15 PM = MMM dd, hh:mm tt
                        //this is how it works:
                        //Condition ? True : False

                        //Like if(condition)
                        //  true;
                        //else
                        //  false;

                        string MsgReceivedOn = !string.IsNullOrEmpty(reader["MsgReceivedOn"].ToString()) ? Convert.ToDateTime(reader["MsgReceivedOn"].ToString()).ToString("MMM dd, hh:mm tt") : "";

                        string MsgSentOn = !string.IsNullOrEmpty(reader["MsgSentOn"].ToString()) ? Convert.ToDateTime(reader["MsgSentOn"].ToString()).ToString("MMM dd, hh:mm tt") : "";

                        var conversation = new ChatConversation()
                        {
                            ContactName = reader["ContactName"].ToString(),
                            ReceivedMessage = reader["ReceivedMsgs"].ToString(),
                            MsgReceivedOn = MsgReceivedOn,
                            SentMessage = reader["SentMsgs"].ToString(),
                            MsgSentOn = MsgSentOn,
                            IsMessageReceived = string.IsNullOrEmpty(reader["ReceivedMsgs"].ToString()) ? false : true
                        };
                        Conversations.Add(conversation);
                        OnPropertyChanged("Conversations");
                    }
                }
            }

        }
        #endregion

        #endregion

        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\ADMIN\Desktop\Database1.mdf;Integrated Security=True");
        public ViewModel()
        {
            LoadStatusThumbs();
            LoadChats();
            LoadChatConversation();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged([System.Runtime.CompilerServices.CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
