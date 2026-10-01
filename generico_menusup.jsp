<%@ page import="co.com.linix.consulta.ws.UtilsRedHumana, java.text.DateFormat, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page import="java.net.*, java.io.*" %>
<%
	M4SessionCl zsesion = M4Context.getM4SessionCl(request);
	String zminombre = zsesion.getBagEntries("minombre");
	String zIdPerson = zsesion.getBagEntries("zIdPerson");
	String IsKnownet = zsesion.getBagEntries("IsKnownet");
	String esJefe = zsesion.getBagEntries("esJefe");
	String esValidador = zsesion.getBagEntries("esValidador");
	String NivelPuesto = zsesion.getBagEntries("NivelPuesto");
	String TienePole = zsesion.getBagEntries("TienePole");
	String TienePoleTrimestral = zsesion.getBagEntries("TienePoleTrimestral");
	String esOperador = zsesion.getBagEntries("esOperador");
	//Carvajal Oct 10 2014: Variable para identificar si es reponsable de conflictos de paz y salvo
	String esRespConflicto = zsesion.getBagEntries("esRespConflicto");
	//Damian: Variables nuevas Gastos e Inversiones
	String accesoFirma = zsesion.getBagEntries("accesoFirma");
	String accesoMtoFirma = zsesion.getBagEntries("accesoMtoFirma");
	String accesoRptDescuadre = zsesion.getBagEntries("accesoRptDescuadre");
	String zES_ESPECIAL= zsesion.getBagEntries("esEspecial");	
	String zCOMENTARIO= zsesion.getBagEntries("comentario");
	String zNombreWUParent= zsesion.getBagEntries("zNombreWUParent");
	String zLabelNombre= zminombre.substring(zminombre.indexOf(',')+2);
	String zApellido = zminombre.substring(0, zminombre.indexOf(',')) ;
	String zNom_Ape  = zLabelNombre + " " + zApellido;
	String zMAILRH= zsesion.getBagEntries("mailwebmaster");
	String zIdDependencia= zsesion.getBagEntries("IdWorkLocation");	
	String zEmpresa= zsesion.getBagEntries("empresa");
	
	
	//@David 04/08/2011: Sección de código para formar el vínculo de clase virtual
	//https://clasevirtual.grupoexito.com.co/ekp/servlet/ekp?TX=RHSSO&userid=idusuario&check=md5(claveintegracion+portalredhumana.grupoexito.com+idusuario+yyyyMMddhh)
	
	String zCEDULA = zsesion.getBagEntries("cedula");
	DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHH");

	Date fecha=new Date();
	
	//Date fecha1=new Date();
	//fecha.setHours (fecha1.getHours() - 1);
 
	String stringFecha=dateFormat.format(fecha);
	String claveintegracion="redhextclsvrt";
	String hostAddress="";
	
		//Obtenemos la dirección ip del host
	try{
		InetAddress thisIp = InetAddress.getLocalHost();
		hostAddress=thisIp.getHostAddress();	
	}catch(Exception e){
	}
	hostAddress="10.3.225.46";
	String checkClaseVirtual=claveintegracion+hostAddress+zCEDULA+stringFecha;
	
	//Se cambia link por Solic Dllo 1996
	//String linkClaseVirtual="http://clasevirtual.com.co/ekp/servlet/ekp?TX=RHSSO";
	String linkClaseVirtual="https://clasevirtual.grupoexito.com.co/ekp/servlet/ekp?TX=RHSSO";
	
	StringBuffer token= new StringBuffer();
	
	UtilsRedHumana utilidades= new UtilsRedHumana();
	token=utilidades.encriptarMD5(checkClaseVirtual);	
	
	//@David 09/07/2014: Se reemplaza en la siguiente cadena la palabra 'check' por  token por solicitud del proveedor KPG
	//linkClaseVirtual= linkClaseVirtual + "&userid="+ zCEDULA + "&check=" + token;	
	linkClaseVirtual= linkClaseVirtual + "&userid="+ zCEDULA + "&token=" + token;
	
