$(document).ready(
    function () {
        //alert("hello");
        $("button").click(
            function () {
                var str = this.id;
                var strs = str.split('_');
                var id = strs[1];
                if(strs[0] != "Delete")
                {
	                return;
                }
                $.ajax({
                    type: "post",
                    url: "/Ashx/OrderFunction.ashx",
                    data: "OrderID=" + id,
                    dataType: "text",
                    async: true,
                    success: function () {
                        location.reload();
                    }
                });
            }
        )
    }
)