<%@ Page Title="Home " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameShop.aspx.cs" Inherits="GameShop._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <div class="jumbotron">
        <h1 style="margin-bottom:50px">Game Shop</h1>
        <p class="lead">
            Witaj na stronie głównej Game Shop! <br />Kliknij przycisk poniżej aby przejść do bazy gier.
        </p>
        <a style="font-size:22px;" href="BazaGier" class="btn btn-primary">Przeglądaj gry &raquo;</a>&nbsp;

       <img src="/Content/gamepad.png" alt="GameShop" style="width:300px;height:300px;position:absolute;left:700px;bottom:240px;" />

    </div>
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

            

        </LoggedInTemplate>

    </asp:LoginView>
 

</asp:Content>
