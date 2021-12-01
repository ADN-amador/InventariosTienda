<%-- 
    Document   : index
    Created on : 12/11/2021, 05:47:39 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"><!-- comment -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script><!-- comment -->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>Index</title>
        <style> 
            /*div{border:dotted;}*/
            /*button{height: 50px; width: 75px;}*/   
            /*div{border:dotted;}*/            
            li:hover{background-color: #1a1d20;}            
        </style>
    </head>
    <body>        
        <jsp:include page="menu.jsp"/>
        <!--<h1>Index</h1>-->
        <br>
        <div class="container-fluid" ng-app="vendedores" ng-controller="vendedoresController as lc">
            <div class="row">
                <div class="col-4"></div>
                <div class="col-4">
                    <div class="row">
                        <div class="col-12">
                            <label>Usuario</label>
                            <input type="text" class="form-control" ng-model="lc.usuario">                                   
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-12">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" ng-model="lc.contrasenna"> 
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button type="button" class="btn btn-primary mt-2 btn-lg btn-block" ng-click="lc.iniciarSesion()">Iniciar Sesion</button>
                        </div>
                    </div>
                </div>
                <div class="col-4"></div>
            </div>
        </div>
        <br>
        <script>
            var app = angular.module('vendedores', []);
            app.controller('vendedoresController', ['$http', controladorVendedores]);
            function controladorVendedores($http) {
                var lc = this;
                lc.iniciarSesion = function () {
//                    alert(lc.usuario+' '+lc.contrasenna);
                    var parametros = {
                        proceso: 'iniciarSesion',
                        usuario: lc.usuario,
                        contrasenna: lc.contrasenna
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVendedor.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.iniciarSesion === true) {
//                                alert('Bienvenido '+lc.usuario);
                                window.location.href = "vendedores.jsp";
                            } else {
                                alert('Verifique sus datos');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
            }
        </script>
    </body>
    <jsp:include page="footer.jsp"/>
</html>
