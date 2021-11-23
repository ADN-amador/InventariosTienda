<%-- 
    Document   : ventas
    Created on : 20/11/2021, 03:02:27 PM
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
        <title>Ventas</title>
        <style>
            /*div{border:dotted;}*/
            /*button{height: 50px; width: 75px;}*/
            .col-12{background: #FFFCF0;}            
            .form-control1{height: 38px; width: 150px;}
            .form-control2{height: 38px; width: 75px;}          
            li:hover{background-color: #1a1d20;}
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1>Ventas</h1>
        <div class="container-fluid">
            <div class="row">
                <div class="col-6">
                    <br>
                    Buscar Cliente
                    <div class="row">
                        <div class="col-4">                            
                            <input class="form-control1" type="text" placeholder="IdCliente">
                        </div>
                        <div class="col-2">                            
                            <button type="button" class="btn btn-outline-info">Buscar</button>                            
                        </div>
                        <div class="col-6">                            
                            <input class="form-control1" type="text" placeholder="Nombre cliente">
                        </div>
                    </div>
                    <br>
                    Buscar Producto
                    <div class="row">
                        <div class="col-4">                            
                            <input class="form-control1" type="text" placeholder="IdProducto">
                        </div>
                        <div class="col-2">                            
                            <button type="button" class="btn btn-outline-info">Buscar</button>
                        </div>                        
                        <div class="col-6">                            
                            <input class="form-control1" type="text" placeholder="Nombre producto">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-4">                            
                            <input class="form-control1" type="text" placeholder="Precio">
                        </div>
                        <div class="col-2">
                            <input class="form-control2" type="text" placeholder="Cantidad">
                        </div>                   
                        <div class="col-2">                            
                            <input class="form-control2" type="text" placeholder="Stock">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-4">
                            <br>
                            <button type="button" class="btn btn-outline-success" >Agregar Producto</button>                            
                        </div>                        
                    </div>
                    <br>
                </div>
                <div class="col-6">
                    <br>
                    Buscar Cliente
                    <div class="row">
                        <div class="col-4">                            
                            <input class="form-control1" type="text" placeholder="IdCliente">
                        </div>
                        <div class="col-2">                            
                            -                           
                        </div>
                        <div class="col-6">                            
                            <input class="form-control1" type="text" placeholder="Nombre cliente">
                        </div>
                    </div>
                    <br>
                    Buscar Producto
                    <div class="row">
                        <div class="col-4">                            
                            <input class="form-control1" type="text" placeholder="IdProducto">
                        </div>
                        <div class="col-2">                            
                           -
                        </div>                        
                        <div class="col-6">                            
                            <input class="form-control1" type="text" placeholder="Nombre producto">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-4">                            
                            <input class="form-control1" type="text" placeholder="Precio">
                        </div>
                        <div class="col-2">
                            <input class="form-control2" type="text" placeholder="Cantidad">
                        </div>                   
                        <div class="col-2">                            
                            <input class="form-control2" type="text" placeholder="Stock">
                        </div>
                    </div>
                    <div class="row">
                                               
                    </div>
                    <br>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <!--Seccion 3-->
                   <hr>
                    <div class="row">
                        <div class="col-6">
                            Venta o factura                            
                        </div>                       
                        <div class="col-3">
                        </div>                       
                        <div class="col-3">
                            Nro. 000001                           
                        </div>                       
                    </div>
                    <hr>
                    <div class="row">                       
                        <div class="col-12">
                            <!--Tabla--> 
                            <table class="table table-dark">
                                <thead>
                                    <tr>
                                        <th scope="col">IdVenta</th>
                                        <th scope="col">IdProducto</th>
                                        <th scope="col">Producto</th>
                                        <th scope="col">Precio</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">SubTotal</th>
                                        <th scope="col">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>8</td>
                                        <td>Chocolatina</td>
                                        <td>1000</td>
                                        <td>5</td>
                                        <td>5000</td>
                                        <td>
                                            <button type="button" class="btn btn-outline-info">Editar</button>
                                            <button type="button" class="btn btn-outline-danger">Eliminar</button>
                                        </td>
                                    </tr>                         
                                </tbody>
                            </table>
                        </div>                        
                    </div>                    
                    <hr>
                    <div class="row">                        
                        <div class="col-6">                             
                            <button type="button" class="btn btn-outline-success">Generar Venta</button>
                            <button type="button" class="btn btn-outline-danger">Cancelar</button>
                        </div>
                        <div class="col-3">                            
                        </div>
                        <div class="col-3">
                            Total <input class="form-control1" type="text" placeholder="$">
                        </div>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </body>
</html>