%>

	
<!--  @09/06/2011: David B:  Formulario que envía el nuevo favorito -->
<form action="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_actualizar_links.jsp?estado=0" method="post" name="Favoritos" id="Favoritos">
	<input type="hidden" id="TIT" name="TIT" value="" />
	<input type="hidden" id="URL" name="URL" value="" />
</form>

<div class="wrap">

	<script type="text/javascript">
		function Enviar(){
			var URL = m4url();
			var titulo = m4titulo();
			m4valor ("Favoritos", "TIT", titulo, "set");
			m4valor ("Favoritos", "URL", URL, "set");
			m4submit("Favoritos");
		}
	</script>	
  <div class="izq">
    	<img src="/iconos/espanol/logo_02.png" alt="Red Humana" width="214" height="113" />  
        
        <div class="clear"></div>
        
    <div class="menu_izq">
        <ul> 
		<!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
    	<!--li><a href="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_cumples.jsp?estado=0" class="top">Cumplea&ntilde;os</a></li> 
  		<li><a href="#">Contactos</a> 
          <ul> 
        <li><a href="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_p1.jsp?estado=0">Mis contactos</a></li> 
        <li><a href="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_buscar_contactos.jsp?estado=0">Buscar contactos</a></li> 
	      </ul> 
    </li> 
    <li><a href="#">Favoritos</a> 
      <ul> 
        <li><a href="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_editar_links.jsp?estado=0">Editar Favoritos</a></li> 
        <li>
			<a href="Javascript:Enviar();">Agregar a favoritos</a>
		</li> 
        </ul> 
    </li-->
	
<%
	String total = zsesion.getBagEntries("totalfavoritos");
	int ntotal = Integer.parseInt(total);
try {
	int inicio = 0;
	String url = "";
	String nombre = "";
	int i = 0;
	for (i = 0; i < ntotal; i++){
		String stri =String.valueOf(i);
		String llave = "key" +  stri;
		String nombrelink = zsesion.getBagEntries(llave);
		inicio = nombrelink.indexOf("{|&|}");
		nombre=nombrelink.substring(0,inicio);
		url=nombrelink.substring(inicio+5,nombrelink.length());
%> 	
<!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
		<!--li><a href="<%=url%>">&nbsp;&nbsp;&nbsp;&nbsp;<%=nombre%></a></li-->
<%

	}
} catch(Exception e) {}
%>	
	
<!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
	<!---li><a href="/servlet/CheckSecurity/JSP/sse_g0/change_password.jsp?estado=01">Actualizar contrase&ntilde;a</a></li-->
	<% if (zEmpresa.equals("11")==false){ %>
	<li><a href="#">Acceso</a>
		<ul>
				<% 	//@David: 07/06/2011: Accesos ocultos, disponibles solo para algunas personas.
				if(esOperador.equals("1")==true){%>			  
					  <li><a href="/servlet/CheckSecurity/JSP/mss_g3/a_masiva_1.jsp?estado=0">Carga Personal Externo</a></li>
					  <br>
				<% }else if(esOperador.equals("2")==true){ %>
							  	<!--FT@META4 21/03/2019: Ocultar Opciones Exito  -->
				<!--@David: 04/10/2012: CAU C000424 Ingreso si el empleado tiene acceso a ElEmpleo.com -->
					  <!--li><a href="/servlet/CheckSecurity/JSP/mss_g3/mss_g3_empleo_vacantes.jsp?estado=0">ElEmpleo.com</a></li-->	  	 
				<% }if(accesoFirma.equals("1")==true){%> 
					  <li><a href="/servlet/CheckSecurity/JSP/mss_g3/mss_g3_firmas_autorizadas.jsp?estado=0">Consulta Firmas Autorizadas</a></li>
					  <br>
				<% } if(accesoRptDescuadre.equals("1")==true){%> 
						<li><a href="/servlet/CheckSecurity/JSP/mss_g3/mss_g3_rpt_descuadre_cajero.jsp?estado=0&iddep=<%=zIdDependencia%>"> Reporte de Descuadres Cajero</a></li>
						<br>	  
				<% } if(esRespConflicto.equals("1")==true){%>
						<li><a href="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p1_paz_salvo_val.jsp?estado=11">Validación paz y salvo</a></li>
						<br>
				<% } %>
      </ul>
    </li>
	<% } %>
	
	
