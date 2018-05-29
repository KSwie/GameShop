<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MojeKonto.aspx.cs" Inherits="GameShop.MojeKonto" %>

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

            <div class="jumbotron" style="width:90%;margin: 0 auto;font-size:25px; text-align:center;">
                <asp:Label ID="Label1" style="font-size:40px;" runat="server" Text="Konto użytkownika:"></asp:Label>
                <asp:Label ID="dane" style="font-size:40px;" runat="server" Text="dane"></asp:Label>

                <br /><br />
                <asp:GridView style="margin: 0 auto;" ID="mojeDane" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="8" OnPageIndexChanging="mojeDane_PageIndexChanging" CssClass="Grid" AlternatingRowStyle-CssClass="alt"   PagerStyle-CssClass="pgr" >

                    <Columns>
                        <asp:BoundField DataField="Login" HeaderText="Login"></asp:BoundField>
                        <asp:BoundField DataField="Imie_nazwisko" HeaderText="Imie i nazwisko"></asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Adres email"></asp:BoundField>
                        <asp:BoundField DataField="Telefon" HeaderText="Telefon"></asp:BoundField>
                        <asp:BoundField DataField="Adres" HeaderText="Adres zamieszkania"></asp:BoundField>
                        <asp:BoundField DataField="Miasto" HeaderText="Miasto"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>

            <div style="margin-top:2%;">
                <asp:Button style="margin-left:9%;" class="btn btn-info" ID="Button1" runat="server" Text="Zmień adres email" OnClick="Button1_Click" />
                <br />
               <br />
                <asp:Button style="margin-left:9%;" class="btn btn-info" ID="Button2" runat="server" Text="Zmień numer telefonu" OnClick="Button2_Click" />
                <br />
                <br />
                <asp:Button style="margin-left:9%;" class="btn btn-info" ID="Button3" runat="server" Text="Zmień adres zamieszkania" OnClick="Button3_Click" />
                
                  <br />
                <br />
                
                  <asp:Button style="margin-left:9%;" class="btn btn-info" ID="Button4" runat="server" Text="Zmień miasto" OnClick="Button4_Click" />

                <asp:TextBox style="font-size:20px;width:400px;margin-left:20%;position:absolute;bottom:25%;" ID="email" runat="server" placeholder="Wpisz nowy email"></asp:TextBox>
                
                <asp:TextBox style="font-size:20px;width:400px;margin-left:20%;position:absolute;bottom:25%;"  ID="nr" runat="server" placeholder="Wpisz nowy nr telefonu"></asp:TextBox>
                
                <asp:TextBox style="font-size:20px;width:400px;margin-left:20%;position:absolute;bottom:25%;" ID="adres" runat="server" placeholder="Wpisz nowy adres"></asp:TextBox>
                
                <asp:TextBox style="font-size:20px;width:400px;margin-left:20%;position:absolute;bottom:25%;" ID="miasto" runat="server" placeholder="Wpisz nowe miasto"></asp:TextBox>
               
                
                <asp:Button style="position:absolute;left:46%;bottom:15%;" class="btn btn-success" ID="Button5" runat="server" Text="Zmień1!" OnClick="Button5_Click" />
                 <asp:Button style="position:absolute;left:46%;bottom:15%;" class="btn btn-success" ID="Button6" runat="server" Text="Zmień2!" OnClick="Button6_Click" />
                 <asp:Button style="position:absolute;left:46%;bottom:15%;" class="btn btn-success" ID="Button7" runat="server" Text="Zmień3!" OnClick="Button7_Click" />
                 <asp:Button style="position:absolute;left:46%;bottom:15%;" class="btn btn-success" ID="Button8" runat="server" Text="Zmień4!" OnClick="Button8_Click" />

                </div>


            <div id="dialog" style="font-size:50px;margin-left: auto; margin-right: auto; text-align: center;margin-top:-10%;">
                 <asp:Label class="alert alert-success" ID="Okno" runat="server" Text="Okno dialogowe"></asp:Label>
            </div>
               


            </LoggedInTemplate>
            
        </asp:LoginView>

        <footer style="position: relative; bottom: 0; width: 100%; padding-left: 8%; padding-top: 40px;margin-top:10%;">
            <p>&copy; <%: DateTime.Now.Year %> - GAME SHOP - Kamil Świętochowski</p>
        </footer>
    </form>
</body>
</html>