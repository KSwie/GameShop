<%@ Page Title="Rejestracja" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rejestracja.aspx.cs" Inherits="GameShop.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p style="font-size:25px;margin-top:20px;"><b>Załóż konto Game Shop</b></p>
    <div style="display:inline;">

            <div>
            Login:<br />
            <asp:TextBox ID="login" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="To pole nie może byc puste!" ControlToValidate="login"></asp:RequiredFieldValidator>


            <br /><br />Hasło:<br />
            <asp:TextBox ID="haslo" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="To pole nie może byc puste!" ControlToValidate="haslo"></asp:RequiredFieldValidator>

                <br /><br />Potwierdz hasło:<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ErrorMessage="To pole nie może byc puste!" ControlToValidate="haslo"></asp:RequiredFieldValidator>

             <asp:CompareValidator ID="CompareValidator1" runat="server" 
                 ErrorMessage="Hasła nie są identyczne!" ControlToValidate="haslo" 
                    ControlToCompare="TextBox1" Type="String"></asp:CompareValidator></div>
    
    
        <div>
            <br /><br />Imię:<br />
            <asp:TextBox ID="imie" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="To pole nie może byc puste!" ControlToValidate="imie"></asp:RequiredFieldValidator>

            <br /><br />Nazwisko:<br />
            <asp:TextBox ID="nazwisko" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="To pole nie może byc puste!" ControlToValidate="nazwisko"></asp:RequiredFieldValidator>

            <br /><br />Email:<br />
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="To pole nie może byc puste!" ControlToValidate="email"></asp:RequiredFieldValidator>

            <br /><br />Telefon:<br />
            <asp:TextBox ID="telefon" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="To pole nie może byc puste!" ControlToValidate="telefon"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ControlToValidate="telefon" ID="RegularExpressionValidator1" runat="server" ValidationExpression="^\d+$" ErrorMessage="Dozwolone tylko cyfry!"></asp:RegularExpressionValidator>
            <br /><br />Adres zamieszkania:<br />
            <asp:TextBox ID="adres" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ErrorMessage="To pole nie może byc puste!" ControlToValidate="adres"></asp:RequiredFieldValidator>
        </div>

    </div>
    
    


    <br /><asp:Button ID="rejestracja" runat="server" Text="Zarejestruj" style="margin-top:20px;" OnClick="dalej_Click"/>
</asp:Content>
