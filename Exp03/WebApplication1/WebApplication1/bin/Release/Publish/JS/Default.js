$(document).ready(
    function () {
        //alert("hello");
        $('[data-toggle="popover"]').popover();
        $("button").click(
            function () {
                $(this).popover('show');
                var that = this;
                $.ajax({
                    type: "post",
                    url: "/Exp0301/Ashx/ShoppingCartFunction.ashx",
                    data: "Operator=Add&CommodityID=" + $(that).val(),
                    dataType:"text",
                    async: true,
                    success: function (data) {
                        setTimeout(function () {
                            $(that).popover('hide');
                        }, 1000);
                    }
                });
            }
        )
    }
)
