<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApplication1.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Exp03--Order</title>
    <link rel="stylesheet" type="text/css" href="CSS/main.css" />
    <script src="JS/Order.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% foreach (var orderList in OrderInfoList)
        {
            double totalPrice = 0;       %>
    <div class="container col-sm-12" style="margin:2% 0">
    <table class="table">
  <thead class="thead-light">
    <tr>
        <th scope="row"></th>
      <th scope="col">Commodity</th>
      <th scope="col">Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Amount</th>
    </tr>
  </thead>
  <tbody>
      <%foreach (var info in orderList.Value.CommodityList)
          {%>
    <tr>
        <td></td>
      <td><img src='images/<%=info.CommodityImage %>' width="60" alt="..." class="img-thumbnail"></td>
      <td><%=info.CommodityName%></td>
      <td>￥<span><%=info.CommodityPrice%></span></td>
      <td><%=info.CommodityAmount%></td>
        <td>￥<span><%=info.CommodityAmount*info.CommodityPrice%></span></td>
    </tr>
              <%  totalPrice += info.CommodityAmount * info.CommodityPrice;
                  } %> 
  </tbody>
    <tfoot class="bg-light">
        <tr>
            <td></td>
            <td class="font-weight-bold">OrderNo:&nbsp;<%=orderList.Key %></td>
            <td></td>
            <td></td>
            <td><label class="text-danger font-weight-bold">Altogether: &nbsp;&nbsp;￥<span><%=totalPrice %></span></label></td>
            <td><button type="button" class="btn btn-outline-primary" id='DeleteOrder_<%=orderList.Key %>'>Delete Order</button></td>
        </tr>
    </tfoot>
</table>
</div>
    
<% }%>
</asp:Content>
