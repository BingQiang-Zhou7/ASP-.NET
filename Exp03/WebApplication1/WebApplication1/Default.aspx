<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="JS/Default.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
    <asp:Repeater runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
  <div class="card col-md-6 col-lg-3"> <img class="card-img-top"  src='<%# "images/"+Eval("Image") %>' alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">￥<%#Eval("Price")%></h5>
      <p class="card-text"><%#Eval("Name")%></p>
      <button type="button" class="btn btn-primary" title="Added Successfully!"
            data-container="body" data-toggle="popover" data-placement="top"
            data-content='<%#Eval("Name")%>(￥<%#Eval("Price")%>)' value="<%#Eval("CommodityID")%>">Add to shopping cart</button> </div>
  </div>
            </ItemTemplate>
        </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RemoteConnectionString %>" SelectCommand="SELECT * FROM [Commodity]"></asp:SqlDataSource>
</div>
    </div>
    <div id="myDiv"></div>
</asp:Content>
