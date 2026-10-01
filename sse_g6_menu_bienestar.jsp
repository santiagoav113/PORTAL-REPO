<%@ taglib uri="M4Tags" prefix="m4"%>
<%@ page import="java.io.*, java.util.*, java.net.*" %>
<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>Motivos para sonreir</title>
<link href="/css/estilo_sse.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/libreria/funciones_sse.js"></script>
<%@ include file="../../sse_generico/espanol/menu_ess.jsp" %>	
<%@ page  import="com.meta4.session.*, com.meta4.m4operations.*" %>	
<%      
    String estado = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"estado");
	if ((estado==null)||(estado.equals(""))){estado="0";}
%>
</head>
<body>
<%@ include file="../../sse_generico/espanol/generico_menusup.jsp" %>
<%@ include file="../../sse_generico/espanol/generico_links.jsp" %>

<%
   String zsubsesion = "SSE_VALIDA_VINCULOS_AMOR";
   String zmeta4object = "SSE_VALIDA_VINCULOS_AMOR";
   String znodo = "SSE_PARAM_EMP_VINC";
   String znodo2 = "SSE_PARAM_LT_VINC";
   String znodo3 = "SSE_PARAM_TP_CONT_VINC";
   String znodo4 = "SSE_PARAM_TP_EMP_AMOR";
   String ztipocarga = "INI";

   String zoutputdef = zsubsesion + "!" + znodo + "[*]";
   String zmove = znodo + ":" +znodo + "[FIRST]";
   String zcomun = znodo + ":" + zsubsesion + "!" + znodo + "[0]" + ".";

   String zoutputdef2 = zsubsesion + "!" + znodo2 +"[*]";
   String zmove2 = znodo2 + ":" +znodo2 + "[FIRST]";
   String zcomun2 = znodo2 + ":" + zsubsesion + "!" + znodo2 + "[&VAR.m4lix]" + ".";
  
   String zoutputdef3 = zsubsesion + "!" + znodo3 + "[*]";  
   String zmove3 = znodo3 + ":" +znodo3 + "[FIRST]";
   String zcomun3 = znodo3 + ":" + zsubsesion + "!" + znodo3 + "[&VAR.m4lix]" + ".";

   String zoutputdef4 = zsubsesion + "!" + znodo4 + "[*]";  
   String zmove4 = znodo4 + ":" +znodo4 + "[FIRST]";
   String zcomun4 = znodo4 + ":" + zsubsesion + "!" + znodo4 + "[&VAR.m4lix]" + ".";

   String zCCB_PARAM_TOT = zcomun + "CCB_PARAM_TOT";   
   String zValida = "";      

   String zmetodocarga = "CARGA:" + zsubsesion + "!SSE_PRINCIPAL.CARGA";
%>
<m4:startpage m4task="<%=zsubsesion%>"/>
<m4:beginjob/>
<m4:datadef m4o="<%=zmeta4object%>" m4name="<%=zsubsesion%>"/>
<m4:exec m4method="<%=zmetodocarga%>"><m4:param name="TIPO_CARGA" value="<%=ztipocarga%>"/></m4:exec>
<m4:outputdef m4alias="<%=znodo%>" ><m4:param name="m4name0" value="<%=zoutputdef%>"/></m4:outputdef>
<m4:outputdef m4alias="<%=znodo2%>"><m4:param name="m4name0" value="<%=zoutputdef2%>"/></m4:outputdef>
<m4:outputdef m4alias="<%=znodo3%>"><m4:param name="m4name0" value="<%=zoutputdef3%>"/></m4:outputdef>
<m4:outputdef m4alias="<%=znodo4%>"><m4:param name="m4name0" value="<%=zoutputdef4%>"/></m4:outputdef>
<m4:endjob/>
<m4:move><m4:param name="<%=zsubsesion%>"  value="<%=zmove%>"/></m4:move>
<m4:move><m4:param name="<%=zsubsesion%>"  value="<%=zmove2%>"/></m4:move>
<m4:move><m4:param name="<%=zsubsesion%>"  value="<%=zmove3%>"/></m4:move>
<m4:move><m4:param name="<%=zsubsesion%>"  value="<%=zmove4%>"/></m4:move>
<%
	int  zcount  = 0;
	int  zcount2  = 0;
	int  zcount3  = 0;
	int  zcount4  = 0;
	try {
	    M4Operations m = new M4Operations(request);
	    zcount = m.getCount(znodo,zsubsesion,znodo);	  
	    zcount2 = m.getCount(znodo2,zsubsesion,znodo2);
	    zcount3 = m.getCount(znodo3,zsubsesion,znodo3);
	    zcount4 = m.getCount(znodo4,zsubsesion,znodo4);
	} catch(Exception e) {}
	String	zcountv = String.valueOf(zcount);
	String	zcountv2 = String.valueOf(zcount2);
	String	zcountv3 = String.valueOf(zcount3);
	String	zcountv4 = String.valueOf(zcount4);
	

