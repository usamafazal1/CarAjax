<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarAjax.aspx.cs" Inherits="CarAjax.CarAjax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        const inputCar = document.getElementById("input");
        inputCar.addEventListener("input", () => {
            if (!inputCar.value) {
                return
            }
            else {
                $.ajax({
                    url: 'CarAjax.aspx/GetIntellisense',
                    type: 'post',
                    data: JSON.stringify({ "name": $("#input").val() }),
                    contentType: 'application/JSON',
                    success: function (data)
                    {
                        console.log(data.d)
                        var select = document.getElementById("carsDrop");
                        $("#carsDrop").empty()
                        var options = data.d
                        for (var i = 0; i < options.length; i++) {
                            var opt = options[i];
                            var el = document.createElement("option");
                            el.textContent = opt;
                            el.value = opt;
                            select.appendChild(el);
                        }
                    }
                })
            }
        });

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="input" runat="server" onkeyup="return isIntellisense(event)"></asp:TextBox>
            <asp:DropDownList ID="carsDrop" runat="server"></asp:DropDownList>
        </div>
    </form>
</body>
</html>
