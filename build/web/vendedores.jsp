<%-- 
    Document   : vendedores
    Created on : 20/11/2021, 03:00:38 PM
    Author     : Usuario
--%>

<%@page import="logica.Vendedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"><!-- css -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script><!-- comment -->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>Vendedores</title>
        <style>            
            /*button{height: 50px; width: 75px;}*/   
            /*div{border:dotted;}*/            
            li:hover{background-color: #1a1d20;}             
        </style>
    </head>
    <body>
        <%
            Vendedor v = (Vendedor) session.getAttribute("usr");
            if (v != null) {
        %>
        <jsp:include page="menu.jsp"/>
        <!--<h1>Vendedores</h1>-->
        <div class="container-fluid" ng-app="vendedores" ng-controller="vendedoresController as vc">
            <div class="row mt-2">
                <div class="col-10">Bienvenido/a: <%=v.getUsuario()%></div>
                <div class="col-2">
                    <button type="button" class="btn btn-outline-danger btn-block" ng-click="vc.cerrarSesion()">Cerrar sesión</button>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <!--Seccion 1-->
                    <div class="row">
                        <div class="col-6">
                            <label>IdVendedor</label>
                            <input class="form-control" type="text" placeholder="IdVendedor" ng-model="vc.idVendedor">
                        </div>                        
                        <div class="col-6">
                            <label>Usuario</label>
                            <input class="form-control" type="text" placeholder="Usuario" ng-model="vc.usuario">
                        </div>                        
                    </div>
                    <div class="row">                       
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" placeholder="Nombre" ng-model="vc.nombre">
                        </div>
                        <div class="col-6">
                            <label>Contraseña</label>
                            <input class="form-control" type="text" placeholder="Contraseña" ng-model="vc.contrasenna">
                        </div>
                    </div>
                    <div class="row">                       
                        <div class="col-6">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" placeholder="Teléfono" ng-model="vc.telefono">
                        </div>
                    </div> 
                    <br>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-success" ng-click="vc.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-primary" ng-click="vc.listar()">Listar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-warning" ng-click="vc.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-danger" ng-click="vc.eliminar()">Eliminar</button>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="col-6">
                    <!--Seccion 2-->
                    <div class="row">
                        <div class="col-6">
                            <label>IdVendedor</label>
                            <input class="form-control" type="text" disabled="" value="{{vc.idVendedor}}">
                        </div>                       
                        <div class="col-6">
                            <label>Usuario</label>
                            <input class="form-control" type="text" disabled="" value="{{vc.usuario}}">
                        </div>                       
                    </div>
                    <div class="row">                        
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" disabled="" value="{{vc.nombre}}">
                        </div>
                        <div class="col-6">
                            <label>Contraseña</label>
                            <input class="form-control" type="text" disabled="" value="{{vc.contrasenna}}">
                        </div>
                    </div>
                    <div class="row">                       
                        <div class="col-6">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" disabled="" value="{{vc.telefono}}">
                        </div>
                    </div>                  
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <!--Seccion 3 - Tabla-->
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">IdVendedor</th>
                                <th scope="col">Nombre</th>                                
                                <th scope="col">Telefono</th>                               
                                <th scope="col">Usuario</th>                               
                                <th scope="col">Contraseña</th>                               
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="v in vc.Vendedores">
                                <td>{{v.idVendedor}}</td>
                                <td>{{v.nombre}}</td>
                                <td>{{v.telefono}}</td>                              
                                <td>{{v.usuario}}</td>                              
                                <td>{{v.contrasenna}}</td>                              
                                <td>
                                    <button type="button" class="btn btn-outline-info" ng-click="vc.editar(v.idVendedor)">Editar</button>
                                </td>
                            </tr>                         
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('vendedores', []);
            app.controller('vendedoresController', ['$http', controladorVendedores]);
            function controladorVendedores($http) {
                var vc = this;
                validar = function (tipoDeValidacion) {
                    var idVendedor = vc.idVendedor ? true : false;
                    var nombre = vc.nombre ? true : false;
                    var telefono = vc.telefono ? true : false;
                    var usuario = vc.usuario ? true : false;
                    var contrasenna = vc.contrasenna ? true : false;

                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (idVendedor && nombre && telefono && usuario && contrasenna) {
                            return true;
                        } else {
                            return false;
                        }
                    } else if (tipoDeValidacion === 'soloIdVendedor') {
                        if (idVendedor) {
                            return true;
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                };
                vc.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVendedor.jsp',
                        params: parametros
                    }).then(function (res) {
                        vc.Vendedores = res.data.Vendedores;
                    });
                };
                vc.guardar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'guardar',
                            idVendedor: vc.idVendedor,
                            nombre: vc.nombre,
                            telefono: vc.telefono,
                            usuario: vc.usuario,
                            contrasenna: vc.contrasenna
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesVendedor.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.guardar === true) {
                                    alert('Guardó');
                                } else {
                                    alert('No Guardó');
                                }
                            } else {
                                alert(res.data.errorMsg);
                            }
                        });
                    } else {
                        alert('Para guardar, todos los campos son requeridos');
                    }
                };
                vc.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            idVendedor: vc.idVendedor,
                            nombre: vc.nombre,
                            telefono: vc.telefono,
                            usuario: vc.usuario,
                            contrasenna: vc.contrasenna
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesVendedor.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.actualizar === true) {
                                    alert('Actualizó');
                                } else {
                                    alert('No Actualizó');
                                }
                            } else {
                                alert(res.data.errorMsg);
                            }
                        });
                    } else {
                        alert('Para actualizar, todos los campos son requeridos');
                    }
                };
                vc.eliminar = function () {
                    if (validar('soloIdVendedor')) {
                        var parametros = {
                            proceso: 'eliminar',
                            idVendedor: vc.idVendedor
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesVendedor.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.eliminar === true) {
                                    alert('Eliminó');
                                } else {
                                    alert('No Eliminó');
                                }
                            } else {
                                alert(res.data.errorMsg);
                            }
                        });
                    } else {
                        alert('Para eliminar, el Id Vendedor es requerido');
                    }
                };
                vc.editar = function (idv) {
                    var parametros = {
                        proceso: 'consultarIndividual',
                        idVendedor: idv
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVendedor.jsp',
                        params: parametros
                    }).then(function (res) {
                        vc.idVendedor = res.data.Vendedor.idVendedor;
                        vc.nombre = res.data.Vendedor.nombre;
                        vc.telefono = res.data.Vendedor.telefono;
                        vc.usuario = res.data.Vendedor.usuario;
                        vc.contrasenna = res.data.Vendedor.contrasenna;
                    });
                };
                vc.cerrarSesion = function () {
                    var parametros = {
                        proceso: 'cerrarSesion'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVendedor.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            window.location.href = "vendedores.jsp";
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
            }
        </script>
        <%} else {%>
    <center><a href="login.jsp">No se ha iniciado sesión o la sesión caducó, click acá para ingresar</a></center>
        <%}%>
</body>
<jsp:include page="footer.jsp"/>
</html>