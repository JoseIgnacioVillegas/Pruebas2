<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	html {
	  min-height: 100%;
	  position: relative;
	}
	body {
	  margin: 0;
	  margin-bottom: 40px;
	}
	footer {
	  background-color: black;
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	  height: 200px;
	  color: white;
	}
	table{
		font-size:12px;
	}
	table, td{
		border:solid 1px;
		padding:2px 4px;
		border-collapse:collapse;
		white-space: nowrap;
	}
	table tr:first-child{
		text-align:center;
		font-weight:bold;
		vertical-align: top;
	}
 
	.multiselect {
		position:relative;
	}
 
	.selectBox {
		position: relative;
	}
 
	.selectBox select {
		text-align:center;
		width: 100%;
		font-weight: bold;
	}
 
 
	.overSelect {
		position: absolute;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
	}
 
	.checkboxes {
		display: none;
		border: 1px #dadada solid;
		background-color:white;
		overflow-y: auto;
		max-height:200px;
		position:absolute;
		box-sizing: border-box;
		min-width:100%;
		white-space: nowrap;
	}
 
	.checkboxes label {
	  display: block;
	  text-align:left;
	}
 
	.checkboxes label:hover {
	  background-color: #1e90ff;
	}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Gestion de departamento</title>
<link rel="icon" type="image/gif" href="./img/ditupm.gif"/>

</head>

<body id="myPage">

<!-- En este archivo .jsp esta definido el menu principal y la barra lateral -->
<%@ include file="menu.jsp" %> 

<!-- Team Container -->

