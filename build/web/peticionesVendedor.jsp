<%-- 
    Document   : peticionesVendedor
    Created on : 12/11/2021, 08:05:29 PM
    Author     : Usuario
--%>

<%@page import="logica.Vendedor"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar",
        "consultarIndividual",
        "iniciarSesion",
        "cerrarSesion"
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar    
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            Vendedor v = new Vendedor();
            v.setNombre(nombre);
            v.setTelefono(telefono);

            if (v.guardarVendedor()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            int idVendedor = Integer.parseInt(request.getParameter("idVendedor"));
            Vendedor v = new Vendedor();
            v.setIdVendedor(idVendedor);
            if (v.eliminarVendedor()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                List<Vendedor> lista = new Vendedor().consultarVendedores();
                respuesta += "\"" + proceso + "\": true,\"Vendedores\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Vendedores\":[]";
                Logger.getLogger(Vendedor.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarIndividual")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo consultarIndividual
            try {
                int idVendedor = Integer.parseInt(request.getParameter("idVendedor"));
                Vendedor obj = new Vendedor(idVendedor).consultarVendedor();
                respuesta += "\"" + proceso + "\": true,\"Vendedor\":" + new Gson().toJson(obj);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Vendedor\":null";
                Logger.getLogger(Vendedor.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            int idVendedor = Integer.parseInt(request.getParameter("idVendedor"));
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            Vendedor v = new Vendedor();
            v.setIdVendedor(idVendedor);
            v.setNombre(nombre);
            v.setTelefono(telefono);
            if (v.actualizarVendedor()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("iniciarSesion")) {
            String usuario = request.getParameter("usuario");
            String contrasenna = request.getParameter("contrasenna");
            Vendedor v = new Vendedor(usuario, contrasenna).validarUsuario();
            if (v != null) {
                session.setAttribute("usr", v);
                respuesta += "\"" + proceso + "\": true";
            } else {
                session.invalidate();
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("cerrarSesion")) {
            session.invalidate();
            respuesta += "\"" + proceso + "\": true";
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>