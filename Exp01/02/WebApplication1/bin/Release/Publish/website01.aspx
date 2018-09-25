<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="website01.aspx.cs" Inherits="WebApplication1.website01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{margin:auto;width:1000px;text-align:center;}
    </style>
</head>
<body>
    <%--利用HyperLink控件--%>
    <asp:HyperLink ID="Default" NavigateUrl="~/Default.aspx" runat="server">Home Page</asp:HyperLink>
    <%--在ImageMap上放置一个热点，并实现对其它页面的超链接。--%>
    <asp:ImageMap ID="ImageMap1" ImageUrl="icon.jpg"  runat="server">
        <asp:RectangleHotSpot HotSpotMode="Navigate" NavigateUrl="http://bingqiangzhou.cn:8080/Exp0101" AlternateText="To Homepage"
            Top="0" Left="0" Bottom="300" Right="300" />
        <asp:RectangleHotSpot HotSpotMode="Navigate" NavigateUrl="http://bingqiangzhou.cn:8080/Exp0103" AlternateText="To Homepage"
            Top="0" Left="300" Bottom="300" Right="590" />
        <asp:RectangleHotSpot HotSpotMode="Navigate" NavigateUrl="http://bingqiangzhou.cn:8080/Exp0104" AlternateText="To Homepage"
            Top="300" Left="0" Bottom="590" Right="300" />
        <asp:RectangleHotSpot HotSpotMode="Navigate" NavigateUrl="http://bingqiangzhou.cn:8080/Exp0105" AlternateText="To Homepage"
            Top="300" Left="300" Bottom="590" Right="590" />
    </asp:ImageMap>
</body>
</html>
