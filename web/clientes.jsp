<%-- 
    Document   : clientes
    Created on : 16/11/2021, 10:56:52 PM
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Clientes</title>
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
        <!--<h1>Clientes</h1>-->
        <div class="container-fluid" ng-app="clientes" ng-controller="clientesController as cc">
            <div class="row mt-2">
                <div class="col-10">Bienvenido/a: <%=v.getUsuario()%></div>
                <div class="col-2">
                    <button type="button" class="btn btn-outline-danger btn-block" ng-click="cc.cerrarSesion()">Cerrar sesión</button>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <!--Seccion 1-->
                    <div class="row">
                        <div class="col-6">
                            <label>IdCliente</label>
                            <input class="form-control" type="text" placeholder="IdCliente" ng-model="cc.idCliente">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" placeholder="Nombre" ng-model="cc.nombre">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Dirección</label>
                            <input class="form-control" type="text" placeholder="Dirección" ng-model="cc.direccion">
                        </div>
                        <div class="col-6">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" placeholder="Teléfono" ng-model="cc.telefono">
                        </div>
                    </div>                    
                    <br>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-success" ng-click="cc.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-primary" ng-click="cc.listar()">Listar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-warning" ng-click="cc.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#modalEliminar">Eliminar</button>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="col-6">
                    <!--Seccion 2-->
                    <div class="row">
                        <div class="col-6">
                            <label>IdCliente</label>
                            <input class="form-control" type="text" disabled="" value="{{cc.idCliente}}">                            
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" disabled="" value="{{cc.nombre}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Dirección</label>
                            <input class="form-control" type="text" disabled="" value="{{cc.direccion}}">
                        </div>
                        <div class="col-6">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" disabled="" value="{{cc.telefono}}">
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
                                <th scope="col">IdCliente</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Telefono</th>                               
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="c in cc.Clientes">
                                <td>{{c.idCliente}}</td>
                                <td>{{c.nombre}}</td>
                                <td>{{c.direccion}}</td>                              
                                <td>{{c.telefono}}</td>                              
                                <td>
                                    <button type="button" class="btn btn-outline-info" ng-click="cc.editar(c.idCliente)">Editar</button>
                                </td>
                            </tr>                         
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Modal Eliminar-->
            <div class="modal fade" id="modalEliminar" tabindex="-1" aria-labelledby="eliminarModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="eliminarModalLabel">¿Está seguro de eliminar el Cliente?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            El registro será eliminado de la base de datos
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="cc.eliminar()">Si</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('clientes', []);
            app.controller('clientesController', ['$http', controladorClientes]);
            function controladorClientes($http) {
                var cc = this;
                validar = function (tipoDeValidacion) {
                    var idCliente = cc.idCliente ? true : false;
                    var nombre = cc.nombre ? true : false;
                    var direccion = cc.direccion ? true : false;
                    var telefono = cc.telefono ? true : false;

                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (idCliente && nombre && direccion && telefono) {
                            return true;
                        } else {
                            return false;
                        }
                    } else if (tipoDeValidacion === 'nombreDireccionTelefono') {
                        if (nombre && direccion && telefono) {
                            return true;
                        } else {
                            return false;
                        }
                    } else if (tipoDeValidacion === 'soloIdCliente') {
                        if (idCliente) {
                            return true;
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                };
                cc.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCliente.jsp',
                        params: parametros
                    }).then(function (res) {
                        cc.Clientes = res.data.Clientes;
                    });
                };
                cc.guardar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'guardar',
                            idCliente: cc.idCliente,
                            nombre: cc.nombre,
                            direccion: cc.direccion,
                            telefono: cc.telefono
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesCliente.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.guardar === true) {
//                                    alert('Guardó');
                                    swal({
                                        title: "Guardó",
                                        text: "El registro fue guardado exitosamente",
                                        icon: "success",
                                        button: "Cerrar"
                                    });
                                } else {
//                                    alert('No Guardó');
                                    swal({
                                        title: "No Guardó",
                                        text: "El registro no se guardo",
                                        icon: "error",
                                        button: "Cerrar"
                                    });
                                }
                            } else {
//                                alert(res.data.errorMsg);
                                swal({
                                    title: "Falló",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Cerrar"
                                });
                            }
                        });
                    } else {
//                        alert('nombre, dirección y télefono son obligatorios');
                        swal({
                            title: "Verificar campos",
                            text: "Para guardar, todos los campos son requeridos",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }
                };
                cc.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            idCliente: cc.idCliente,
                            nombre: cc.nombre,
                            direccion: cc.direccion,
                            telefono: cc.telefono
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesCliente.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.actualizar === true) {
//                                    alert('Actualizó');
                                    swal({
                                        title: "Actualizó",
                                        text: "El registro fue actualizado exitosamente",
                                        icon: "success",
                                        button: "Cerrar"
                                    });
                                } else {
//                                    alert('No Actualizó');
                                    swal({
                                        title: "No actualizó",
                                        text: "El registro no fue actualizado",
                                        icon: "error",
                                        button: "Cerrar"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Falló",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Cerrar"
                                });
                            }
                        });
                    } else {
//                        alert('Para actualizar se requieren todos los campos');
                        swal({
                            title: "Verificar campos",
                            text: "Para actualizar, todos los campos son requeridos",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }
                };
                cc.eliminar = function () {
                    if (validar('soloIdCliente')) {
                        var parametros = {
                            proceso: 'eliminar',
                            idCliente: cc.idCliente
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesCliente.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.eliminar === true) {
//                                    alert('Eliminó');
                                    swal({
                                        title: "Eliminó",
                                        text: "El registro fue eliminado exitosamente",
                                        icon: "success",
                                        button: "Cerrar"
                                    });
                                } else {
//                                    alert('No Eliminó');
                                    swal({
                                        title: "No Eliminó",
                                        text: "El registro no fue eliminado",
                                        icon: "error",
                                        button: "Cerrar"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Falló",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "Cerrar"
                                });
                            }
                        });
                    } else {
//                        alert('Para eliminar se requiere el Id Cliente');
                        swal({
                            title: "Verificar campos",
                            text: "Para eliminar se requiere el Id Cliente",
                            icon: "warning",
                            button: "Cerrar"
                        });
                    }
                };
                cc.editar = function (idc) {
                    var parametros = {
                        proceso: 'consultarIndividual',
                        idCliente: idc
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCliente.jsp',
                        params: parametros
                    }).then(function (res) {
                        cc.idCliente = res.data.Cliente.idCliente;
                        cc.nombre = res.data.Cliente.nombre;
                        cc.direccion = res.data.Cliente.direccion;
                        cc.telefono = res.data.Cliente.telefono;
                    });
                };
                cc.cerrarSesion = function () {
                    var parametros = {
                        proceso: 'cerrarSesion'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesVendedor.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            window.location.href = "clientes.jsp";
                        } else {
                            swal({
                                title: "Falló",
                                text: res.data.errorMsg,
                                icon: "error",
                                button: "Cerrar"
                            });
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