<!--//	<li>
//		<a href="<%= linkClaseVirtual %>" target="_blank">Clase virtual</a> 
//	</li>
-->
<!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
    <!--li>
		<a href="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p7_360_0.jsp?estado=0">360° Contigo - Escr&iacute;benos</a> 
	</li-->

	
	<!--@David 14/11/2012: Cau C039825- Nueva opción Encuestas de Exito  -->
	<!--
	<li>
		<a style="background: #fff url(/iconos/espanol/menu_izq_16_amarillo.png);color: black;" href="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_ideas.jsp?estado=01">Ideas de &Eacute;xito<sup style="color:red;">* Nuevo</sup></a>
	</li>
	-->
	
				  	<!--FT@META4 21/03/2019: Ocultar Opciones Exito  -->
	<!--li><a href="#" class="btm">Cont&aacute;ctenos</a> 
      <ul> 
        <li><a href="/servlet/CheckSecurity/JSP/sse_generico/generico_envio_correo.jsp?tipo_correo=gestion">Recursos humanos</a></li> 
        <li><a href="/servlet/CheckSecurity/JSP/sse_generico/generico_envio_correo.jsp?tipo_correo=admin">Fondo PRESENTE</a></li> 
      </ul> 
    </li-->
<!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
	<!--li>
		<a href="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p8_con_int_0.jsp?estado=0">Conflicto de Intereses</a> 
	</li-->
	
  </ul>
    </div>
  
<!--   Opción deshabilitada
  <div class="btn_ayuda">
        <a href="http://mt4web:8100/sse_generico/tutoriales/colaborador/index.html" target="_blank">
        <img src="/iconos/espanol/btn_ayuda2_06.png" alt="¿Necesitas ayuda?" />
        </a>
    </div>
-->

<!--   **************************  MANEJO DE ENCUESTAS EN EL PORTAL *******************************************************   -->
	
