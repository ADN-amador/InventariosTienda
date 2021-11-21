<%-- 
    Document   : vendedores
    Created on : 20/11/2021, 03:00:38 PM
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
        <title>Vendedores</title>
        <style>div{border:dotted;}</style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1>Vendedores</h1>
        <div class="container-fluid">
            <div class="row">
                <div class="col-6">
                    Seccion 1
                    <div class="row">
                        <div class="col-6">
                            IdVendedor
                            <!--<input class="form-control" type="text" placeholder="Default input">-->
                        </div>
                        <div class="col-6">Nombre</div>
                    </div>
                    <div class="row">                       
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
                            IdVendedor                            
                        </div>
                        <div class="col-6">Nombre</div>
                    </div>
                    <div class="row">                       
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
                                <th scope="col">IdVendedor</th>
                                <th scope="col">Nombre</th>                                
                                <th scope="col">Telefono</th>                               
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Klara</td>
                                <td>13590</td>                                
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
