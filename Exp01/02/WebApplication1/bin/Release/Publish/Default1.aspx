<%--建多张网页，并实现网页之间多种方法的转移。转移方法包括：
（1）   利用HyperLink控件
（2）   利用Response.Redirect()方法。
（3）   在ImageMap上放置一个热点，并实现对其它页面的超链接。--%>


<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">
    /// <summary>
    /// 利用Response.Redirect()方法。
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void redirectButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("website01.aspx");
    }
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
</head>
<body>
    <asp:HyperLink ID="website01" runat="server">first website</asp:HyperLink><%--利用HyperLink控件--%>
    <form runat="server">
        <asp:Button ID="redirectButton" runat="server" Text="redirect to website01" onclick="redirectButton_Click" /><%--利用Response.Redirect()方法。--%>
    </form>
</body>
</html>
