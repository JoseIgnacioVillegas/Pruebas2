<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

    
<!DOCTYPE html>




<html lang="en">

<!-- En este archivo .jsp esta definida la cabecera -->
	<%@ include file="head.jsp" %> 


<body id="page-top">

  



  <!-- Page Wrapper -->
  <div id="wrapper">

<!-- En este archivo .jsp esta definida superior -->
	<%@ include file="sidebar.jsp" %> 
	
	
	
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- En este archivo .jsp esta definida superior -->
		<%@ include file="topbar.jsp" %> 

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Gestionar copias de seguridad del sistema </h1>
          </div>

      
      


 		<!-- Content Row -->
          <div class="row" >	
			<div class="card mb-4 py-3 border-bottom-primary" style="width:60%;align:center;margin-left:auto;margin-right:auto;">
				<div class="card-body">
					<p>Para exportar los datos de las asignaturas y planes de estudios haz click aquí: 
					<form action="ExportarAsignaturasServlet"><input  type="submit" value="Exportar Asignaturas"/> </form></p>
				</div>
			</div>
          </div>
          
          
          <!-- Content Row -->
          <div class="row" >	
			<div class="card mb-4 py-3 border-bottom-primary" style="width:60%;align:center;margin-left:auto;margin-right:auto;">
				<div class="card-body">
					<p>Para restaurar una antigua versión de la base de datos selecciones un archivo con formato .mv.db </p>
	<form action="RestoreServlet" enctype="MULTIPART/FORM-DATA" method="post">
            <input type="file" name="file" /><br><br>
            <input type="submit" value="Restaurar" />
        </form>
				</div>
			</div>
          </div>


        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->






<footer class="sticky-footer bg-white" >
  <div class="container my-auto">
    <div class="copyright text-center my-auto">

  <p>TFG Gestión docente - 2019</p></div></div>
</footer>






    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->





  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  
<!-- En este archivo .jsp estan incluidos los enlances a los archivos JS -->
	<%@ include file="JavaScript.jsp" %> 

</body>

</html>



