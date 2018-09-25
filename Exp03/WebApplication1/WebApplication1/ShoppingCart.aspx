<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebApplication1.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Exp03--Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="CSS/main.css" />
    <script type="text/javascript" src="JS/ShoppingCart.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-sm-12">
    <table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col"><%--<div class="custom-control custom-checkbox">
  <input type="checkbox" class="custom-control-input" id="customCheck1">
  <label class="custom-control-label" for="customCheck1">Select All</label>
</div>--%></th>
      <th scope="col">Commodity</th>
      <th scope="col">Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Operator</th>
    </tr>
  </thead>
  <tbody>
      <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSource1" runat="server">
          <ItemTemplate>
    <tr>
      <th scope="row"><div class="custom-control custom-checkbox">
  <input type="checkbox" class="custom-control-input" id='Select_<%# Eval("CommodityID")%>'>
  <label class="font-weight-bold custom-control-label" for='Select_<%# Eval("CommodityID")%>'></label>
</div></th>
      <td><img src='images/<%# Eval("Image")%>' width="60" alt="..." class="img-thumbnail"></td>
      <td><%# Eval("Name")%></td>
      <td>￥<span id='Price_<%# Eval("CommodityID")%>' class="price"><%# Eval("Price")%></span></td>
      <td><div class="btn-group" role="group" aria-label="First group">
          <input type="text" class="form-control" style="width:80px;" readonly id='Input_<%# Eval("CommodityID")%>' value='<%# Eval("Amount")%>' />
    <button type="button" class="btn btn-toolbar" id='Plus_<%# Eval("CommodityID")%>'>+</button>
    <button type="button" class="btn btn-light" id='Minus_<%# Eval("CommodityID")%>'>-</button>
  </div></td>
      <td><button type="button" class="btn btn-light" id='Delete_<%# Eval("CommodityID")%>'>Delete</button></td>
    </tr>
              </ItemTemplate>
      </asp:Repeater>
  </tbody>
    <tfoot class="bg-light">
        <tr>
            <td><div class="custom-control custom-checkbox">
  <input type="checkbox" class="custom-control-input" id="Select_All">
  <label class="custom-control-label" for="Select_All">Select All</label></div></td>
            <td></td>
            <td></td>
            <td></td>
            <td><label class="text-danger font-weight-bold">Altogether: &nbsp;&nbsp;￥<span id="totalPrice">10000</span></label></td>
            <td><button type="button" class="btn" id="Purchase" disabled>Purchase</button></td>
        </tr>
    </tfoot>
</table>
</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RemoteConnectionString %>" 
        SelectCommand="SELECT Commodity.CommodityID, Commodity.Name, Commodity.Price, Commodity.Image, ShoppingCart.Amount FROM Commodity INNER JOIN ShoppingCart ON Commodity.CommodityID = ShoppingCart.CommodityID"></asp:SqlDataSource>
</asp:Content>
