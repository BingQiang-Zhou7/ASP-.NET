<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{margin:auto;width:1000px;text-align:center;}
    </style>
</head>
<body>
    <form runat="server" style="margin:10%">
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Selected="True" Value="0">please select province</asp:ListItem>
        <asp:ListItem Value="1">Hunan</asp:ListItem>
        <asp:ListItem Value="2">Shandong</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem Selected="True" Value="0">please select city</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="Submit" runat="server" OnClick="Submit_Click" Text="submit" />
    </form>
</body>
</html>
