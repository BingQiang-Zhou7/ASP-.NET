<%--设计一个密码输入的验证网页。
输入界面中包括姓名、密码、重复密码、E-Mail等项。
若输入完整、正确时，转向另一个网页；否则，分别显示错误信息，并汇总显示错误信息。
假定密码是123456.--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication4.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{margin:auto;width:1000px;text-align:center;}
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align:left;">
        <p>Account</p>
        <asp:TextBox ID="Account" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Account" 
            runat="server" ErrorMessage="Account cannot be empty！" ForeColor="Red"></asp:RequiredFieldValidator>
        <p>Password</p>
        <asp:TextBox ID="Password1" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Password1" 
            runat="server" ErrorMessage="Password cannot be empty！" ForeColor="Red"></asp:RequiredFieldValidator>
        <p>Comfirm Password</p>
        <asp:TextBox ID="Password2" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Password2" 
            runat="server" ErrorMessage="Comfirm password cannot be empty！" ForeColor="Red"></asp:RequiredFieldValidator>
        <p>E-Mail</p>
        <asp:TextBox ID="Email" TextMode="Email" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="Email" 
            runat="server" ErrorMessage="Email cannot be empty！" ForeColor="Red"></asp:RequiredFieldValidator>
        <p></p>
        <asp:CompareValidator ID="CompareValidator1" ControlToCompare="Password1" 
            ControlToValidate="Password2" runat="server" ErrorMessage="Passwords are inconsistent！" ForeColor="Red"></asp:CompareValidator>
        <p></p>
        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
        <p></p>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
    </form>
</body>
</html>