%>

<m4:item m4name="<%=zCCB_PARAM_TOT%>" var="zValida" htmlsafe="true"/>


<table width="100%">
<tr>
  <td class="titulofuncional" colspan="2">Motivos para Sonre&iacute;r</td>
</tr>
<tr>
	<td colspan="2">
		<div class="descripcionfuncional"> Selecciona la opción que deseas consultar </div>
		
	<ul class="listaenlace">
		<li><a class="enlacefuncional" title="Portafolio de Beneficios" tabindex="1" href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_frentes_beneficios.jsp?estado=61">Portafolio de Beneficios</a></li>
		<li><a class="enlacefuncional" title="Inscripción a programas de Bienestar Laboral" tabindex="2" href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_frentes.jsp?estado=61">Inscripción a programas de Bienestar Laboral</a></li>
		<!-- @13/03/2019: Franco T:  Opciones ocultas siguiendo las ordenes de Laura Pareja de TI para la salida en produccion de SF -->
		<!--li><a class="enlacefuncional" title="Postulacion a mejores de la clase" tabindex="3" href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_lmc.jsp?estado=61">Los Mejores de la Clase</a></li>
		<li><a class="enlacefuncional" title="Tiempo para ti" tabindex="4" href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_tiempo_para_ti.jsp?estado=61">Solicitud beneficios Tiempo para Ti</a></li-->
		<li><a class="enlacefuncional" title="Descuento empleados" tabindex="5" href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_desc_emp.jsp?estado=61">Descuento a empleados</a></li>
		
		<li><a class="enlacefuncional" title="Beneficio Combustible" tabindex="6" href="https://www.presente.com.co/ahorro/producto/combustible/" target="_blank">
		Beneficio Combustible
		</a></li>

		<% if (zValida.equals("S")){%>
		<!-- @13/03/2019: Franco T:  Opciones ocultas siguiendo las ordenes de Laura Pareja de TI para la salida en produccion de SF -->
		<!--li><a class="enlacefuncional" title="Vinculos de Amor" tabindex="6" href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_vinculos_amor.jsp">
		V&iacute;nculos de Amor
		</a></li-->
		<%}else if(zcount2>0 && zcount3>0 && zcount4>0){%>
		<!-- @13/03/2019: Franco T:  Opciones ocultas siguiendo las ordenes de Laura Pareja de TI para la salida en produccion de SF -->
		<!--li><a class="enlacefuncional" title="Vinculos de Amor" tabindex="6" href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_vinculos_amor.jsp">
		V&iacute;nculos de Amor
		</a></li-->
		<%}%>

		<!--Opción no habilitada por solicitud del usuario 
		<li><a class="enlacefuncional" title="Mi Casa" tabindex="4" href="/servlet/CheckSecurity/JSP/sse_g6/sse_g6_mi_casa.jsp?estado=61">Mi Casa</a></li>
		-->
	</ul>
	</td>
</tr>

</table>	
<%@ include file="../../sse_generico/espanol/generico_disclaimer.jsp" %>
</div>
</body>
<m4:endpage/>
</html>