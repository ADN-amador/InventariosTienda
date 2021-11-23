<%-- 
    Document   : clientes
    Created on : 16/11/2021, 10:56:52 PM
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
        <title>Clientes</title>
        <style>            
            /*button{height: 50px; width: 75px;}*/   
            div{border:dotted;}            
            li:hover{background-color: #1a1d20;}            
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1>Clientes</h1>
        <div class="container-fluid">
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6">
                            IdCliente
                            <!--<input class="form-control" type="text" placeholder="Default input">-->
                        </div>
                        <div class="col-6">Nombre</div>
                    </div>
                    <div class="row">
                        <div class="col-6">Dirección</div>
                        <div class="col-6">Teléfono</div>
                    </div>                    
                    <div class="row">
                        <div class="col-3">Guardar</div>
                        <div class="col-3">Listar</div>
                        <div class="col-3">Actualizar</div>
                        <div class="col-3">Eliminar</div>
                    </div>
                </div>
                <div class="col-6">
                    Seccion 2
                    <div class="row">
                        <div class="col-6">
                            IdCliente                            
                        </div>
                        <div class="col-6">Nombre</div>
                    </div>
                    <div class="row">
                        <div class="col-6">Dirección</div>
                        <div class="col-6">Teléfono</div>
                    </div>                                  
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    Seccion 3 - Tabla
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
                            <tr>
                                <td>2</td>
                                <td>Daniela</td>
                                <td>Carrera 3</td>
                                <td>24680</td>                                
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
