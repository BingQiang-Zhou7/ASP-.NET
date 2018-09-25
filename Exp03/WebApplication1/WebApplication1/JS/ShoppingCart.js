$(document).ready(
    function () {
        //alert("hello");
        CalculateTotalPrice();
        if ($("img").length > 0) {
            $("#Purchase").addClass("btn-outline-primary");
            $("#Purchase").removeAttr("disabled");
        }
        $("#Select_All").click(
            function () {
//                alert($("#Select_All").prop('checked'));
                $(".custom-control-input").each(
                    function () {
                        $(this).prop('checked', $("#Select_All").prop('checked'));
                    }
                )
            }
        );
        $("button").click(
            function () {
                var id = this.id;
                var str = id.split('_');
                var Control = str[0];
                var CommodityID = str[1];
                //alert(Control + " " + CommodityID);
                if (Control == "Delete") {
                    DeleteCommodity(CommodityID);
                } else if (Control == "Plus") {
                    AddCommodity(CommodityID);
                } else if (Control == "Minus") {
                    MinusCommodity(CommodityID);
                } else if (Control == "Purchase") {
                    PurchaseCommodity();
                }
            }
        );
        function DeleteCommodity(CommodityID) {
            $.ajax({
                type: "post",
                url: "/Ashx/ShoppingCartFunction.ashx",
                data: "Operator=Delete&CommodityID=" + CommodityID,
                dataType: "text",
                async: true,
                success: function (data) {
                    location.reload();
                }
            });
        }
        function MinusCommodity(CommodityID) {
            var InputID = "#Input_" + CommodityID;
            var number = parseInt($(InputID).val());
            if (number <= 1) {
                return;
            }
            $.ajax({
                type: "post",
                url: "/Ashx/ShoppingCartFunction.ashx",
                data: "Operator=Minus&CommodityID=" + CommodityID,
                dataType: "text",
                async: true,
                success: function (data) {
                    $(InputID).val(number - 1);
                    CalculateTotalPrice();
                }
            });
        }
        function AddCommodity(CommodityID) {
            $.ajax({
                type: "post",
                url: "/Ashx/ShoppingCartFunction.ashx",
                data: "Operator=Add&CommodityID=" + CommodityID,
                dataType: "text",
                async: true,
                success: function (data) {
                    var inputID = "#Input_" + CommodityID;
                    var number = parseInt($(inputID).val()) + 1;
                    //alert(inputID + " " + number);
                    $(inputID).val(number);
                    CalculateTotalPrice();
                }
            });
        }

        function PurchaseCommodity() {
            var CommodityList = "";
            $(".custom-control-input").each(
                function () {
                    if ($(this).prop('checked') && this.id != "Select_All") {
                        var id = this.id;
                        var str = id.split('_');
                        var CommodityID = str[1];
                        var InputID = "#Input_" + CommodityID;
                        CommodityList += CommodityID + "-"+$(InputID).val() + "_";
                    }
                }
            )
            CommodityList = CommodityList.substring(0, CommodityList.length - 1);
            if (CommodityList.length <= 2) {
                return;
            }
            //alert(CommodityList);
            $.ajax({
                type: "post",
                url: "/Ashx/ShoppingCartFunction.ashx",
                data: "Operator=Purchase&CommodityList=" + CommodityList,
                dataType: "text",
                async: true,
                success: function (data) {
                    window.location.reload();
                }
            });
        }

        function CalculateTotalPrice() {
            var totalPrice = 0;
            $(".price").each(
                function () {
                    var id = this.id;
                    var str = id.split('_');
                    var CommodityID = str[1];
                    var price = parseInt($(this).html());
                    var InputID = "#Input_" + CommodityID;
                    var number = parseInt($(InputID).val());
                    totalPrice += price * number;
                }
            );
            $("#totalPrice").html(totalPrice);
        }
    }
)