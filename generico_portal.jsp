<%@ taglib uri="M4Tags" prefix="m4" %><%@ page import="java.io.*, java.util.*, java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Expires" content="0">
<%@ page  import="com.meta4.session.*, com.meta4.m4operations.*" %>
<%@ page import="com.meta4.configuration.*" %>
<%
	M4SessionCl zsesion = M4Context.getM4SessionCl(request);
    String estado = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"estado");
	String zlang = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"lang");
  String zBanner = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"banner");
	
	if (zlang!=null){
		zsesion.putBagEntries("lang",zlang);
	}

	if ((estado==null)||(estado.equals(""))){estado="0";}

	String zsubsesion = "SSE_INICIO";
	String zMeta4Object = "SSE_INICIO";
	String znodo = "SSE_INICIO";

	// No se modifica en general.

	String zoutputdef = zsubsesion + "!" + znodo + "[*]";
	String zlectura = zsubsesion + "!" + znodo;
	String zraiz = zsubsesion + "!" + znodo + ".";
	
	// Metodo de carga del Meta4Object generico

	String zmetodocarga = zsubsesion + "!SSE_INICIO.CARGA";

		// Items que vamos a cargar. Se deben anadir todos aquellos que se deseen visualizar

	String zENLACE 		= zraiz + "ENLACE";
	String zNENLACE 		= zraiz + "N_ENLACE";

   String zNOMBRE 		= "";
   String zCEDULA = "";
   String zZONA = "";
   String zSUBZONA = "";
   
   String zMAILWEBMASTER= "";
   String zMAILRRHH 	= "";
   String zSTDIDPERSON 	= "";
   String zIS_KNOWNET 	= "";

   String zES_ESPECIAL = "";
   String zES_JEFE 		= "";
   String zES_VALIDADOR = "";
   String zES_OPERADOR	= "";
   String zNIVEL_PUESTO	= "";
   
   String zTIENE_POLE	= "";
   String zTIENE_POLE_TRIMESTRAL	= "";
   
   //Carvajal Oct 10 2014: Variable para identificar si es reponsable de conflictos de paz y salvo
   String zES_RESPCONF	= "";
   
   //@david: 19/07/2011: 2 variables nuevas para gastos e inversiones
   String zACCESO_FRM	= ""; 
   String zACCESO_MTO_FRM	= "";
   //+H HB: 29/06/2024: variable para el acceso al reporte de descuadre de cajeros
   String zACCESO_RPT_DESC = "";    
   String zTIPO_EMPLEADO	= "";
   String zNOMBRE_WUNIT	= "";
   String zVALOR_SAL	= "";
   String zEmpresa ="";
   
   //--Los Mejores de la Clase
   //String zFecIniMC		= zraiz + "CCB_INICIO_SOL";
   //String zFecFinMC		= zraiz + "CCB_FIN_SOL";

	//--Los Mejores de la Clase POSTGRADI

   //String zFecIniMCP		= zraiz + "CCB_INICIO_SOL_POST";
   //String zFecFinMCP		= zraiz + "CCB_FIN_SOL_POST";
   
   
   //@David:28/09/2010: campos agregados para encuesta de la gerencia de inform?tica
   String zIdWorkLocation= "";
   String zNombreWorkLocation= "";
   String zIdWUParent="";
   String zNombreWUParent="";
   
   //@David: 16/08/2011: Nueva variable para el link de encuesta de clima laboral
   String zCOMENTARIO="";
   
    //Fases de objetivos Meta4 20/03/2012
   String zFASE_ASIGNACION 	= "";
   String zFASE_AJUSTE 		= "";
   
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Portal de servicios al empleado</title>
<link rel="stylesheet" href="/css/estilo_sse.css" type="text/css" />
<link rel="stylesheet" href="/css/jquery.modal.css" type="text/css" />
<script src="/libreria/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="/libreria/jquery.modal.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="/libreria/funciones_sse.js"></script>



