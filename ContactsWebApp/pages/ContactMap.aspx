<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactMap.aspx.cs" Inherits="ContactsWebApp.pages.ContactMap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br />
     <div id="map-canvas" style="width:800px; height: 800px">test</div>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script> 
        
        function initialize() {
            var myLatlng = new google.maps.LatLng(-25.363882, 131.044922);
            var mapOptions = {
                zoom: 4,
                center: myLatlng
            }

            var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Vivek\'s brand spanking new abode!'
            });
        }

        //google.maps.event.addDomListener(window, 'load', initialize);

        function pageLoad() {
            initialize();
        }

        </script>
</asp:Content>
