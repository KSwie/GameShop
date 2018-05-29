<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logowanie.aspx.cs" Inherits="GameShop.strona" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p style="font-size:25px;margin-top:20px;"><b>Zaloguj sie do konta Game Shop:</b></p>

    <asp:Label ID="Label1" runat="server" Text="Login:"></asp:Label><br />
    <asp:TextBox ID="login" runat="server"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Wpisz login" ControlToValidate="login" ></asp:RequiredFieldValidator>
    <!-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
        ErrorMessage="Login musi się składać tylko liter oraz cyfr oraz mieć min 3 i max 32 znaki" 
        ValidationExpression="([0-9]$)([a-zA-Z]){3,32}" ControlToValidate="login"></asp:RegularExpressionValidator>-->

    <br /><br /><asp:Label ID="Label2" runat="server" Text="Hasło:"></asp:Label><br />
    <asp:TextBox ID="haslo" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Wpisz hasło" ControlToValidate="haslo"></asp:RequiredFieldValidator>
    <!--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Hasło musi mieć min 4 i max 16 znaków oraz 1 cyfre" ControlToValidate="haslo" 
        ValidationExpression="^(?=.*\d).{4,16}$"></asp:RegularExpressionValidator>-->

    <br />
    &nbsp;


    <br /><asp:Button ID="logowanie" runat="server" Text="Zaloguj" style="margin-top:10px;" OnClick="logowanie_Click"/>
    <br />
    <br />
    <br />

    <asp:Label ID="Label3" runat="server" Text="Nie masz konta?"></asp:Label>
    <br />
    <a style="font-size:15px;" href="Rejestracja.aspx" class="btn btn-primary">Zarejestruj się! &raquo;</a>&nbsp;



    <div id="dialog" style="font-size:50px;margin-left: auto; margin-right: auto; text-align: center;margin-top:-10%;">
                 <asp:Label class="alert alert-success" ID="Okno" runat="server" Text="Okno dialogowe"></asp:Label>
            </div>
</asp:Content>

