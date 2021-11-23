<%-- 
    Document   : productos
    Created on : 20/11/2021, 02:57:03 PM
    Author     : Usuario
--%>

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
        <title>Productos</title>
        <style>            
            /*button{height: 50px; width: 75px;}*/   
            /*div{border:dotted;}*/            
            li:hover{background-color: #1a1d20;}            
        </style>        
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1>Productos</h1>       
        <div class="container-fluid" ng-app="productos" ng-controller="productosController as pc">
            <div class="row">
                <div class="col-6">
                    <!--Seccion 1-->
                    <div class="row">
                        <div class="col-6">
                            <label>IdProducto</label>
                            <input class="form-control" type="text" placeholder="Id Producto" ng-model="pc.idProducto">
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" placeholder="Nombre" ng-model="pc.nombre">
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Descripción</label>
                            <input class="form-control" type="text" placeholder="Descripción" ng-model="pc.descripcion">
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="text" placeholder="Precio" ng-model="pc.precio">
                        </div>                        
                    </div>
                    <div class="row">                        
                        <div class="col-6">
                            <label>Stock</label>
                            <input class="form-control" type="text" placeholder="Stock" ng-model="pc.stock">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-success" ng-click="pc.guardar()">Guardar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-primary" ng-click="pc.listar()">Listar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-warning" ng-click="pc.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-3">
                            <button type="button" class="btn btn-outline-danger" ng-click="pc.eliminar()">Eliminar</button>
                        </div>
                    </div>
                    <br>
                </div>
                <div class="col-6">
                    <!--Seccion 2-->
                    <div class="row">
                        <div class="col-6">
                            <label>IdProducto</label>
                            <input class="form-control" type="text" disabled="" value="{{pc.idProducto}}">                            
                        </div>
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" disabled="" value="{{pc.nombre}}">
                        </div>                         
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Descripción</label>
                            <input class="form-control" type="text" disabled="" value="{{pc.descripcion}}">
                        </div>
                        <div class="col-6">
                            <label>Precio</label>
                            <input class="form-control" type="text" disabled="" value="{{pc.precio}}">
                        </div>
                    </div>
                    <div class="row">                         
                        <div class="col-6">
                            <label>Stock</label>
                            <input class="form-control" type="text" disabled="" value="{{pc.stock}}">
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
                                <th scope="col">IdProducto</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Stock</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="p in pc.Productos">
                                <td>{{p.idProducto}}</td>
                                <td>{{p.nombre}}</td>
                                <td>{{p.descripcion}}</td>
                                <td>{{p.precio}}</td>
                                <td>{{p.stock}}</td>
                                <td>
                                    <button type="button" class="btn btn-outline-info" ng-click="pc.editar(p.idProducto)">Editar</button>
                                </td>
                            </tr>                         
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('productos', []);
            app.controller('productosController', ['$http', controladorProductos]);
            function controladorProductos($http) {
                var pc = this;
                pc.listar = function () {
//                  alert('Click en el botón listar');
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
                        params: parametros
                    }).then(function (res) {
                        pc.Productos = res.data.Productos;
                    });
                };
                pc.guardar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        idProducto: pc.idProducto,
                        nombre: pc.nombre,
                        descripcion: pc.descripcion,
                        precio: pc.precio,
                        stock: pc.stock
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
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
                };
                pc.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        idProducto: pc.idProducto,
                        nombre: pc.nombre,
                        descripcion: pc.descripcion,
                        precio: pc.precio,
                        stock: pc.stock
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
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
                };
                pc.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        idProducto: pc.idProducto
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
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
                };
                pc.editar = function (idp) {
                    var parametros = {
                        proceso: 'consultarIndividual',
                        idProducto: idp
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesProducto.jsp',
                        params: parametros
                    }).then(function (res) {
                        pc.idProducto = res.data.Producto.idProducto;
                        pc.nombre = res.data.Producto.nombre;
                        pc.descripcion = res.data.Producto.descripcion;
                        pc.precio = res.data.Producto.precio;
                        pc.stock = res.data.Producto.stock;
                    });
                };
            }
        </script>
    </body>
</html>