<div class="w3-container w3-padding-64 w3-center" id="team">
	<p style="color:#FF0000">${mensaje}</p>
	<h2>Gestionar Docentes</h2>


	<p name="mensaje"></p>
	<div class="w3-row"><br>
		<shiro:hasAnyRoles name="administrador,creardocente">
		<form action="CrearProfesor.jsp"><input type="hidden" value="${permisos}" name="permisos">Para crear un nuevo docente pincha aquí: <button type="submit" >Crear un nuevo docente</button></form>		
		</shiro:hasAnyRoles>
		<br>
		<br>
		
		<table id="datos" style="margin: 0 auto;text-align: left;">
	<tr>
		
		<td>
			<div class="multiselect">
				<div class="selectBox" >
					<select id="lstOS" >
						<option>NOMBRE</option>
					</select>
					<div class="overSelect" data-checkboxes="chksCol1"></div>
				</div>
				<div class="checkboxes" id="chksCol1"></div>
			</div>
			</td>
			<td>
			<div class="multiselect">
				<div class="selectBox" >
					<select id="lstOS" >
						<option>APELLIDOS</option>
					</select>
					<div class="overSelect" data-checkboxes="chksCol2"></div>
				</div>
				<div class="checkboxes" id="chksCol2"></div>
			</div>
		</td>
		<td>
		<div class="multiselect">
				<div class="selectBox" >
					<select id="lstOS" >
						<option>ACRONIMO</option>
					</select>
					<div class="overSelect" data-checkboxes="chksCol3"></div>
				</div>
				<div class="checkboxes" id="chksCol3"></div>
			</div>
			</td>
			<td>
			<div class="multiselect">
				<div class="selectBox" >
					<select id="lstOS" >
						<option>CORREO</option>
					</select>
					<div class="overSelect" data-checkboxes="chksCol4"></div>
				</div>
				<div class="checkboxes" id="chksCol4"></div>
			</div>
		</td>
		<td>
			<div class="multiselect">
				<div class="selectBox" >
					<select id="lstOS" >
						<option>GRUPO</option>
					</select>
					<div class="overSelect" data-checkboxes="chksCol5"></div>
				</div>
				<div class="checkboxes" id="chksCol5"></div>
			</div>
		</td>
		<td>
			<div class="multiselect">
				<div class="selectBox" >
					<select id="lstOS" >
						<option>DEDICACIÓN</option>
					</select>
					<div class="overSelect" data-checkboxes="chksCol6"></div>
				</div>
				<div class="checkboxes" id="chksCol6"></div>
			</div>
		</td>
		<td>
			<div class="multiselect">
				<div class="selectBox" >
					<select id="lstOS" >
						<option>PLAZA</option>
					</select>
					<div class="overSelect" data-checkboxes="chksCol7"></div>
				</div>
				<div class="checkboxes" id="chksCol7"></div>
			</div>
		</td>
		<shiro:hasAnyRoles name="administrador, gestionusuarios"><td><a>Editar</a></td>
		<td><a>Borrar</a></td>
		<td><a>Gestionar asignaturas</a></td></shiro:hasAnyRoles>
	</tr>
		
		<c:forEach items="${profesores}" var="profesor">

	
		<tr>
			<td>${profesor.usuario.nombre}</td>
			<td>${profesor.usuario.apellidos}</td>
			<td>${profesor.acronimo}</td>
			<td>${profesor.usuario.correo}</td>
			<td>${profesor.grupo.acronimo}</td>
			<td>${profesor.dedicacion}</td>
			<td>${profesor.plaza.plaza}</td>
			
			<shiro:hasAnyRoles name="administrador, gestionusuarios">
			<td>
			<form action="EditarProfesor.jsp">
				<input type="hidden" value="${profesor.id}" name="id">
				<input type="hidden" value="${profesor.usuario.nombre}" name="nombre">
				<input type="hidden" value="${profesor.usuario.apellidos}" name="apellidos">
				<input type="hidden" value="${profesor.acronimo}" name="acronimo">
				<input type="hidden" value="${profesor.usuario.correo}" name="correo">
				<input type="hidden" value="${profesor.plaza.plaza}" name="plaza">
				<input type="hidden" value="${profesor.dedicacion}" name="dedicacion">
				<input type="hidden" value="${profesor.grupo.nombre}" name="grupo">
				<button type="submit" >Editar</button>
			</form>
			</td>
			


			<td><form action="BorrarProfesorServlet">
			<input type="hidden" value="${profesor.id}" name="idProfe">
			<input type="hidden" value="${profesor.usuario.id}" name="idUsuario">
			<button type="submit" >Borrar</button></form></td>
			
			
			<td><form action="ObtenerAsignaturasServlet">
			<input type="hidden" value="${profesor.id}" name="idProfe">
			<button type="submit" >Gestionar asignaturas</button></form></td>
			
			</shiro:hasAnyRoles>
		</tr>
		
		</c:forEach>
		
		</table>
		
		

		
		<br><br>
		<shiro:hasAnyRoles name="administrador, gestionusuarios">
		<form action="GestorServlet" >Para gestionar grupos de investigación pincha aquí:<button type="submit" value="CRUDGrupo" name="CRUDGrupo">Gestionar Grupos de Investigación</button></form>
		</shiro:hasAnyRoles>
		<br><br>
		<shiro:hasAnyRoles name="administrador, gestionusuarios">
		<form action="GestorServlet" >Para gestionar las plazas de profesores pincha aquí:<button type="submit" value="CRUDPlaza" name="CRUDPlaza">Gestionar Plaza de profesor</button></form>
		</shiro:hasAnyRoles>
		<br><br>
	</div>
</div>










<!-- Footer -->
<footer class="w3-padding-32 w3-center" >
  <h4>Enlaces de interés</h4>
  <a class="w3-button w3-large w3-teal" href="https://www.dit.upm.es/" title="DIT"><img src="./img/ditupm.gif" style="width:30px;height:30px;"></a>
  <a class="w3-button w3-large w3-teal" href="http://www.etsit.upm.es/" title="ETSIT"><img src="./img/etsit.gif" style="width:30px;height:30px;"></a>
  <a class="w3-button w3-large w3-teal" href="https://moodle.upm.es/" title="MOODLE"><img src="./img/moodle.gif" style="width:30px;height:30px;"></a>
  <a class="w3-button w3-large w3-teal" href="http://www.upm.es/" title="UPM"><img src="./img/upm.gif" style="width:30px;height:30px;"></a>
  <p>TFG Gestión docente - 2019</p>
  <!--  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>  -->
