<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exp0202</title>
    <style>
        body{margin:auto;margin-top:100px;max-width:1000px;text-align:center;}
    </style>
    <script src="JS/jquery-3.3.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: left;">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestRemoteConnectionString2 %>" SelectCommand="SELECT * FROM [Type]"></asp:SqlDataSource>
            <%--<label for="DropDownList1">Type</label>
            <asp:DropDownList ID="DropDownList1" AutoPostBack="True" runat="server">
                <asp:ListItem Text="TypeName"></asp:ListItem>
            </asp:DropDownList>--%>
            <label for="CheckBoxList1">Type</label>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"
                CellPadding="10" DataSourceID="SqlDataSource1" DataTextField="TypeName" DataValueField="TypeName" RepeatDirection="Horizontal">
            </asp:CheckBoxList>
            <asp:TextBox ID="TypeVaule" Visible="false" runat="server"></asp:TextBox>
            <label for="TextBox1">Price<br />
            </label>
            <asp:TextBox ID="TextBox1" TextMode="Number" MaxLength="8" runat="server"></asp:TextBox>
            <label >-</label>
            <asp:TextBox ID="TextBox2" TextMode="Number" MaxLength="8" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Search"/>
            <br />
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Low price is illegal." ControlToValidate="TextBox1" ForeColor="Red" MaximumValue="99999999" MinimumValue="0"></asp:RangeValidator>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="High price is illegal." ControlToValidate="TextBox2" ForeColor="Red" MaximumValue="99999999" MinimumValue="0"></asp:RangeValidator>
        </div>
        <div style="margin-top:20px;">
            <%--<label for="GridView1">List</label>--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="600px" DataKeyNames="ID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="TypeID" HeaderText="TypeID" SortExpression="TypeID" />
                <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:ImageField DataAlternateTextField="ImgPath" DataImageUrlField="ImgPath" DataImageUrlFormatString="http://bingqiangzhou.cn:8080/{0}" HeaderText="Picture">
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TestRemoteConnectionString2 %>" SelectCommand="SELECT * FROM [Details] WHERE (([Price] &lt;= @Price) AND ([Price] &gt;= @Price2) AND (CONTAINS([Name], @Name)))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="Price" PropertyName="Text" Type="Double" DefaultValue="99999999" />
                    <asp:ControlParameter ControlID="TextBox1" Name="Price2" PropertyName="Text" Type="Double" DefaultValue="0" />
                    <asp:ControlParameter ControlID="TypeVaule" Name="Name" PropertyName="Text" Type="String" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>

</body>
</html>
