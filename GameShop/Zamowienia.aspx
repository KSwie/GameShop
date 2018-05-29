<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zamowienia.aspx.cs" Inherits="GameShop.Zamowienia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/CSS/GridViewStyle.css"/>
    <title></title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--Aby dowiedzieć się więcej o skryptach grupowania w programie ScriptManager, zobacz https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Skrypty struktury--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Skrypty witryny--%>
            </Scripts>
        </asp:ScriptManager>

        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                <div class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" runat="server" href="~/GameShop">Game Shop</a>
                        </div>
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li><a runat="server" href="~/BazaGier">Przeglądaj gry</a></li>
                                <li><a runat="server" href="~/MojeKonto">Moje konto</a></li>
                                <li><a runat="server" href="~/Zamowienia">Zamówienia</a></li>
                                <li><a runat="server" href="~/LogOut.aspx" >Wyloguj</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="jumbotron" style="width:80%;margin: 0 auto;margin-top:3%;text-align:center;">       
                <asp:Label style="font-size:35px;" ID="Label1" runat="server" Text="Zamówienia użytkownika:"></asp:Label>
                    <asp:Label style="font-size:35px;" ID="user" runat="server" Text="imie"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView style="margin: 0 auto;" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="true" PageSize="8" OnPageIndexChanging="GridView1_PageIndexChanging"

                      CssClass="Grid"                    

                      AlternatingRowStyle-CssClass="alt"

                      PagerStyle-CssClass="pgr" >

                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="Numer zamówienia" />
                            <asp:BoundField DataField="Data" HeaderText="Data" />
                            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa produktu" />
                            <asp:BoundField DataField="Platforma" HeaderText="Platforma" />
                            <asp:BoundField DataField="Cena_kupna" HeaderText="Cena" />
                        </Columns>

                    </asp:GridView>

                    <asp:Label style="font-size:25px;" ID="tekst" runat="server" Text=""></asp:Label>
                </div>

            </LoggedInTemplate>
            
        </asp:LoginView>

        <footer style="position:relative;bottom:0;width:100%;padding-left:8%;padding-top:40px;">
            <p>&copy; <%: DateTime.Now.Year %> - GAME SHOP - Kamil Świętochowski</p>
        </footer>
    </form>
</body>
</html>