﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exp0203</title>
    <style>
        body{margin:auto;margin-top:100px;max-width:1000px;text-align:center;}
        a{color:gray;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center;" >
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestRemoteConnectionString2 %>" SelectCommand="SELECT [TypeName], [TypeID] FROM [Type]"></asp:SqlDataSource>
            <label for="GridView2">Type</label>
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1"
                HorizontalAlign="Center" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="TypeID" HeaderText="TypeID" SortExpression="TypeID" />
                    <asp:BoundField DataField="TypeName" HeaderText="TypeName" SortExpression="TypeName" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle Font-Bold="True" BackColor="#D1DDF1" ForeColor="#333333"/>
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
        <div style="margin-top:20px;">
            <%--<label for="GridView1">List</label>--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField AccessibleHeaderText="Name" DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Number" HeaderText="Number" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:ImageField DataImageUrlField="ImgPath" HeaderText="Picture" DataImageUrlFormatString="http://bingqiangzhou.cn:8080/{0}">
                </asp:ImageField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        </div>
    </form>

</body>
</html>
