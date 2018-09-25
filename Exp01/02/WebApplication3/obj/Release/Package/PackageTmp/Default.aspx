<%--创建多个网页，在其中一个网页中输入姓名和密码，
要求当转移到其它页面时，这个姓名和密码将自动显示到新的网页中。
提示：使用Session。--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{margin:auto;width:1000px;text-align:center;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>Account</p>
        <asp:TextBox ID="Account" runat="server"></asp:TextBox>
        <p>Password</p>
        <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox>
        <p></p>
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
    </form>
</body>
</html>