<style type="text/css" media="screen">
    body > .modal {
      display: none;
      z-index: 99999 !important;
    }

    .part {
      display: none;
    }
</style>

<script type="text/javascript">
	//Al cargar la página se desplaza hasta el fondo para poder visualizar las encuestas.
	function iniciar(){
		//window.scroll(0,document.documentElement.scrollHeight);
		bannerDinamico();
	}
</script>

</head>
<m4:setrole m4role="EMPLEADO"/>
<body onload="iniciar()">
<input type="hidden" id="bolsa" name="bolsa" value="<m4:getbagvalue m4key='PERSONA'/>" />
<input type="hidden" id="bolsa2" name="bolsa2" value="<m4:getbagvalue m4key='PERSONA'/>" />

   	<script type="text/javascript">
	$(document).ready(function(){
	
	var banner = "<%=zBanner%>";
	var valor_bolsa = $("#bolsa").val();
	var valor_bolsa2 = parseInt($("#bolsa2").val());
	if (banner != "0" || valor_bolsa != "1"){
		$('#ex5').hide();
		$('#ex5').empty().append().load("sse_banner.jsp");		
	}
	if (valor_bolsa2!=1){
		$('#beneficios').hide();
		$('#beneficios').empty().append().load("sse_banner_benef.jsp");			
	}
	
	});

    	
    </script>	
	




	<!-- -Mensaje contraseña -->
    <m4:startpage m4task="<%=zsubsesion%>"/><m4:beginjob/>
    <m4:datadef m4o="<%=zMeta4Object%>" m4name="<%=zsubsesion%>"/>
    <m4:exec m4method="<%=zmetodocarga%>"/>
    <m4:outputdef m4alias="<%=znodo%>"><m4:param name="m4name0" value="<%=zoutputdef%>"/></m4:outputdef>
    <m4:endjob/>
    <m4:getapplparam section="CONFIG_CW" key="SERVER_KNOWNET" output="jsp"/>
	 
    
