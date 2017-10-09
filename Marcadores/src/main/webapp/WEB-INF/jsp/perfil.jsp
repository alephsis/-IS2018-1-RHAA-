<%-- 
    Document   : perfil
    Created on : 8/10/2017, 11:25:05 PM
    Author     : ahernandez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/iniciocss.css"/> ">
        <title>Perfil</title>
    </head>
    <body>
        
        <div class="contenedor">
            <header>
                <form action ="/Marcadores/" style="display:inline"> 
                    <button id="btnIni" class="btn btn-primary btn-lg" >Inicio</button>
                </form>
                <form action="/Marcadores/agregaMarcador" style="display:inline"> 
                    <button id="btnAgr" class="btn btn-primary btn-lg" >Agrega un marcador</button>
                </form>
                <form action ="/Marcadores/" style="display:inline"> 
                    <button id="btnCer" class="btn btn-primary btn-lg" >Cerrar Sesión</button>
                </form> 
                <button id="btnEli" class="btn btn-primary btn-lg" >Eliminar Cuenta</button>                   
                <button id="btnMod" class="btn btn-primary btn-lg" >Editar Perfil</button>
            </header>
            <section class="main">
                <div class="row"> 
                    <div class="col-md-12">
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="mb-5">
                            Hola, este es tu perfil amigo
                        </h1>                        
                    </div>
                </div>
                <div class="row"> 
                    <div class="col-md-12">
                        <hr>
                    </div>
                </div>
                <div class="row" style="background-color: #2aa52c; height: 50px; margin: 15px;">
                    <div class="col-md-6">
                        <div class="mw-100">
                            Nombre
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mw-100">
                            Aletsis papucho
                        </div>
                    </div>
                </div>
                <div class="row" style="background-color: #2aa52c; height: 50px; margin: 15px;">
                    <div class="col-md-6">
                        <div class="mw-100">
                            Correo
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mw-100">
                            Aletsis@papucho.com
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <img src="http://www.placebear.com/300/210">
                    </div>
                    <div class="col-md-6">
                        <img src="http://www.placekitten.com/300/210">
                    </div>
                </div>
            </section>
            
            <aside>
                <h1>
                    Tus marcadores
                </h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Latitud</th>
                            <th>Longitud</th>
                            <th>Actualiza</th>
                        </tr>
                    </thead>
                    <c:forEach var="m" items="${marcadores}">
                        <tbody>
                            <th>${m.varNombreM}</th>
                            <th>${m.varLatitud}</th>
                            <th>${m.varLongitud}</th>
                            <th>
                                <form action="/Marcadores/actualizaM" method="GET">
                                    <input id="latitud" name="latitud" hidden="true" value="${m.varLatitud}">
                                    <input id="longitud" name="longitud" hidden="true" value="${m.varLongitud}">
                                    <button type="submit" class="btn btn-primary btn-lg active">Actualiza</button>
                                </form> 
                            </th>
                       </tbody>

                    </c:forEach>
                </table>
            
            </aside>
         </div>
        
        
        <div id="myModalMod" class="modal">
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <h1>Veamos, ¿Qué cambiarás?</h1>
                            <div class="formholder">
                                <div class="randompad">
                                    <fieldset>
                                        <label name="nombre">Nombre</label>
                                        <input type="nombre"/>
                                        <label name="nickname">Nickname</label>
                                        <input type="nickname" />
                                        <label name="email">Correo</label>
                                        <input type="email"/>
                                        <label name="password">Password</label>
                                        <input type="password" />
                                        <button id="btnYes" class="btn btn-primary btn-lg" >Continuar</button>
                                        <button id="btnNo" class="btn btn-primary btn-lg" >Cancelar</button>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
        </div>
        <div id="myModalEli" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <p>¿Seguro que quieres eliminar tu cuenta?</p>
                                <button id="btnYes" class="btn btn-primary btn-lg" >¡Claro!</button>
                                <button id="btnNo" class="btn btn-primary btn-lg" >¡No por favor!</button>
                            </div>
        </div>
        <!-- Latest compiled and minified JavaScript -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/perfil.js"></script>
        
    </body>
</html>