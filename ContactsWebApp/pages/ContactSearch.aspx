<%@ Page EnableViewState="false" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactSearch.aspx.cs" Inherits="ContactsWebApp.pages.ContactSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <style>
        .boldLabel {
            font-weight: bolder;
        }

        .centerText {
            text-align: center;
        }

        .bkcolor {
            background-color: #d4e6dc;
        }

        .bkcolor1 {
            background-color: #daa93b73;
        }
    </style>
    <asp:Table ID="Table1" runat="server" Width="685px" CssClass="table-bordered table">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label Text="First Name:" runat="server" CssClass="boldLabel" />
                <asp:TextBox runat="server" ID="txtFirstName" name="txtFirstName" CssClass="form-control" />
            </asp:TableCell><asp:TableCell>
                <asp:Label Text="Middle Name:" runat="server" CssClass="boldLabel" />
                <asp:TextBox runat="server" ID="txtMiddleName" name="txtMiddleName" CssClass="form-control" />
            </asp:TableCell><asp:TableCell>
                <asp:Label Text="Last Name:" runat="server" CssClass="boldLabel" />
                <asp:TextBox runat="server" ID="txtLastName" name="txtLastName" CssClass="form-control" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="3" CssClass="centerText bkcolor">
                <asp:Button Text="Search"  ID="btnSearch" OnClick="btnSearchClick" name="btnSearch" runat="server" CssClass="btn btn-success" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button Text="New" ID="btnNew" name="btnNew" runat="server" OnClick="btnNewClick" CssClass="btn btn-warning" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />

    <br />
    
        <asp:GridView runat="server" ID="grdvwSearchResults" CssClass="table table-default" name="grdvwSearchResults" Width="685px" AutoGenerateColumns="False"  OnRowCommand="grdvwSearchResults_RowCommand" DataKeyNames="ContactID" OnRowEditing="grdvwSearchResults_RowEditing">
            <Columns>
                <asp:BoundField HeaderText="Contact ID" DataField="ContactID" ReadOnly="True" />
                <asp:BoundField HeaderText="First Name" DataField="FirstName" ReadOnly="True" />
                <asp:BoundField HeaderText="Middle Name" DataField="MiddleName" ReadOnly="True" SortExpression="MiddleName" />
                <asp:BoundField HeaderText="Last Name" DataField="LastName" ReadOnly="True" />
                <asp:ButtonField CommandName="Edit" HeaderText="Edit" ShowHeader="True" Text="Edit" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <a target="_blank" href="/Pages/GoogleMaps.html?q1=<%# DataBinder.Eval(Container.DataItem, "Latitude") %>&q2=<%# DataBinder.Eval(Container.DataItem, "Longitude") %>" onclick="">View Map</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
   
</asp:Content>
