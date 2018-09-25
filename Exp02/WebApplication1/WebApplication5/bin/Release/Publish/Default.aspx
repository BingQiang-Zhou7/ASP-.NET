<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exp0205</title>
    <style>
        body{margin:auto;margin-top:100px;max-width:1000px;text-align:center;}
        /*a{color:gray;}*/
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top:20px;">
            <Label for="GridView1">INFO LIST</Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="TypeID" HeaderText="TypeID" SortExpression="TypeID" />
                    <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="ImgPath" HeaderText="ImgPath" SortExpression="ImgPath" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TestRemoteConnectionString %>" DeleteCommand="DELETE FROM [Details] WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([TypeID] = @original_TypeID) OR ([TypeID] IS NULL AND @original_TypeID IS NULL)) AND (([Number] = @original_Number) OR ([Number] IS NULL AND @original_Number IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([ImgPath] = @original_ImgPath) OR ([ImgPath] IS NULL AND @original_ImgPath IS NULL))" InsertCommand="INSERT INTO [Details] ([ID], [Name], [TypeID], [Number], [Price], [ImgPath]) VALUES (@ID, @Name, @TypeID, @Number, @Price, @ImgPath)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Details]" UpdateCommand="UPDATE [Details] SET [Name] = @Name, [TypeID] = @TypeID, [Number] = @Number, [Price] = @Price, [ImgPath] = @ImgPath WHERE [ID] = @original_ID AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([TypeID] = @original_TypeID) OR ([TypeID] IS NULL AND @original_TypeID IS NULL)) AND (([Number] = @original_Number) OR ([Number] IS NULL AND @original_Number IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([ImgPath] = @original_ImgPath) OR ([ImgPath] IS NULL AND @original_ImgPath IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_TypeID" Type="String" />
                    <asp:Parameter Name="original_Number" Type="Int32" />
                    <asp:Parameter Name="original_Price" Type="Double" />
                    <asp:Parameter Name="original_ImgPath" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="TypeID" Type="String" />
                    <asp:Parameter Name="Number" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Double" />
                    <asp:Parameter Name="ImgPath" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="TypeID" Type="String" />
                    <asp:Parameter Name="Number" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Double" />
                    <asp:Parameter Name="ImgPath" Type="String" />
                    <asp:Parameter Name="original_ID" Type="String" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_TypeID" Type="String" />
                    <asp:Parameter Name="original_Number" Type="Int32" />
                    <asp:Parameter Name="original_Price" Type="Double" />
                    <asp:Parameter Name="original_ImgPath" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div style="margin-top:20px;">
                <Label for="DetailsView1">DETAILS</Label>
            <asp:LinkButton ID="ButtonNewItem" OnClick="ButtonNewItem_Click" runat="server">New</asp:LinkButton>
            <asp:DetailsView ID="DetailsView1" runat="server" OnModeChanging="DetailsView1_ModeChanging"
                AutoGenerateRows="False" DataKeyNames="ID" Height="50px" HorizontalAlign="Center" Width="125px" DataSourceID="SqlDataSource1" Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="TypeID" HeaderText="TypeID" SortExpression="TypeID" />
                    <asp:BoundField DataField="Number" HeaderText="Number" SortExpression="Number" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="ImgPath" HeaderText="ImgPath" SortExpression="ImgPath" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
        </div>
    </form>
</body>
</html>
