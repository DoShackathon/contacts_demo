<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactDetails.aspx.cs" Inherits="ContactsWebApp.pages.ContactDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <style>
        .imgClass {
            width: 250px;
        }

        .form-label {
            font-weight: 600;
        }
    </style>

    <table id="Table1" style="width: 700px;" class="table table-bordered">
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="First Name:" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtFirstName" name="txtFirstName" />

            </td>
            <td rowspan="15" >
                <asp:Image ID="Image1" runat="server" CssClass="imgClass" /></td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Middle Name:" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMiddleName" name="txtMiddleName" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Last Name:" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtLastName" name="txtLastName" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Email: " runat="server" /></td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" name="txtEmail" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Mobile Phone: " runat="server" /></td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMobilePhone" name="txtMobilePhone" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Work Phone: " runat="server" /></td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtWorkPhone" name="txtWorkPhone" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Home Phone: " runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtHomePhone" name="txtHomePhone" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Address Line1: " runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtAddressLine1" name="txtAddressLine1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Address Line2: " runat="server" /></td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtAddressLine2" name="txtAddressLine2" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="City: " runat="server" /></td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtCity" name="txtCity" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="State: " runat="server" /></td>
            <td>
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlState" name="ddlState" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Country: " runat="server" /></td>
            <td>
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCountry" name="ddlCountry" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Zip: " runat="server" /></td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtZip" name="txtZip" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Latitude: " runat="server" /></td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtLatitude" name="txtLatitude" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label CssClass="form-label" Text="Longitude:" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtLongitude" name="txtLongitude" />
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <input type="button" value="Save" class="btn btn-success" onclick="var geocoder = new google.maps.Geocoder(); geocodeAddress(geocoder, '');" />
                <asp:Button Text="Save" ID="btnSave" name="btnSave" runat="server" OnClick="btnSave_Click" />
                <input type="button" value="Cancel" class="btn btn-warning" onclick="document.location = 'ContactSearch.aspx'" />

            </td>
        </tr>
    </table>

    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
        Show Map</button>
    <script>
        function initialize() {
            debugger;
            var q1 = document.getElementById('<%= this.txtLatitude.ClientID%>').value;
            var q2 = document.getElementById('<%= this.txtLongitude.ClientID%>').value;
            var myLatlng = new google.maps.LatLng(q1, q2);
            var mapOptions = {
                zoom: 8,
                center: myLatlng
            }
            var map = new google.maps.Map(document.getElementById('idfrm'), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: '' + q1 + ',' + q2 + ''
            });
        }

    </script>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog" style="width: 700px">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">

                    <div id="idfrm" style="height: 650px; width: 650px"></div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBlYCA5i1qspy7qsWHS6F0x1QzxrGS_zj4"></script>
    <script>
            //document.getElementById('<% = this.FileUpload1.ClientID %>').onchange = function () {  __doPostBack('ctl00$MainContent$btnSave', ''); }; //"";
        document.getElementById('<% = this.btnSave.ClientID %>').style.display = 'none';

        function geocodeAddress(geocoder, resultsMap) {

            var address = document.getElementById('<% = this.txtAddressLine1.ClientID %>').value + ', ' +
                document.getElementById('<% = this.txtAddressLine2.ClientID %>').value + ', ' +
                document.getElementById('<% = this.txtCity.ClientID %>').value + ', ' +
                document.getElementById('<% = this.ddlState.ClientID %>').value + ', ' +
                document.getElementById('<% = this.ddlCountry.ClientID %>').value + ', ' +
                document.getElementById('<% = this.txtZip.ClientID %>').value;

            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === 'OK') {
                    document.getElementById('<% = this.txtLatitude.ClientID %>').value = results[0].geometry.location.lat();
                    document.getElementById('<% = this.txtLongitude.ClientID %>').value = results[0].geometry.location.lng();
                    new Promise((res, rej) => {
                        <%= this.getPostbackOptions() %>;
                        res();
                    }).then(() => { alert("Save completed!"); });
                }
                else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }

        function geocodeAddress_orig(geocoder, resultsMap) {

            var address = document.getElementById('<% = this.txtAddressLine1.ClientID %>').value + ', ' +
                document.getElementById('<% = this.txtAddressLine2.ClientID %>').value + ', ' +
                document.getElementById('<% = this.txtCity.ClientID %>').value + ', ' +
                document.getElementById('<% = this.ddlState.ClientID %>').value + ', ' +
                document.getElementById('<% = this.ddlCountry.ClientID %>').value + ', ' +
                document.getElementById('<% = this.txtZip.ClientID %>').value;

            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status === 'OK') {
                    document.getElementById('<% = this.txtLatitude.ClientID %>').value = results[0].geometry.location.lat();
                    document.getElementById('<% = this.txtLongitude.ClientID %>').value = results[0].geometry.location.lng();
                    <%= this.getPostbackOptions() %>;
                    alert("Save completed!");
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
    </script>
    <!-- 
    <div style="width: 10%; border: 1px solid #ededed; background: #c9cdce; position: fixed; bottom: 10px; left: 10px; padding: 5px">
        <input type="button" value="Save" class="btn btn-success" onclick="var geocoder = new google.maps.Geocoder(); geocodeAddress(geocoder, '');" />
        <asp:Button Text="Save" ID="Button1" name="btnSave" Visible="false" runat="server" OnClick="btnSave_Click" Width="0px" />
        <input type="button" value="Cancel" class="btn btn-warning" onclick="document.location = 'ContactSearch.aspx'" />
    </div>
        -->
    <script>
        document.getElementById('<% = this.btnSave.ClientID %>').style.display = 'none';

        $('#myModal').on('shown.bs.modal', function () {
            initialize();
        });

    </script>
</asp:Content>