</footer>



<script>


function desplegarMenu(obj){ 	
   	if(obj.value == "gestUsuarios" && document.getElementById('gestUsuarios').style.display=="none" )	{
   		document.getElementById('gestUsuarios').style.display="";
   	}else if(obj.value == "gestUsuarios" && document.getElementById('gestUsuarios').style.display==""){
		document.getElementById('gestUsuarios').style.display="none";
   	}
   	
	if(obj.value == "gestDocencia" && document.getElementById('gestDocencia').style.display=="none"){
		document.getElementById('gestDocencia').style.display="";
   	}else if(obj.value == "gestDocencia" && document.getElementById('gestDocencia').style.display==""){
   		document.getElementById('gestDocencia').style.display="none";
   	}
} 




aFiltros = [];
aFiltro  = [];
aStack   = [];
window.onload = function(){
	x = document.querySelectorAll(".overSelect")
	for(let y of x){
		y.addEventListener("click",showCheckboxes);
	}
}

function showCheckboxes() {
	checkboxes = document.getElementById(this.dataset.checkboxes);
	x = document.querySelectorAll(".overSelect");
	for(i=0, t=x.length; i<t; i++ ){
		if (x.item(i)==this){
			n=i;
			break;
		}
	}

	td = this.parentElement.parentElement.parentElement;
	tr = td.parentElement;
	for(i=0, t=tr.children.length; i<t; i++ ){
		if( tr.children[i]==td ){
			m=i;
			break;
		}
	}

	if(checkboxes.style.display=='none' || checkboxes.style.display==""){
		x= document.querySelectorAll(".checkboxes");
		for(i=0, t=x.length; i<t; i++ ){
			document.querySelectorAll(".checkboxes")[i].style.display="none";
		}
		if( aFiltros[n]==undefined ){
			aFiltros[n]=[];
		}

		table = document.getElementById("datos");
		for(i=1, t=table.rows.length; i<t; i++){
			text = table.rows[i].cells[n].innerHTML;
			if(!aFiltros[n].includes(text)){
				aFiltros[n].push(text);

				lbl = document.createElement("label");
				txt = document.createTextNode(text);
				chk = document.createElement("input");
				chk.setAttribute("type", "checkbox");
				lbl.appendChild(chk);
				lbl.appendChild(txt);
				checkboxes.appendChild(lbl);
			}
		}
		checkboxes.style.display="block";
	}else{
		checkboxes.style.display='none';
	}

	x = document.querySelectorAll("input[type=checkbox]");
	for(y of x){
		y.removeEventListener("click",setFiltro);
		y.addEventListener("click",setFiltro);
	}
}

function setFiltro(){
	x=document.querySelectorAll("div.multiselect");
	div=this.parentElement.parentElement.parentElement ;
	for(i=0, t=x.length; i<t; i++ ){
		if (x.item(i)==div){
			n=i;
			break;
		}
	}


	if(aFiltro[n]==undefined){
		aFiltro[n]=[];
	}

	text = this.nextSibling.textContent;
	if( this.checked ){
		aFiltro[n].push(text);
	}else{
		aFiltro[n].splice(aFiltro[n].indexOf(text),1);
	}

	if(aFiltro[n].length){
		if(!aStack.includes(n)){
			aStack.push(n);
		}
	}else{
		aStack.splice(aStack.indexOf(n),1);
	}

	filtrar();
}


function filtrar(){
	table = document.getElementById("datos");
	for(i=1, t=table.rows.length; i<t; i++){
		table.rows[i].style.display="";
	}

	if(aStack.length){
		for(n of aStack){
			for(i=1, t=table.rows.length; i<t; i++){
				if(table.rows[i].style.display!="none"){
					text = table.rows[i].cells[n].innerHTML;
					if(aFiltro[n].length>0){
						if(!aFiltro[n].includes(text) ){
							table.rows[i].style.display="none"
						}
					}
				}
			}
		}
	}
}





</script>


</body>

</html>