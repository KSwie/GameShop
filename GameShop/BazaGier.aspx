<%@ Page Title="Baza " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BazaGier.aspx.cs" Inherits="GameShop.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="/CSS/GridViewStyle.css"/>
    <h2>Baza gier</h2>

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

<p>Wyszukaj grę w bazie:</p>
            <br />
    <asp:TextBox style="font-size:24px;padding-left:37px;margin-bottom:15px;" ID="wpiszNazwe" runat="server" placeholder="&#x1F50D; Szukaj gry" Width="247px"></asp:TextBox>
    
    <asp:Label style="margin-left:20%;" ID="Label1" runat="server" Text="Filtruj według:"></asp:Label>
    
    <asp:DropDownList ID="listaFiltr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="listaFiltr_SelectedIndexChanged">
        <asp:ListItem Selected="True"></asp:ListItem>
        <asp:ListItem>Kategoria</asp:ListItem>
        <asp:ListItem>Platforma</asp:ListItem>
        <asp:ListItem>Cena</asp:ListItem>
    </asp:DropDownList>
    
    <asp:CheckBoxList style="margin-left:30%;position:fixed;" ID="CheckBoxList1" AutoPostBack="True" runat="server" DataTextField="Kategoria" DataValueField="Kategoria" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"></asp:CheckBoxList>

    <p>
        <asp:Button ID="szukajGry" runat="server" Text="Szukaj" class="btn btn-default" OnClick="szukajGry_Click" />
    </p>

    <p>Spis wszystkich gier:</p>
    <asp:GridView style="font-size:20px;" ID="ListaGier" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnSelectedIndexChanged="ListaGier_SelectedIndexChanged" AutoGenerateSelectButton="true" AllowPaging="true" PageSize="8" OnPageIndexChanging="ListaGier_PageIndexChanging"

                      CssClass="Grid"                    

                      AlternatingRowStyle-CssClass="alt"

                      PagerStyle-CssClass="pgr" >
        <Columns>
            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa gry" SortExpression="Nazwa" />
            <asp:BoundField DataField="Kategoria" HeaderText="Kategoria" SortExpression="Kategoria" />
            <asp:BoundField DataField="Srednia_ocena" HeaderText="Średnia ocena" SortExpression="Srednia_ocena" />
            <asp:BoundField DataField="Platforma" HeaderText="Platforma" SortExpression="Platforma" />
            <asp:BoundField DataField="Cena_kupna" HeaderText="Cena" SortExpression="Cena_kupna" />
        </Columns>
    </asp:GridView>


          <br /><asp:Label   style="position:absolute;left:50%;bottom:43%;" ID="confirm" runat="server" Text="Czy na pewno chcesz zamówić ten produkt?" ></asp:Label><br />
          <asp:Button style="position:absolute;left:46%;bottom:33%;"  ID="tak" runat="server" Text="Tak" class="btn btn-success" OnClick="tak_Click"/>
          <asp:Button style="position:absolute;left:61%;bottom:33%;"  ID="nie" runat="server" Text="Nie" class="btn btn-danger" OnClick="nie_Click"/>

            <div id="dialog" style="font-size:50px;margin-left: auto; margin-right: auto; text-align: center;margin-top:-10%;">
                 <asp:Label class="alert alert-success" ID="Okno" runat="server" Text="Okno dialogowe"></asp:Label>
            </div>
        

        </LoggedInTemplate>

    <AnonymousTemplate>

    <p>Wyszukaj grę w bazie:</p>
        <br />
    <asp:TextBox style="font-size:24px;padding-left:37px;margin-bottom:15px;" ID="wpiszNazwe" runat="server" placeholder="&#x1F50D; Szukaj gry" Width="247px"></asp:TextBox>
    
    <asp:Label style="margin-left:20%;" ID="Label1" runat="server" Text="Filtruj według:"></asp:Label>
    
    <asp:DropDownList ID="listaFiltr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="listaFiltr_SelectedIndexChanged">
        <asp:ListItem Selected="True"></asp:ListItem>
        <asp:ListItem>Kategoria</asp:ListItem>
        <asp:ListItem>Platforma</asp:ListItem>
        <asp:ListItem>Cena</asp:ListItem>
    </asp:DropDownList>
    
    <asp:CheckBoxList style="margin-left:30%;position:fixed;" ID="CheckBoxList1" AutoPostBack="True" runat="server" DataTextField="Kategoria" DataValueField="Kategoria" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"></asp:CheckBoxList>

    <p>
        <asp:Button ID="szukajGry" runat="server" Text="Szukaj" class="btn btn-default" OnClick="szukajGry_Click" />
    </p>

    <p>Spis wszystkich gier:</p>
    <asp:GridView style="font-size:20px;" ID="ListaGier" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="true" PageSize="8" OnPageIndexChanging="ListaGier_PageIndexChanging"

                      CssClass="Grid"                    

                      AlternatingRowStyle-CssClass="alt"

                      PagerStyle-CssClass="pgr" >
        <Columns>
            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa gry" SortExpression="Nazwa" />
            <asp:BoundField DataField="Kategoria" HeaderText="Kategoria" SortExpression="Kategoria" />
            <asp:BoundField DataField="Srednia_ocena" HeaderText="Średnia ocena" SortExpression="Srednia_ocena" />
            <asp:BoundField DataField="Platforma" HeaderText="Platforma" SortExpression="Platforma" />
            <asp:BoundField DataField="Cena_kupna" HeaderText="Cena" SortExpression="Cena_kupna" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="confirm" runat="server"></asp:Label>
     <asp:Button ID="tak" runat="server"/>
        <asp:Button ID="nie" runat="server"/>

        <div id="dialog" style="font-size:50px;margin-left: auto; margin-right: auto; text-align: center;margin-top:-10%;">
                 <asp:Label class="alert alert-success" ID="Okno" runat="server" Text="Okno dialogowe"></asp:Label>
            </div>

    </AnonymousTemplate>

</asp:LoginView>

</asp:Content>