<!--   **************************  FIN MANEJO DE ENCUESTAS EN EL PORTAL ****************************************************   -->

	<!-- cierra div panel izquierdo-->
	</div>
    
  <div class="der_conte">
  
  <div class="header">
    <div class="header_info">
    <div class="icons_header">
        <a href="/servlet/CheckSecurity/JSP/sse_generico/sse_logout.jsp?estado=0" title="Desconectar">
            <img src="/iconos/espanol/ico1_07.png" alt="Desconectar" />
        </a>
		<!--
		+HUMANO Junio 2025
		Ajustes Portal
		Se oculta link del portal del lider
		-->
		<!--
		<% 	//@David B 09/06/2011 : Si el usuario es jefe o validador delegado, debe aparecerle el vínculo del portal del jefe.
			if(esJefe.equals("1")==true || esValidador.equals("1")==true){%>
			   <% if (zEmpresa.equals("11")==false){ %>
					<a href="/servlet/CheckSecurity/JSP/mss_generico/mssgenerico_portal.jsp?estado=0" title="Portal del jefe">
						<img src="/iconos/espanol/ico1_06.png" />
					</a>
			   <%}%>
		<% } %>
		-->
        <a href="/servlet/CheckSecurity/JSP/sse_generico/generico_portal.jsp?estado=0">
            <img src="/iconos/espanol/ico2_08.png" alt="Inicio" />
        </a>
    </div>
    <div class="txt_info_header"><%@ include file="generico_fecha.jsp" %></div>
    </div>
    <img src="/iconos/espanol/serv_empl_04.png" alt="Servicio al empleado" width="278" height="105" />  
    </div>
	
	
	
   <% if (zEmpresa.compareTo("08")==0){ %>
		<%@ include file="generico_links_portal_evt.jsp"%>
   <% }else{ %>
   <% if (zEmpresa.compareTo("11")==0){ %>
		<%@ include file="generico_links_portal_pc.jsp"%>
   <% }else{ %>	
   
   <div class="menu_conte">
   <ul id="nav">
   <li><a href="#">Informaci&oacute;n personal</a>
     <ul class="sub">
	 <!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
         <!--li><a href="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p1.jsp?estado=11">Informaci&oacute;n de contacto..</a></li>		 
         <li><a href="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p3.jsp?estado=11">Informaci&oacute;n profesional</a></li>		 	 		
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p4.jsp?estado=11">Informaci&oacute;n complementaria</a></li>
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p6.jsp?estado=11">Informaci&oacute;n familiar</a></li-->
         <% if(accesoMtoFirma.equals("1")==true){%> 
				<li><a href="/servlet/CheckSecurity/JSP/mss_generico/mss_cargar_firma.jsp?estado=0">Mantenimiento Firmas Autorizadas</a></li>
         <% } %>		 
      </ul>
   </li>
   <li><a href="#">Informaci&oacute;n econ&oacute;mica</a>
     <ul class="sub">
	 	<!--  @FT 26/03/2019: Opción Cuenta bancaria deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
         <!--li><a href="/servlet/CheckSecurity/JSP/sse_g2/sse_g2_p1.jsp?estado=21">Cuenta bancaria</a></li-->
         <li><a href="/servlet/CheckSecurity/JSP/sse_g2/sse_g2_p4.jsp?estado=21">&Uacute;ltimos recibos</a></li>
         <!--  @David: Opción deshabilitada con autorización de la analista de nómina Claudia Herrera, porque la funcionalidad no está correcta.
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g2/sse_g2_simflex.jsp?estado=21">Simulador de compensaci&oacute;n flexible</a></li>
		 -->	
		 <!-- Phylum - 02/08/2017 - Abraham Cabrera - Se agrega la opción de conculta de descuentos -->
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g2/sse_g2_p12.jsp?estado=21">Consulta descuentos de n&oacute;mina</a></li>
		 
		 <!-- juandiegosanta@gmail.com - 5 sep 2021 - Abraham Cabrera - Se agrega la opción de "Aprobación descuadres de cajero" -->
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g2/sse_g2_descuadres_cajero.jsp?estado=21">Aprobaci&oacute;n descuadres de cajero</a></li>
		 
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g2/sse_g2_menu_certificados.jsp?estado=21">Certificados</a></li>		 <!--  @FT 21/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->		 <!-- Phylum - 14/03/2017 - Guillermo Bermúdez - Se agrega la opción de beneficios de tarjeta de regalo -->		 <!--li><a href="/servlet/CheckSecurity/JSP/sse_g2/sse_g2_benef_tr.jsp?estado=31">Informaci&oacute;n beneficios </a></li-->		 
     </ul>
   </li>
   <li><a href="#">Informaci&oacute;n laboral</a>
     <ul class="sub" >
	 <!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
         <!--li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p0.jsp?estado=31">Historial de puestos</a></li-->
		 
		 
		 <!-- MT4 HF7,11
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p6.jsp?estado=31">Objetivos</a></li>
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p22.jsp?estado=31">Competencias</a></li>
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p19.jsp?estado=31">Evaluaci&oacute;n de seguimiento</a></li>
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p4.jsp?estado=31">Evaluaciones de desempe&ntilde;o</a></li>
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p5.jsp?estado=31">Resultados de la evaluaci&oacute;n de desempe&ntilde;o</a></li>
		-->

		<!--@LUIS BOTERO : 10/02/2022: Ocultos por acuerdo con Sofia Vasquez ya que este proeceso ya es por Success Factors
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p6.jsp?estado=31">Objetivos</a></li>
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p22.jsp?estado=31">Valores y competencias</a></li>
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/ssco_evaluate.jsp">Valoraci&oacute;n de evaluaci&oacute;n</a></li>
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p4_1.jsp?estado=31">Evaluadores para tus procesos</a></li>
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p17.jsp?estado=31">Valoración de objetivos</a></li>	
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/ssco_evaluator_seg_filter.jsp">Evaluaci&oacute;n de seguimiento</a></li>		
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/ssco_evaluator_filter.jsp">Procesos de evaluaci&oacute;n</a></li>  
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/ssco_evaluator_filter.jsp">Evaluaci&oacute;n de desempeño</a></li>		
		 -->
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p5.jsp?estado=31">Resultados de la evaluaci&oacute;n de desempe&ntilde;o</a></li>

		<!--<script type="text/javascript">
				function validaUrl(timezone){
				
					if (timezone!=null && timezone!=""){
						//Obtengo la url actual
						url=document.location.href;
						//Identifico el servidor
						var URLsubstring=url.substring(0,11);
						//Esta variable almacena la url de la encuesta
						var URLencuesta="";
						
						if(URLsubstring==="https://m01"){
							URLencuesta="https://es.surveymonkey.com/r/5W7GJZM?id_usr="+timezone;
						}else if(URLsubstring==="https://m02"){						
							URLencuesta="https://es.surveymonkey.com/r/JMXBWGH?id_usr"+timezone;
						}else if(URLsubstring==="https://m03"){						
							URLencuesta="https://es.surveymonkey.com/r/JMHJ5GM?id_usr"+timezone;
						}else if(URLsubstring==="http://mt4q"){
							URLencuesta="https://es.surveymonkey.com/r/Y98F9TB?id_usr="+timezone;
						}				
						window.location.replace(URLencuesta);
					}
				}
			</script>		 
		 
		  <li><a onclick="validaUrl('<%= zCEDULA %>')" href="#">Resultados de la evaluaci&oacute;n de desempe&ntilde;o</a></li>-->		
		
		
		<!-- francot@meta4.com: 08/07/2016 Opción de plan de acción de desarrollo -->
		<!--  <li><a href="/servlet/CheckSecurity/JSP/sse_g3/ssco_g3_pdev.jsp?estado=31">Plan de acci&oacute;n</a></li>	-->	
		
		
		 <!-- David: 22/07/2011 Opción oculta por solicitud de analista gestión del desempeño Paula Madrigal --
		 <li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p20.jsp?estado=31">Valoraci&oacute;n de la evaluaci&oacute;n de seguimiento</a></li>		 
		 -->
<!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
         <!--li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_courses.jsp?estado=31">Formaci&oacute;n realizada</a></li>
         <li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p8.jsp?estado=31">Evaluaci&oacute;n de programas de formaci&oacute;n</a></li>
         <li><a href="/servlet/CheckSecurity/JSP/sse_g4/sse_g4_p1.jsp?estado=31">Ausencias laborales</a></li-->
         
         <% if ((Integer.parseInt(TienePole) == 1) || (Integer.parseInt(TienePole) == 2)) {  %>
         	<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p23_0.jsp?estado=31">Pole Position---</a></li>
         <%	} %>
		 
		 <% if (Integer.parseInt(TienePoleTrimestral) == 1) {  %>
         	<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_pole_trimestral_a.jsp?estado=31">Pole Position Trimestral</a></li>
         <%	} %>
		 
		
		<!-- JUANDIEGOSANTA@GMAIL.COM 21 SEP 2022  Turnos Portal Timera-->
		<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_turnos.jsp?estado=31">Turnos</a></li>		
		 
      </ul>
   </li>
<!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->   
   <!--li><a href="#">Solicitudes</a>
   		<ul class="sub">
   			<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p2.jsp?estado=41">Inscripci&oacute;n a convocatoria</a></li>
   			<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_sol_retro.jsp?estado=41">Retroalimentaci&oacute;n de selecci&oacute;n</a></li>
   			<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_p3_desc.jsp?estado=31">Inscripci&oacute;n a programas de formaci&oacute;n</a></li>
   			<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_brig.jsp?estado=41">Inscripci&oacute;n a la brigada</a></li>
   			<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_tras.jsp?estado=41">Traslado</a></li>
   			<li><a href="/servlet/CheckSecurity/JSP/sse_g3/sse_g3_jor.jsp?estado=41">Cambio de jornada</a></li>
            <li><a href="/servlet/CheckSecurity/JSP/sse_g4/sse_g4_lic.jsp?estado=41">Licencias y permisos</a></li>
            <li><a href="/servlet/CheckSecurity/JSP/sse_g4/sse_g4_p2.jsp?estado=41">Vacaciones</a></li>
			<li><a href="/servlet/CheckSecurity/JSP/sse_g4/sse_g4_p4.jsp?estado=41">Registro de Embarazo</a></li-->
            <!-- Opcion incluida en el menú certificados
			<li><a href="/servlet/CheckSecurity/JSP/sse_g2/sse_g2_cert_lab.jsp?estado=41">Certificados laborales</a></li>
			-->
            <!-- Opcion eliminada por solicitud con el CAU815695
			<li><a href="/servlet/CheckSecurity/JSP/sse_g2/sse_g2_solsimflex.jsp?estado=41">Asesor&iacute;a de compensaci&oacute;n flexible</a></li>
			-->
<!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->			
			<!--li><a href="/servlet/CheckSecurity/JSP/sse_g4/sse_g4_desc.jsp?estado=41">Descuentos de Nómina</a></li>
   		</ul>
   </li-->
   <!--FT@META4 21/03/2019: Cambia de nombre se quita la palabra fondos, Exito  -->
   <li><!--a href="#">Bienestar y Fondos</a-->
	<a href="#">Bienestar</a>
	 <ul class="sub">
   			<li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_bienestar.jsp?estado=61">Motivos para Sonre&iacute;r</a></li>
   			<!--Opción incluída dentro de la pantalla Programa de bienestar y PRESENTE
			<li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_evaluacion.jsp?estado=61">Evaluaci&oacute;n de programas</a></li>
			-->
   			
			<!-- Opcion incluida en motivos para sonreír
			<li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_lmc.jsp?estado=61">Los Mejores de la Clase</a></li>
			-->
			
			<!--Opciones incluídas dentro de la pantalla Los Mejores de la Clase
				<li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_mc.jsp?estado=61">Los Mejores de la Clase pregrado</a></li>
				<li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_mc_post.jsp?estado=61">Los Mejores de la Clase posgrado</a></li>
				<li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_mc_elegidos_prin.jsp?estado=61">Ganadores de Los Mejores de la Clase</a></li>
   			-->
			<!--Opción deshabilitada por solicitud del usuario de bienestar 
   			<li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_mi_casa.jsp?estado=61">Mi casa</a></li>
			-->
				<!--Opciones incluídas dentro de la pantalla Mi Casa
					<li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_mi_casa_segui.jsp?estado=61">Seguimiento solicitudes Mi Casa</a></li>
				-->		
<!--  @FT 13/03/2019: Opción deshabilitada con autorización de la analista de TI Laura Pareja, Con miras a la puesta en marcha de SF.-->
			<!--li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_fp.jsp?estado=61"><b>Fondo PRESENTE</b></a></li>
			<li><a href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_fondo_futuro.jsp?estado=61"><b>Fondo FUTURO</b></a></li-->
   		</ul>
   </li>
   
   <li><a href="/servlet/CheckSecurity/JSP/sse_generico/generico_notificaciones.jsp?estado=0">Notificaciones</a></li>
   </ul>
   <div class="clear">&nbsp;</div>
		
   </div>
   
   <% }} %>
   
   <div class="nombre">
	Hola <%=zLabelNombre%>
   </div>     
   
   <div class="informacion">
		<div class="contenido">