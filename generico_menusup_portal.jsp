<%@page import="co.com.linix.consulta.ws.UtilsRedHumana, java.text.DateFormat, java.text.SimpleDateFormat, java.util.Date" %>

<%@ page import="java.net.*, java.io.*" %>

<%

	String zminombre = zsesion.getBagEntries("minombre");
	String zIdPerson = zsesion.getBagEntries("zIdPerson");
	String IsKnownet = zsesion.getBagEntries("IsKnownet");
	String esJefe = zsesion.getBagEntries("esJefe");
	String esValidador = zsesion.getBagEntries("esValidador");
	String NivelPuesto = zsesion.getBagEntries("NivelPuesto");	 
	String esOperador = zsesion.getBagEntries("esOperador");
	String gmpEmpresa = zsesion.getBagEntries("empresa");
	//Carvajal Oct 10 2014: Variable para identificar si es reponsable de conflictos de paz y salvo
	String esRespConflicto = zsesion.getBagEntries("esRespConflicto");

	//2 variables nuevas gastos e inversiones
	String accesoFirma = zsesion.getBagEntries("accesoFirma");
	String accesoMtoFirma = zsesion.getBagEntries("accesoMtoFirma");
	String accesoRptDescuadre = zsesion.getBagEntries("accesoRptDescuadre");
	
	//variable para mostrar el saludo en el portal
	String zLabelNombre= "";
	zLabelNombre= zminombre.substring(zminombre.indexOf(',')+2);

    String zApellido = zminombre.substring(0, zminombre.indexOf(',')); 
	String zNom_Ape  = zLabelNombre + " " + zApellido;
	
	String zMAILRH= zsesion.getBagEntries("mailwebmaster");
	String zIdDependencia= zsesion.getBagEntries("IdWorkLocation");		
	
	//@David 04/08/2011: Sección de código para formar el vínculo de clase virtual

	//https://clasevirtual.grupoexito.com.co/ekp/servlet/ekp?TX=RHSSO&userid=idusuario&check=md5(claveintegracion+portalredhumana.grupoexito.com+idusuario+yyyyMMddhh)

	

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
<!--FT@META4 11/03/2019: Ocultar Opciones Exito  -->
    	<!--li><a href="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_cumples.jsp?estado=0" class="top">Cumplea&ntilde;os</a></li> 

  		<li><a href="#">Contactos</a> 

          <ul> 

        <li><a href="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_p1.jsp?estado=0">Mis contactos</a></li> 

        <li><a href="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_buscar_contactos.jsp?estado=0">Buscar contactos</a></li> 

	      </ul> 

    </li> 

    <li><a href="#">Favoritos</a> 

      <ul> 

        <li><a href="/servlet/CheckSecurity/JSP/sse_g0/sse_g0_editar_links.jsp?estado=0">Editar favoritos</a></li> 

        <li>		

		<a href="Javascript:Enviar();">Agregar a favoritos</a></li> 

        </ul> 

    </li-->



<%

	//@David B: 08/06/2011 : Esta sección de código me sirve para mostrar la lista de favoritos seleccionada por el usuario

	String strcuentareg = "";

	String zitem = "";

	String zURL = "";

	String nombremio = "";

	try {

		int cuentareg = 0;

		int i = 0;

		M4Operations Introduccion = new M4Operations(request);

		cuentareg = Introduccion.getCountInClient(znodo,zMeta4Object,znodo);

		for (i = 0; i < cuentareg; i++){

			String stri =String.valueOf(i);

			zitem = Introduccion.getItem(znodo,zMeta4Object,znodo,stri,"N_ENLACE");

			zURL = Introduccion.getItem(znodo,zMeta4Object,znodo,stri,"ENLACE");

			String s = zitem + "{|&|}" + zURL;

			zsesion.putBagEntries("key" + stri,s);

%>	  	
<!--FT@META4 11/03/2019: Ocultar Opciones Exito  -->
	<!--li><a href="<%=zURL%>">&nbsp;&nbsp;&nbsp;&nbsp;<%=zitem%></a></li-->

<%

	}

	strcuentareg = String.valueOf(cuentareg);

	zsesion.putBagEntries("totalfavoritos",strcuentareg);

} catch(Exception e) {}

%>	

	
<!--FT@META4 11/03/2019: Ocultar Opciones Exito  -->
    <!--li><a href="/servlet/CheckSecurity/JSP/sse_g0/change_password.jsp?estado=01">Actualizar contrase&ntilde;a</a></li-->

	

	
   <% if (gmpEmpresa.equals("11")==false){ %>
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
	<!--
	<li>
		<a href="" target="_blank">Clase virtual</a> 
	</li>
	-->
<!--FT@META4 11/03/2019: Ocultar Opciones Exito  -->
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

        <li><a href="/servlet/CheckSecurity/JSP/sse_generico/generico_envio_correo.jsp?tipo_correo=gestion">Escribir a recursos humanos</a></li> 

        <li><a href="/servlet/CheckSecurity/JSP/sse_generico/generico_envio_correo.jsp?tipo_correo=admin">Escribir al Fondo PRESENTE</a></li> 

      </ul> 

    </li-->
	<!--FT@META4 11/03/2019: Ocultar Opciones Exito  -->
	<!--li>
		<a href="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p8_con_int_0.jsp?estado=0">Conflicto de Intereses</a> 
	</li-->

  </ul>

    </div>

        

<!--  Oculto temporalmente
  <div class="btn_ayuda">
        <a href="http://mt4web:8100/sse_generico/tutoriales/colaborador/index.html" target="_blank">
			<img src="/iconos/espanol/btn_ayuda2_06.png" alt="¿Necesitas ayuda?" />
        </a>
    </div>
-->
   <% if (gmpEmpresa.equals("11")==false){ %>
<!--   **************************  MANEJO DE ENCUESTAS EN EL PORTAL *******************************************************   -->
<%@ include file="generico_encuestas.jsp" %>
	
<!--   **************************  FIN MANEJO DE ENCUESTAS EN EL PORTAL ****************************************************   -->
	<% } %>

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
		<% if(esJefe.equals("1")==true || esValidador.equals("1")==true){%>
			<% if (gmpEmpresa.equals("11")==false){ %>
				<a href="/servlet/CheckSecurity/JSP/mss_generico/mssgenerico_portal.jsp?estado=0" title="Portal del jefe">

					<img src="/iconos/espanol/ico1_06.png" width="38" height="39" />

				</a>
			<% } %>
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