<%
    String aux_provider = (String)pageContext.getAttribute("SERVER_KNOWNET");
    if(aux_provider.equals("-1")||aux_provider.equals("NULL")){
        zIS_KNOWNET="1";
    }else{
        zIS_KNOWNET="0";
    }
    String Server_Peoplenet = M4ConfigClient.getElement("M4Client.SERVERWEB");
    String Port_Peoplenet = M4ConfigClient.getElement("M4Client.WEBSERVERPORT");
    String Servlet_local =  M4ConfigClient.getElement("M4Client.ThinClient.ExternalContentProvider.Local");
    String secure = String.valueOf(request.isSecure());
    String protocolo = "";
    
    if(secure.equals("false")){
        protocolo="http://";
    }else{
        protocolo="https://";
    }
    String Total_Server_Knownet = protocolo+Server_Peoplenet+":"+Port_Peoplenet+Servlet_local+"?_PROVIDER="+aux_provider;

    try {
        M4Operations Introduccion2 = new M4Operations(request);
        zNOMBRE = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","NOMBRE");
        zCEDULA	= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","DOCUMENTO");
        zZONA = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ZONA");
        zSUBZONA = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","SUBZONA");		
		
        //Variables agregadas por la encuesta de la gerencia inform?tica
        zIdWorkLocation= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ID_WORK_LOCATION");
        zNombreWorkLocation= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","N_WORK_LOCATION");
        zIdWUParent=Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ID_WU_PADRE");
        zNombreWUParent=Introduccion2.getItem(znodo,zMeta4Object,znodo,"","N_WU_PADRE");
		zEmpresa=Introduccion2.getItem(znodo,zMeta4Object,znodo,"","SCO_ID_LEG_ENT");
		
        zES_ESPECIAL = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ES_ESPECIAL");		
		zCOMENTARIO = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","COMENTARIO");
		
        zMAILWEBMASTER 	= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","MAIL_WEBMASTER");
        zMAILRRHH = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","MAIL_RRHH");
        zSTDIDPERSON = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","STD_ID_PERSON");
        //zProgAbiertoMC 	= Double.valueOf(Introduccion2.getItem(znodo,zMeta4Object,znodo,"","PROG_ABIERTO_MC")).intValue();
        //zProgAbiertoMCP = Double.valueOf(Introduccion2.getItem(znodo,zMeta4Object,znodo,"","PROG_ABIERTO_MC_POST")).intValue();
        //zFecIniMC		= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","FECHA_INICIO_MC");
        //zFecFinMC		= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","FECHA_FIN_MC");
        //zFecIniMCP		= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","FECHA_INICIO_MC_POST");
        //zFecFinMCP		= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","FECHA_FIN_MC_POST");
        zES_JEFE		= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ES_JEFE");
        zES_VALIDADOR	= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ES_VALIDADOR");
        zES_OPERADOR	= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ES_OPERADOR");
		zES_RESPCONF	= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ES_RESP_CONF");
        zNIVEL_PUESTO	= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ES_NIVEL_ALTO");
        zTIENE_POLE 	= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","TIENE_POLE");
		zTIENE_POLE_TRIMESTRAL 	= Introduccion2.getItem(znodo,zMeta4Object,znodo,"","TIENE_POLE_TRIMESTRAL");
        zTIPO_EMPLEADO = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","TIPO_EMPLEADO");
        zNOMBRE_WUNIT = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","NOMBRE_WUNIT");
        zVALOR_SAL = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","VALOR_SAL");
		//2 variables gastos e inversiones
		zACCESO_FRM = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ACCESO_FRM");
		zACCESO_MTO_FRM = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ACCESO_MTO_FRM");
		//+H HB se incluye variable de acceso al reporte de descuadre
		zACCESO_RPT_DESC = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","ACCESO_RPT_DESCUADRE");        
        zsesion.putBagEntries("minombre",zNOMBRE);
        zsesion.putBagEntries("mailrrhh",zMAILRRHH);
        zsesion.putBagEntries("zIdPerson",zSTDIDPERSON);		
        zsesion.putBagEntries("mailwebmaster",zMAILWEBMASTER);
        zsesion.putBagEntries("IsKnownet",zIS_KNOWNET);
        zsesion.putBagEntries("Total_Server_Knownet",Total_Server_Knownet);
        zsesion.putBagEntries("aux_provider",aux_provider);
        
		zsesion.putBagEntries("esJefe",zES_JEFE);
        zsesion.putBagEntries("esValidador",zES_VALIDADOR);
        zsesion.putBagEntries("esOperador",zES_OPERADOR);
		zsesion.putBagEntries("esRespConflicto",zES_RESPCONF);
        zsesion.putBagEntries("NivelPuesto",zNIVEL_PUESTO);
        zsesion.putBagEntries("TienePole",zTIENE_POLE);
		zsesion.putBagEntries("TienePoleTrimestral",zTIENE_POLE_TRIMESTRAL);
        zsesion.putBagEntries("TipoEmpleado",zTIPO_EMPLEADO);
        zsesion.putBagEntries("Nombre_Wunit",zNOMBRE_WUNIT);
        zsesion.putBagEntries("VALOR_SAL",zVALOR_SAL);
		zsesion.putBagEntries("cedula",zCEDULA);
		zsesion.putBagEntries("empresa",zEmpresa);
		
		//2 variables gastos e inversiones
		zsesion.putBagEntries("accesoFirma",zACCESO_FRM);
		zsesion.putBagEntries("accesoMtoFirma",zACCESO_MTO_FRM);		
		zsesion.putBagEntries("accesoRptDescuadre",zACCESO_RPT_DESC);
		//2 variables para encuestas dirigidas
		zsesion.putBagEntries("esEspecial",zES_ESPECIAL);
		zsesion.putBagEntries("comentario",zCOMENTARIO);
		zsesion.putBagEntries("IdWorkLocation",zIdWorkLocation);
		
		//Fases de objetivos Meta4 20/03/2012
		zFASE_ASIGNACION = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","FASE_ASIGNACION");
		zFASE_AJUSTE 	 = Introduccion2.getItem(znodo,zMeta4Object,znodo,"","FASE_AJUSTE");		
		zsesion.putBagEntries("faseAsignacion",zFASE_ASIGNACION);
		zsesion.putBagEntries("faseAjuste",zFASE_AJUSTE);
		

    } catch(Exception e) {}

