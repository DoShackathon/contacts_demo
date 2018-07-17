using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ContactsDAL;
using System.Data;
using System.Data.Entity;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Diagnostics;

namespace ContactsWebApp.pages
{
    public partial class ContactSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // make the connection to the database

        }
        private static async Task<ContactsDAL.Contact> GetContacts_OLD()
        {
            ContactsDAL.Contact myContact = null;
            using (var context = new ContactsDBEntities())
            {
                Console.WriteLine("Start GetContact...");
                myContact = await (context.Contacts.Where(s => s.ContactId == 1).FirstOrDefaultAsync<ContactsDAL.Contact>());
                Console.WriteLine("Finished GetContact...");
            }
            return myContact;
        }

        private static IList<ContactsDAL.Contact> GetContacts(string fn, string ln , string mn )
        {
            if (string.IsNullOrEmpty(fn)) fn = null;
            if (string.IsNullOrEmpty(ln)) ln = null;
            if (string.IsNullOrEmpty(mn)) mn = null;

            IList<ContactsDAL.Contact> tempContacts;
            using (var context = new ContactsDBEntities())
            {
                Console.WriteLine("Start GetContact...");

                var query = context.Contacts
                    .Where(s => s.FirstName.Contains(fn) ||
                                s.LastName.Contains(ln) ||
                                s.MiddleName.Contains(mn));

                // var sql = ((System.Data.Entity.Core.Objects.ObjectQuery)query).ToTraceString();

                tempContacts = query.ToList<ContactsDAL.Contact>();

                Debug.WriteLine(query.ToString());

            }
            return tempContacts;
        }
        protected void btnSearchClick(object sender, EventArgs e)
        {

            // make the connection to the database
            string strFirstName = this.txtFirstName.Text;
            string strLastName = this.txtLastName.Text;
            string strMiddleName = this.txtMiddleName.Text;

            var myContact = ContactSearch.GetContacts(strFirstName, strLastName, strMiddleName);
           
            var firstContact = myContact;

            this.grdvwSearchResults.DataSource = firstContact;
            this.grdvwSearchResults.DataBind();
        }

        protected void btnNewClick(object sender, EventArgs e)
        {
         List<ContactsDAL.Contact> contacts  = new List<ContactsDAL.Contact>();
            contacts.Add(new ContactsDAL.Contact());
            Session["tempContact"] = contacts;
            Response.Redirect("/Pages/ContactDetails.aspx");
        }
        protected void grdvwSearchResults_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Select":
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    int selIndex = row.RowIndex;

                    string tempContactID = (string)grdvwSearchResults.DataKeys[selIndex].Values[1].ToString();

                    var contactId = int.Parse(tempContactID);
                    using (var context = new ContactsDBEntities())
                    {
                       var query = context.Contacts
                            .Where(s => s.ContactId == contactId);

                        Session["tempContact"] = query.ToList();

                        Debug.WriteLine(query.ToString());
                    }
                    Server.Transfer("ContactDetails.aspx");
                    break;
                default:
                    break;
            }
        }

        protected void grdvwSearchResults_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Get the value of column from the DataKeys using the RowIndex.
            int contactId = Convert.ToInt32(this.grdvwSearchResults.DataKeys[e.NewEditIndex].Values[0]);

            using (var context = new ContactsDBEntities())
            {
                var query = context.Contacts
                     .Where(s => s.ContactId == contactId);

                Session["tempContact"] = query.ToList();

                Debug.WriteLine(query.ToString());

            }
            Response.Redirect ("/Pages/ContactDetails.aspx");
        }
    }
}
    