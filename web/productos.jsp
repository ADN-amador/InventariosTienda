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
        <title>Productos</title>
        <style>div{border:dotted;}</style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1>Productos</h1>
        <div class="container-fluid">
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6">
                            IdProducto
                            <!--<input class="form-control" type="text" placeholder="Default input">-->
                        </div>
                        <div class="col-6">Precio</div>
                    </div>
                    <div class="row">
                        <div class="col-6">Nombre</div>
                        <div class="col-6">Stock</div>
                    </div>
                    <div class="row">
                        <div class="col-6">Descripcion</div>                       
                    </div>
                    <div class="row">
                        <div class="col-3">Guardar</div>
                        <div class="col-3">Listar</div>
                        <div class="col-3">Actualizar</div>
                        <div class="col-3">Eliminar</div>
                    </div>
                </div>
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6">
                            IdProducto
                            <!--<input class="form-control" type="text" placeholder="Default input">-->
                        </div>
                        <div class="col-6">Precio</div>
                    </div>
                    <div class="row">
                        <div class="col-6">Nombre</div>
                        <div class="col-6">Stock</div>
                    </div>
                    <div class="row">
                        <div class="col-6">Descripcion</div>                       
                    </div>                   
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    Seccion 3 - Tabla
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
                            <tr>
                                <td>8</td>
                                <td>Chocolatina</td>
                                <td>Cho Yet 200g</td>
                                <td>1000</td>
                                <td>50</td>
                                <td>
                                    <button type="button" class="btn btn-outline-info">Editar</button>
                                </td>
                            </tr>                         
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
