using ContactsDAL;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ContactsWebApp.pages
{
    public partial class ContactDetails : System.Web.UI.Page
    {
        ContactsDAL.Contact contactToBeEdited;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ContactsDAL.Contact> contacts = Session["tempContact"] as List<ContactsDAL.Contact>;
            contactToBeEdited = contacts[0];

            if (!this.IsPostBack)
            {
               this.txtFirstName.Text = contactToBeEdited.FirstName;
                this.txtMiddleName.Text = contactToBeEdited.MiddleName;
                this.txtLastName.Text = contactToBeEdited.LastName;
                this.txtAddressLine1.Text = contactToBeEdited.AddressLine1;
                this.txtAddressLine2.Text = contactToBeEdited.AddressLine2;
                txtLatitude.Text = contactToBeEdited.Latitude;
                txtLongitude.Text = contactToBeEdited.Longitude;

                this.ddlState.Items.Add(new ListItem { Value = "VA", Text = "Virginia" });
                this.ddlState.Items.Add(new ListItem { Value = "MD", Text = "Maryland" });

                this.ddlCountry.Items.Add(new ListItem { Value = "US", Text = "United States of America" });
                try
                {    // image processing
                    // byte[] bytes = (byte[])GetData("SELECT Data FROM tblFiles WHERE Id =" + id).Rows[0]["Data"];
                    using (var context = new ContactsDBEntities())
                    {
                        ContactImage ci1 = context.ContactImages.Where(ci => ci.ImageId == contactToBeEdited.ImageId).First() ;
                        byte[] bytes = ci1.Image;
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        Image1.ImageUrl = "data:image/png;base64," + base64String;
                    }
                      
                } catch(Exception ex)
                {
                    Trace.Write(ex.Message);
                    // nothing happened!
                }

            }
        }
        public string getPostbackOptions()
        {
            // Create a new PostBackOptions object and set its properties.
            PostBackOptions myPostBackOptions = new PostBackOptions(this.btnSave);
            myPostBackOptions.AutoPostBack = true;
            myPostBackOptions.RequiresJavaScriptProtocol = false;
            myPostBackOptions.PerformValidation = false;
            myPostBackOptions.Argument = null;

            // Add the client-side script to the HyperLink1 control.
            return Page.ClientScript.GetPostBackEventReference(myPostBackOptions);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            contactToBeEdited.FirstName = this.txtFirstName.Text;
            contactToBeEdited.MiddleName = txtMiddleName.Text;
            contactToBeEdited.LastName = txtLastName.Text;
            contactToBeEdited.AddressLine1 = txtAddressLine1.Text;
            contactToBeEdited.AddressLine2 = txtAddressLine2.Text;
            contactToBeEdited.Latitude = txtLatitude.Text;
            contactToBeEdited.Longitude = txtLongitude.Text;
            contactToBeEdited.ZipCode = txtZip.Text;
            contactToBeEdited.City = txtCity.Text;
            contactToBeEdited.StateCode = ddlState.SelectedValue;
            contactToBeEdited.CountryCode = ddlCountry.SelectedValue;
            
            using (var context = new ContactsDBEntities())
            {
                ContactImage ci = null ;
                if (Request.Files.Count > 0 && Request.Files[0].ContentLength > 0)
                {
                    ci = new ContactImage();
                    byte[] imageBuffer = new byte[Request.Files[0].ContentLength];
                    Request.Files[0].InputStream.Read(imageBuffer, 0, Request.Files[0].ContentLength);
                    ci.Image = imageBuffer;

                    context.ContactImages.Add(ci);

                    context.SaveChanges();
                }

                if (contactToBeEdited.ContactId != 0)
                {
                    var query = context.Contacts
                         .Where(s => s.ContactId == contactToBeEdited.ContactId);
                    Debug.WriteLine(query.ToString());
                    ContactsDAL.Contact localContact = query.ToList()[0];
                    localContact.FirstName = this.txtFirstName.Text;
                    localContact.MiddleName = this.txtMiddleName.Text;
                    localContact.LastName = this.txtLastName.Text;
                    localContact.AddressLine1 = this.txtAddressLine1.Text;
                    localContact.AddressLine2 = this.txtAddressLine2.Text;
                    localContact.Latitude = this.txtLatitude.Text;
                    localContact.Longitude = txtLongitude.Text;
                    var contactImageItem = context.ContactImages.Where(ci1 => ci1.ImageId == localContact.ImageId).ToList();
                    if (contactImageItem.Count > 0)
                        context.ContactImages.Remove(contactImageItem[0] as ContactImage);
                    if (ci != null) localContact.ImageId = ci.ImageId;

                    context.SaveChanges();
                    if (ci != null)
                    {
                        byte[] bytes = ci.Image;
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        Image1.ImageUrl = "data:image/png;base64," + base64String;
                    }
                }
                else
                {
                    ContactsDAL.Contact localContact = new ContactsDAL.Contact();
                    localContact.FirstName = txtFirstName.Text;
                    localContact.MiddleName = txtMiddleName.Text;
                    localContact.LastName = txtLastName.Text;
                    localContact.AddressLine1 = txtAddressLine1.Text;
                    localContact.AddressLine2 = txtAddressLine2.Text;
                    localContact.Latitude = txtLatitude.Text;
                    localContact.Longitude = txtLongitude.Text;
                    if (ci != null) localContact.ImageId = ci.ImageId;
                    context.Contacts.Add(localContact);
                    context.SaveChanges();
                    if (ci != null)
                    {
                        byte[] bytes = ci.Image;
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        Image1.ImageUrl = "data:image/png;base64," + base64String;
                    }
                    var query = context.Contacts
                         .Where(s => s.ContactId == localContact.ContactId);

                    Session["tempContact"] = query.ToList();
                }
            }

        }
    }
}