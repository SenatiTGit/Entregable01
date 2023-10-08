<%@ Page Title="DNI Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TareaEntregable._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .background {
            background-image: url('https://www.xtrafondos.com/descargar.php?id=5846&resolucion=3840x2160');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.7);
            padding: 20px;
            border-radius: 10px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 400px;
            width: 90%;
        }

        .btn-custom {
            background-color: #b84592;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-custom:hover {
            background-color: #e83e8c;
            transform: scale(1.05);
        }
    </style>
    <div class="background">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 form-container">
                    <h1 class="display-4 text-center">Consultar DNI</h1>
                    <div class="mb-3">
                        <label for="tbDNI" class="form-label">DNI:</label>
                        <div class="input-group">
                            <span class="input-group-text">
                                <img src="Drawable/dni.png" alt="Imagen de DNI" width="32" height="25" />
                            </span>
                            <input type="text" id="tbDNI" class="form-control" placeholder="Número de DNI" />
                        </div>
                    </div>
                    <div class="mb-3 text-center">
                        <button id="btnBuscar" class="btn btn-custom" type="button">Buscar</button>
                    </div>
                    <div class="mb-3 text-center">
                        <asp:Label ID="resultado" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnBuscar").click(function () {
                var apiUrl = "https://api.apis.net.pe/v2/reniec/dni";
                var token = "apis-token-5743.Ph-OPKnjBU1vuIAvPT3NEQsETB2HBh9V";
                var dni = $("#tbDNI").val();

                $.ajax({
                    type: "GET",
                    url: apiUrl,
                    headers: {
                        "Authorization": "Bearer " + token
                    },
                    data: { numero: dni },
                    success: function (data) {
                        $("#<%= resultado.ClientID %>").text(data);
                    },
                    error: function () {
                        alert("Ha ocurrido un error al consultar la API.");
                    }
                });
            });
        });
    </script>
</asp:Content>