int zTab=12;
%>


<% //Cambio para ingresar a accesos directos desde Success Factors

  String valURI = "";
  valURI =  com.meta4.taglib.util.M4SafeRequest.getParameter(request,"url");

  if ((valURI==null)||(valURI.equals(""))){valURI="";}
  //out.println(valURI);

  if ((valURI!=null) || (!valURI.equals(""))){    
    valURI = valURI.replaceAll("\\?", ""); 
    if (valURI.equals("a")){
      response.sendRedirect("/servlet/CheckSecurity/JSP/sse_generico/generico_portal.jsp");
    }
    if (valURI.equals("b")){
      response.sendRedirect("/servlet/CheckSecurity/JSP/sse_g2/sse_g2_p4.jsp?estado=21");
    }
    else if (valURI.equals("c")){
      response.sendRedirect("/servlet/CheckSecurity/JSP/sse_g2/sse_g2_menu_certificados.jsp?estado=21");         
    }
    else if (valURI.equals("d")){
      response.sendRedirect("/servlet/CheckSecurity/JSP/sse_g6/sse_g6_menu_bienestar.jsp?estado=61");           
    }
  }

%>
<script type="text/javascript" language="Javascript1.5">
    var sIsKnownet = "<%=zIS_KNOWNET%>";
    var sTotal_Server_Knownet = "<%=Total_Server_Knownet%>";
    var sNivelPuesto = "<%=zNIVEL_PUESTO%>";
</script>

<script type="text/javascript" language="Javascript1.5">
    var sIsKnownet = "<%=zIS_KNOWNET%>";
    var sTotal_Server_Knownet = "<%=Total_Server_Knownet%>";
    var sTienePole = "<%=zTIENE_POLE%>";
	var sTienePoleTrimestral = "<%=zTIENE_POLE_TRIMESTRAL%>";
</script>

<%@ include file="generico_menusup_portal.jsp"%>
<%@ include file="generico_links_portal.jsp"%>

<%@ include file="../../sse_generico/espanol/menu_ess.jsp" %>
<%@ include file="/sse_g3/sse_ev_trans.jsp"%>	

    <%
        //@David B: 16/06/2011: Validación contraseña.
		String sLoginError = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"M4_LOGIN_ERROR");
        if (sLoginError != null)
        {
            if (sLoginError.equals("PASSWORD_ABOUT_TO_EXPIRE"))
            {
                    String sExpiresIn = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"M4_EXPIRES_IN");
                    if (sExpiresIn == null){
                            sExpiresIn = "0";
                    }
                    String sMessage = "Su contrase&ntilde;a expira en " + sExpiresIn + " d&iacute;as. Se recomienda que la actualice.";
    %>			
					
					<table border="0" width="100%">
					<tr>
					 <td><div class="tituloerrores"> Aviso - Contrase&ntilde;a a punto de expirar	</div></td>
					</tr>
					<tr>
					<td>	
					<div>&nbsp;&nbsp;<%=sMessage %></div>
					</td>
					</tr>
					</table><br><br>
				
					
    <%	     }
             else{
    %>
				<table border="0" width="100%">
					<tr>
					<td>
            <div class="tituloerrores">	Aviso </div>
          </td>
					</tr>
					<tr>
					<td>	
					<div>&nbsp;&nbsp;<%=sLoginError%></div>
					</td>
					</tr>
				</table><br><br>

    <%	    }
        }
    %>

	

<div id="beneficios" class="modal" style="display:none"></div>

<!-- End ImageReady Slices -->
<div id="ex5" class="modal" style="display:none"> Banneer </div>


</div>

</body>

</html>