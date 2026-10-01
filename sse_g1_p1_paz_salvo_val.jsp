<%@ taglib uri="M4Tags" prefix="m4"%>
<%@ page import="java.io.*, java.util.*, java.net.*" %>

<!DOCTYPE html 

     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"

    "DTD/xhtml1-transitional.dtd">

<html>

<head><%@ page  import="com.meta4.session.*, com.meta4.m4operations.*,com.meta4.utilities.*" %>

<title>Valida Paz y Salvo</title>

<link href="/css/estilo_sse.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="/libreria/funciones_sse_val1.js"></script>

<script type="text/javascript" language="Javascript1.2"src="/libreria/funciones_sse.js"></script>


<script type="text/javascript" src="/libreria/clase_val_entradas.js"></script>

<%@ include file="../../sse_generico/espanol/menu_ess.jsp" %>

<%

Generatablaparametros zobjtabla = new Generatablaparametros(request);

String estado = zobjtabla.m4paramvalor("estado");

String zfiltro =zobjtabla.m4paramvalor("zfiltro");

String zinicios =zobjtabla.m4paramvalor("zinicios");	

String zparametro = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"param");

String zconflicto =zobjtabla.m4paramvalor("zconflicto");

String zarea =zobjtabla.m4paramvalor("zarea");

String zwunit =zobjtabla.m4paramvalor("zwunit");

String zfecbaja =zobjtabla.m4paramvalor("zfecbaja");

String zfeclimite =zobjtabla.m4paramvalor("zfeclimite");

String znomempleado =zobjtabla.m4paramvalor("znomempleado");

String znomconflicto =zobjtabla.m4paramvalor("znomconflicto");

String znomarea =zobjtabla.m4paramvalor("znomarea");

String znomwunit =zobjtabla.m4paramvalor("znomwunit");

if ((estado==null)||(estado.equals(""))){estado="0";}

if ((zfiltro==null)|| (""==zfiltro)){zfiltro = "Todos";} 

if ((zparametro==null)|| (""==zparametro)){zparametro = "";} 

if ((zconflicto==null)||(zconflicto.equals(""))){zconflicto="Todos";}

if ((zarea==null)||(zarea.equals(""))){zarea="Todos";}

if ((zwunit==null)||(zwunit.equals(""))){zwunit="Todos";}

if ((zfecbaja==null)||(zfecbaja.equals(""))){zfecbaja="";}

if ((zfeclimite==null)||(zfeclimite.equals(""))){zfeclimite="";}

if ((znomempleado==null)||(znomempleado.equals(""))){znomempleado="";}

if ((znomconflicto==null)||(znomconflicto.equals(""))){znomconflicto="";}

if ((znomarea==null)||(znomarea.equals(""))){znomarea="";}

if ((znomwunit==null)||(znomwunit.equals(""))){znomwunit="";}




String znivel =zobjtabla.m4paramvalor("znivel");

if ((znivel==null)||(znivel.equals(""))){

znivel = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"znivel");

if ((znivel==null)||(znivel.equals(""))){znivel = "1";}

}







if ((zinicios==null)||(zinicios.equals(""))){zinicios = "1";}

%>

<script type="text/javascript">

function isNumeric(n) { 
      return !isNaN(parseFloat(n)) && isFinite(n); 
}

function validaNumero(n) { 
	if(isNumeric(n.value)!=true)
	{
		alert('El valor ingresado no es numerico. Por favor corregir');
		n.focus();
	}
       
}

function filtrar(){


var valor =m4select("filtro","prueba","value");//m4select("filtro","prueba","value");
m4valor("oculto","zfiltro",valor,"set");
valor =m4select("conflicto","prueba","value");//m4select("filtro","prueba","value");

m4valor("oculto","zconflicto",valor,"set");

valor = document.forms["prueba"].fecbaja.value;

document.forms["oculto"].zfecbaja.value = valor;

valor = document.forms["prueba"].feclimite.value;

document.forms["oculto"].zfeclimite.value = valor;

var nombre = m4select(m4objeto("filtro","prueba"),"text");

document.forms["oculto"].znomempleado.value = nombre;

nombre = m4select(m4objeto("conflicto","prueba"),"text");

document.forms["oculto"].znomconflicto.value = nombre;

nombre = m4select(m4objeto("area","prueba"),"text");

document.forms["oculto"].znomarea.value = nombre;

nombre = m4select(m4objeto("wunit","prueba"),"text");

document.forms["oculto"].znomwunit.value = nombre;

valor =m4select("area","prueba","value");

m4valor("oculto","zarea",valor,"set");

valor =m4select("wunit","prueba","value");

m4valor("oculto","zwunit",valor,"set");

document.forms["oculto"].submit();


}

function m4enviar(){

	var cadena="";

	mensaje = "";

	var error = 0;

	var URL = "{TAG=SSE_PERSONA_CONFLICTO";	
	
	
	if (typeof(document.forms['a0']) != "undefined"){

		var numregistros = parseInt(document.forms['a0'].elements[0].name);

		cadena = cadena + URL;
		
		for (var i = 0; i < numregistros; i++){

			var formulario = "b" + i;
			
			if (document.forms[formulario].elements[0].checked == true){

				var formulario1 = "a" + i;
				
				posicion = parseInt(document.forms[formulario1].elements[0].value)+parseInt(document.forms[formulario1].elements[5].value);

				//alert(document.forms[formulario1].elements[4].value);

				cadena = cadena + "{" + document.forms[formulario1].elements[0].value + "*" + "ACC=APROBADO";

				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Posicion="+posicion;

				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Respuesta=2";//+document.forms[formulario1].elements[1].value;

				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Valor=0";//+document.forms[formulario1].elements[2].value;*/

				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Comentario=Liquidación aprobada";//+document.forms[formulario1].elements[3].value;							

				if(document.forms[formulario1].elements[3].checked == true)
				{
					cadena = cadena + "{" + document.forms[formulario1].elements[0].value + "*" + "Definitiva=1";
				}
				else
				{
					cadena = cadena + "{" + document.forms[formulario1].elements[0].value + "*" + "Definitiva=0";
				}

			}
			
			if (document.forms[formulario].elements[1].checked == true){

				var formulario1 = "a" + i;

				if(document.forms[formulario1].elements[1].value==1){

					if(document.forms[formulario1].elements[2].value==""){

						pos = parseInt(document.forms[formulario1].elements[0].value)+1;

						mensaje = mensaje + "- Posición: "+pos+"\n";

						error= 1;

					}

				}else{

					document.forms[formulario1].elements[2].value="";
					//valida comentario
					if(document.forms[formulario1].elements[4].value =="")
					{
						pos = parseInt(document.forms[formulario1].elements[0].value)+1;
						mensaje = mensaje + "- Posición: "+pos+"\n";
						error= 3;
					}
				}

				posicion = parseInt(document.forms[formulario1].elements[0].value)+parseInt(document.forms[formulario1].elements[5].value);

				//alert(document.forms[formulario1].elements[4].value);

				cadena = cadena + "{" + document.forms[formulario1].elements[0].value + "*" + "ACC=PENDIENTE POR VALIDAR";

				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Posicion="+posicion;

				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Respuesta="+document.forms[formulario1].elements[1].value;
				
				if(document.forms[formulario1].elements[2].value != "")
				{
					if(isNumeric(document.forms[formulario1].elements[2].value)!=true)
					{
						alert('Ha ingresado un valor no numerico en la casilla valor. Por favor corregir');
						error =  2;
					}
				}
				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Valor="+document.forms[formulario1].elements[2].value;

				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Comentario="+document.forms[formulario1].elements[4].value;	

				if(document.forms[formulario1].elements[3].checked == true)
				{
					cadena = cadena + "{" + document.forms[formulario1].elements[0].value + "*" + "Definitiva=1";
				}
				else
				{
					cadena = cadena + "{" + document.forms[formulario1].elements[0].value + "*" + "Definitiva=0";
				}		

			}
			
			

		}
		
		

		document.forms["envio"].elements["param"].value=cadena;

		document.forms["envio"].elements["TAG"].value="SSE_PERSONA_CONFLICTO";
		
		if(error ==0)
		{
			if(validaDefinitiva()==false)
			{
				error = 4;
			}
		}
		
		if(error==0)
		{	
			document.forms["envio"].submit();
		}
		if(error == 1){
				alert("Algunas aprobaciones tienen descuento por nomina y no tienen valor.\n\nError encontrado en las siguientes posiciones:\n"+mensaje+"\nPor favor verifique!");
		}
		if(error == 3){
				alert("Existen registros sin comentario, que no aplican descuento y estan pendientes por validar.\n\nError encontrado en las siguientes posiciones:\n"+mensaje+"\nPor favor verifique!");
		}
	}

}

function filtrar2()
{
	document.forms["busqueda"].action="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p1_paz_salvo_resultados.jsp";
	document.forms["busqueda"].target="_blank";
	document.forms["busqueda"].submit();
	
}

function validaDefinitiva()
{
	
	if (typeof(document.forms['a0']) != "undefined"){

		var numregistros = parseInt(document.forms['a0'].elements[0].name);
		var error = 0;
		var mensaje = "";
		for (var i = 0; i < numregistros; i++)
		{
			var formulario1 = "a" + i;
			var formulario = "b" + i;
			var respuesta = 0;
			if(document.forms[formulario1].elements[3].checked == true)
			{
				//Es definitiva Busca que este aprobada
				if (document.forms[formulario].elements[0].checked == true)
				{
					respuesta = 1;
				}
				//Es definitiva Busca que este pendiente
				if (document.forms[formulario].elements[1].checked == true)
				{
					respuesta = 1;
				}
				if(respuesta == 0)
				{
					pos = parseInt(document.forms[formulario1].elements[0].value)+1;
					mensaje = mensaje + "- Posición: "+pos+"\n";
					error= 1;
				}
				
			}
		
		}
		
		if(error == 1)
		{
				alert("Algunas respuestas estan marcadas como definitivas, pero no tienen respuesta.\n\nError encontrado en las siguientes posiciones:\n"+mensaje+"\nPor favor verifique!");
				return false;
		}
		return true;
	}	
	return true;
}



function bloquear_valor(val,pos){

	//alert(val.value);

	campo = "'a"+pos+"'";

	if(val.value==2){

		document.forms[eval(campo)].elements[2].value = "";

		document.forms[eval(campo)].elements[2].disabled = true;

	}else{

		document.forms[eval(campo)].elements[2].disabled = false;

	}

}

function validar_check(checkboxclick,checkboxnoclick,val,pos){
	
	campo = "'a"+pos+"'";
	if (checkboxclick.checked ==true){

		if(val == 0){

			document.forms[eval(campo)].elements[2].disabled = false;

			document.forms[eval(campo)].elements[1].disabled = false;

			document.forms[eval(campo)].elements[4].disabled = false;

			//document.forms[eval(campo)].elements[2].value = "";

			document.forms[eval(campo)].elements[1].options[0].selected=true;

		}else{

			document.forms[eval(campo)].elements[2].value = "";

			document.forms[eval(campo)].elements[4].value = "";

			document.forms[eval(campo)].elements[1].options[0].selected=true;

			document.forms[eval(campo)].elements[2].disabled = true;

			document.forms[eval(campo)].elements[1].disabled = true;

			document.forms[eval(campo)].elements[4].disabled = true;

		}

		if (checkboxnoclick.checked==true){ 

			checkboxnoclick.checked = false;

		}

	}
	
	if(checkboxnoclick.checked==false && checkboxclick.checked==false){
		document.forms[eval(campo)].elements[3].checked = false;
	}

	//validar(checkboxclick,checkboxnoclick);

}

function OnScrollDiv(Scrollablediv) 
{
    document.getElementById('DivHeaderRow').scrollLeft = Scrollablediv.scrollLeft;
    document.getElementById('DivFooterRow').scrollLeft = Scrollablediv.scrollLeft;
}

function AprobarAll(obj) 
{
	if (typeof(document.forms['a0']) != "undefined"){

		var numregistros = parseInt(document.forms['a0'].elements[0].name);
		

		for (var i = 0; i < numregistros; i++){

			var formulario = "b" + i;
			
			document.forms[formulario].elements[0].checked = true;
			document.forms[formulario].elements[1].checked = false;
			
			campo = "'a"+i+"'";
			document.forms[eval(campo)].elements[2].value = "";
			document.forms[eval(campo)].elements[4].value = "";
			document.forms[eval(campo)].elements[1].options[0].selected=true;
			document.forms[eval(campo)].elements[2].disabled = true;
			document.forms[eval(campo)].elements[1].disabled = true;
			document.forms[eval(campo)].elements[4].disabled = true;
			
			
		}
	}	   
}

function PendienteAll(obj) 
{
	if (typeof(document.forms['a0']) != "undefined"){

		var numregistros = parseInt(document.forms['a0'].elements[0].name);
		

		for (var i = 0; i < numregistros; i++){

			var formulario = "b" + i;
			
			document.forms[formulario].elements[0].checked = false;
			document.forms[formulario].elements[1].checked = true;
			
			campo = "'a"+i+"'";
			document.forms[eval(campo)].elements[2].disabled = false;
			document.forms[eval(campo)].elements[1].disabled = false;
			document.forms[eval(campo)].elements[4].disabled = false;
			document.forms[eval(campo)].elements[1].options[0].selected=true;
		}
	}	   
}

function RespuestaAll(obj) 
{
	if (typeof(document.forms['a0']) != "undefined"){

		var numregistros = parseInt(document.forms['a0'].elements[0].name);
		

		for (var i = 0; i < numregistros; i++){

			var formulario = "a" + i;
			var formulario1 = "b" + i;
			
			if(document.forms[formulario1].elements[0].checked == true || document.forms[formulario1].elements[1].checked == true)
			{
				document.forms[formulario].elements[3].checked = true;			
			}	
		}
	}	   
}

function numero(n,s)

{

	var siz=0;

	switch(s)

	{

		case 0: siz=10; break;

		case 1: siz=11; break;

		case 2: siz=12; break;

		case 3: siz=13; break;

		case 4: siz=14; break;

		case 5: siz=15; break;

		case 6: siz=16; break;

		case 7: siz=17; break;

		case 8: siz=18; break;

		case 9: siz=19; break;

	}

	var div = document.getElementById("num");

	div.innerHTML = "<center><font style='font-size:8px'>"+n+"</font></center>";

	if(s==9)

	{

		n--;

		s=-1;

		setTimeout("numero("+n+","+s+");",700);

	}

	else

	{

		s++;

		setTimeout("numero("+n+","+s+");",30);

	}

}

</script>

</head>

<body>

<%@ include file="../../sse_generico/espanol/generico_menusup.jsp" %>

<%@ include file="../../sse_generico/espanol/generico_links.jsp" %>

<%
 
   String zsubsesion = "SSE_PERSONA_CONFLICTO";

   String zmeta4object = "SSE_PERSONA_CONFLICTO";

   String znodo = "SSE_PERSONA_CONFLICTO";

   String znodon = "SSE_PERSONA_CONFLICTO_NEW";

   String znodoconf = "CCB_CONFLICTOS_VAL2";
   
   String znodoarea = "CCB_AREA_CONF_VAL2";
   
   String znodowunit = "CCB_WUNIT_LIST2";

   String ztipocarga = "SSE";

   String zventanas = "15";

   int zvuelta = 2;

   String zdireccion = "/sse_g1/sse_g1_p1_paz_salvo_val.jsp";

   String zestado="11";

   int zregistroinicial = Integer.valueOf(zinicios).intValue();

   zregistroinicial = zregistroinicial - 1;

   int zventana  = Integer.valueOf(zventanas).intValue();

   int zregistrofinal = zregistroinicial + zventana - 1;

   

   String zoutputdef = zsubsesion + "!" + znodo + "[" + zregistroinicial + "-" + zregistrofinal + "]";

   String zmove =znodo + ":" +  znodo + "[" + zregistroinicial + "]";

   String zraiz = znodo + ":" + zsubsesion + "!" + znodo + ".";

   String zcomun = znodo + ":" + zsubsesion + "!" + znodo + "[&VAR.m4lix]" + ".";

   

   String zoutputdefn = zsubsesion + "!" + znodon + "[" + zregistroinicial + "-" + zregistrofinal + "]";

   String zmoven =znodon + ":" +  znodon + "[" + zregistroinicial + "]";

   String zraizn= znodon + ":" + zsubsesion + "!" + znodon + ".";

   String zcomunn = znodon + ":" + zsubsesion + "!" + znodon + "[&VAR.m4lix]" + ".";

   



   String znodolista = znodo + "_VAL2";

   String zoutputdeflista = zsubsesion + "!" + znodolista + "[*]";

   String zmovelista = znodolista + ":" + znodolista + "[FIRST]";

   String zcomunlista = znodolista + ":" + zsubsesion + "!" + znodolista + "[&VAR.m4lix]" + ".";

   

   String zoutputdefconf = zsubsesion + "!" + znodoconf + "[*]";

   String zmoveconf = znodoconf + ":" + znodoconf + "[FIRST]";

   String zcomunconf = znodoconf + ":" + zsubsesion + "!" + znodoconf + "[&VAR.m4lix]" + ".";
   
   
   String zoutputdefarea = zsubsesion + "!" + znodoarea + "[*]";

   String zmovearea = znodoarea + ":" + znodoarea + "[FIRST]";

   String zcomunarea = znodoarea + ":" + zsubsesion + "!" + znodoarea + "[&VAR.m4lix]" + ".";
   
   
   String zoutputdefwunit = zsubsesion + "!" + znodowunit + "[*]";

   String zmovewunit = znodowunit + ":" + znodowunit + "[FIRST]";

   String zcomunwunit = znodowunit + ":" + zsubsesion + "!" + znodowunit + "[&VAR.m4lix]" + ".";

 /*     

   String znodocom = "SSE_COMUNICACION";

   String zoutputdefcom = zsubsesion + "!" + znodocom + "[*]";

   



   //String znodoprincipal = "SSE_PRINCIPAL";*/

   String zmetodocarga = "CARGA:" + zsubsesion + "!" + znodo + ".SSE_CARGA";

    String zmetodopersist 	= "GRABAR:" + zsubsesion + "!" + znodo + ".SSE_GRABAR";	

     

  

   String zNOMBREEMPLEADO 	= zcomunn + "SCO_GB_NAME";

   String zID_HR 			= zcomunn + "STD_ID_HR";

   String zNOMBRE_CONFLICTO = zcomunn + "NOMBRE_CONFLICTO";

   String zID_CONFLICTO 	= zcomunn + "ID_CONFLICTO";

   String zNUM_RESPUESTAS 	= zcomunn + "NUM_RESPUESTAS";

   String zWUNITG 			= zcomunn + "WUNIT"; 

   String zAREA_CONFLICTO 	= zcomunn + "AREA_CONFLICTO";

   String zFECHA_BAJA		= zcomunn + "FECHA_BAJA";

   String zFECHA_FIN_PORTAL	= zcomunn + "FECHA_FIN_PORTAL";
   
   String zPFECHA_FIN_PORTAL	= zcomunn + "P_FECHA_FIN_PORTAL";

   String zTIEMPO_RESTANTE	= zcomunn + "TIEMPO_RESTANTE";
   
   String zMOTIVO_BAJA	= zcomunn + "MOTIVO_BAJA";
   
    String zMODO_BAJA	= zcomunn + "MODO_BAJA";

   

   String zNOMBREEMPLEADOlista = zcomunlista+ "SCO_GB_NAME";

   String zSTDIDPERSON = zcomunlista+"STD_ID_HR"; 

   String zSTDDTEND = "";
   
   String zSTDDTLIMIT = "";

   String zNOMBRECONFLICTO = zcomunconf+ "NOMBRE_CONFLICTO";

   String zIDCONFLICTO = zcomunconf+"ID_CONFLICTO"; 
   
   String zIDAREACONFLISTA = zcomunarea+ "ID_AREA_CONFLICTO";

   String zNOMAREACONFLISTA = zcomunarea+"NOMBRE_AREA"; 
   
   String zIDWUNITLISTA = zcomunwunit+ "STD_ID_WORK_UNIT";

   String zNOMWUNITLISTA = zcomunwunit+"STD_N_WORK_UNIT";

  

%>

<m4:startpage m4task="<%=zsubsesion%>"/><m4:beginjob/>

<m4:datadef m4o="<%=zmeta4object%>" m4name="<%=zsubsesion%>"/>

<m4:exec m4method="<%=zmetodopersist%>"><m4:param name="GESTION_ARG" value="<%=zparametro%>"/></m4:exec>

<m4:exec m4method="<%=zmetodocarga%>"><m4:param name="ID_PERSON" value="<%=zfiltro%>"/><m4:param name="CONFLICTO" value="<%=zconflicto%>"/><m4:param name="FECHA_BAJA" value="<%=zfecbaja%>"/><m4:param name="FECHA_LIMITE" value="<%=zfeclimite%>"/><m4:param name="AREA" value="<%=zarea%>"/><m4:param name="UNIDAD_ORG" value="<%=zwunit%>"/></m4:exec>

<m4:outputdef m4alias="<%=znodo%>" ><m4:param name="m4name0" value="<%=zoutputdef%>"/></m4:outputdef>

<m4:outputdef m4alias="<%=znodolista%>"><m4:param name="m4name0" value="<%=zoutputdeflista%>"/></m4:outputdef>

<m4:outputdef m4alias="<%=znodoconf%>"><m4:param name="m4name0" value="<%=zoutputdefconf%>"/></m4:outputdef>

<m4:outputdef m4alias="<%=znodoarea%>"><m4:param name="m4name0" value="<%=zoutputdefarea%>"/></m4:outputdef>

<m4:outputdef m4alias="<%=znodowunit%>"><m4:param name="m4name0" value="<%=zoutputdefwunit%>"/></m4:outputdef>

<m4:outputdef m4alias="<%=znodon%>"><m4:param name="m4name0" value="<%=zoutputdefn%>"/></m4:outputdef>

<m4:endjob/>

<m4:move><m4:param name="<%=zsubsesion%>" value="<%=zmove%>"/></m4:move>

<m4:move><m4:param name="<%=zsubsesion%>" value="<%=zmoven%>"/></m4:move>

<m4:move><m4:param name="<%=zsubsesion%>" value="<%=zmovelista%>"/></m4:move>

<m4:move><m4:param name="<%=zsubsesion%>" value="<%=zmoveconf%>"/></m4:move>

<m4:move><m4:param name="<%=zsubsesion%>" value="<%=zmovearea%>"/></m4:move>

<m4:move><m4:param name="<%=zsubsesion%>" value="<%=zmovewunit%>"/></m4:move>

<%

	int  zcounti  = 0;

	int  zcountilista  = 0;

	int  zcounticonf  = 0;
	
	int  zcountiarea  = 0;
	
	int  zcountiwunit  = 0;

	int  zcount  = 0;	

	try {

		M4Operations m = new M4Operations(request);

		zcounti = m.getCountInClient(znodon,zsubsesion,znodon);

		zcountilista = m.getCountInClient(znodolista,zsubsesion,znodolista);

		zcounticonf = m.getCountInClient(znodoconf,zsubsesion,znodoconf);
		
		zcountiarea = m.getCountInClient(znodoarea,zsubsesion,znodoarea);
		
		zcountiwunit = m.getCountInClient(znodowunit,zsubsesion,znodowunit);

		zcount = m.getCount(znodon,zsubsesion,znodon);

	} catch(Exception e) {}

	String	zcountv = String.valueOf(zcounti);

	String	zcountvlista = String.valueOf(zcountilista);

	String	zcountvconf = String.valueOf(zcounticonf);
	
	String	zcountvarea = String.valueOf(zcountiarea);
	
	String	zcountvwunit = String.valueOf(zcountiwunit);

	//out.print("couunt:"+zcountvconf);

%>

<table width="100%" cellspacing="0">

<tr><td class="titulofuncional" colspan="2">Valida Paz y Salvo</td></tr>

<tr>

	<td>&nbsp;</td>

	<td><div class="descripcionfuncional">

	  <p>&nbsp;</p>

	  <p>Valida proceso de Paz y salvo. Recuerda enviar la aceptaci&oacute;n o cancelaci&oacute;n de solicitudes por cada una de las p&aacute;ginas.</p>

	  <p>&nbsp;</p>

	</div></td>

</tr>

</table>

<table width="100%" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">

  <tr>

    <td><table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#666666" bgcolor="#FFFFFF">

      <tr>

        <td colspan="4" class="titulofuncional">&nbsp;FILTROS:<div id="num"></div></td>

      </tr>
      <form name="prueba" id="prueba" action="">
	  
      <tr class="descripcionfuncional">

          <td valign="middle" >
            &nbsp;Por colaborador:
		  </td>
		  <td valign="middle" align="left">		
			<select name="filtro" class="fuenteformulario200" id="filtro"title="Escoge un colaborador" onchange="filtrar()">

                  <% if(zfiltro.compareTo("Todos")!=0){%>

                  <option value="<%=zfiltro%>"><%=znomempleado%></option>
				  

                  <% }	%>

                  <option value="Todos">Todos</option>

                  <m4:loop from="0" to="<%=new Integer(new Integer(zcountvlista).intValue()-1).toString()%>">

                    <option value="<m4:item m4name="<%=zSTDIDPERSON%>" htmlsafe="true"/>"><m4:item m4name="<%=zNOMBREEMPLEADOlista%>" htmlsafe="true"/></option>

                  </m4:loop>

                </select>
			</td>
			<td>
				Por conflicto:
			</td>	
			<td align="left">
				<select name="conflicto" class="fuenteformulario200" id="conflicto"title="Escoge un conflicto" onchange="filtrar()">

                <% if(zconflicto.compareTo("Todos")!=0){%>

                  <option value="<%=zconflicto%>"><%=znomconflicto%> </option>

                  <% }	%>

                  <option value="Todos">Todos</option>

                  <m4:loop from="0" to="<%=new Integer(new Integer(zcountvconf).intValue()-1).toString()%>">

                    <option value="<m4:item m4name="<%=zIDCONFLICTO%>" htmlsafe="true"/>">

                    <m4:item m4name="<%=zNOMBRECONFLICTO%>" htmlsafe="true"/>

                  </m4:loop>

                </select>
            </td>
	</tr>
	
	<tr class="descripcionfuncional">

            <td valign="middle" >
				&nbsp;Por fecha de baja:
			</td>
			<td align="left">
				<input class="fuenteformulario" type="text" name="fecbaja" id="fecbaja" onchange="filtrar()" title="Fecha de baja" maxlength="10" size="10" value="<%=com.meta4.taglib.util.M4PresentationUtilTaglib.cookHTML(zfecbaja)%>" />&nbsp;
				<a href="javascript:m4calendario(m4objeto('fecbaja','prueba'))" title="Selecciona fecha de baja"><img src="/iconos/icono_calendario_14_18.gif" width="14" height="18" alt="Selecciona fecha de baja" /></a>
			</td>
			<td>		
				Por fecha limite:
			</td>	
			<td align="left">
                <input class="fuenteformulario" type="text" name="feclimite" id="feclimite" onchange="filtrar()" title="Fecha Limite" maxlength="10" size="10" value="<%=com.meta4.taglib.util.M4PresentationUtilTaglib.cookHTML(zfeclimite)%>" />&nbsp;
				<a href="javascript:m4calendario(m4objeto('feclimite','prueba'))" title="Selecciona fecha limite"><img src="/iconos/icono_calendario_14_18.gif" width="14" height="18" alt="Selecciona fecha limite" /></a>
            </td>
	</tr>
	
	<tr class="descripcionfuncional">

            <td valign="middle">
				&nbsp;Por área:
			</td>
			<td align="left">
				<select name="area" class="fuenteformulario200" id="area"title="Escoge un area" onchange="filtrar()">

                  <% if(zarea.compareTo("Todos")!=0){%>

                  <option value="<%=zarea%>"><%=znomarea%></option>

                  <% }	%>

                  <option value="Todos">Todos</option>

                  <m4:loop from="0" to="<%=new Integer(new Integer(zcountvarea).intValue()-1).toString()%>">

                    <option value="<m4:item m4name="<%=zIDAREACONFLISTA%>" htmlsafe="true"/>">

                    <m4:item m4name="<%=zNOMAREACONFLISTA%>" htmlsafe="true"/>

                  </m4:loop>

                </select>
			</td>
			<td>		
				Por unidad organizativa:
			</td>	
			<td align="left">
                <select name="wunit" class="fuenteformulario200" id="wunit"title="Escoge unidad organizativa" onchange="filtrar()">

                  <% if(zwunit.compareTo("Todos")!=0){%>

                  <option value="<%=zwunit%>"><%=znomwunit%></option>

                  <% }	%>

                  <option value="Todos">Todos</option>

                  <m4:loop from="0" to="<%=new Integer(new Integer(zcountvwunit).intValue()-1).toString()%>">

                    <option value="<m4:item m4name="<%=zIDWUNITLISTA%>" htmlsafe="true"/>">

                    <m4:item m4name="<%=zNOMWUNITLISTA%>" htmlsafe="true"/>

                  </m4:loop>

                </select>
            </td>
	</tr>
	 </form>	
     <tr>
		<td colspan="4" valign="middle" class="descripcionfuncional"><div align="center"><a href="javascript:filtrar();" title="Filtrar">
		<img alt="Filtrar" src="/iconos/icono_filtrar_36_36.gif" style="cursor:hand" onmouseover="m4luztotal (this,245,245,245,50,40,40,100,100,100)" onmouseout="m4oscuridad(this)" /></a>
        </div>
		</td>
      </tr>

    </table></td>

  </tr>

</table>

<p>&nbsp;</p>

<p align="center">
	<form action="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p1_paz_salvo_val.jsp?estado=11" method="post" name="oculto" id="oculto">
		<input type="hidden" id="zfiltro" name="zfiltro" value="<%=zfiltro%>" />
		<input type="hidden" id="zconflicto" name="zconflicto" value="<%=zconflicto%>" />
		<input type="hidden" id="zarea" name="zarea" value="<%=zarea%>" />
		<input type="hidden" id="zwunit" name="zwunit" value="<%=zwunit%>" />
		<input type="hidden" id="zfecbaja" name="zfecbaja" value="<%=zfecbaja%>" />
		<input type="hidden" id="zfeclimite" name="zfeclimite" value="<%=zfeclimite%>" />
		<input type="hidden" id="zinicios" name="zinicios" value="" />
		<input type="hidden" id="znomempleado" name="znomempleado" value="<%=znomempleado%>" />
		<input type="hidden" id="znomconflicto" name="znomconflicto" value="<%=znomconflicto%>" />
		<input type="hidden" id="znomarea" name="znomarea" value="<%=znomarea%>" />
		<input type="hidden" id="znomwunit" name="znomwunit" value="<%=znomwunit%>" />
		<input type="hidden" id="zfiltroemp" name="znivel" value="<%=znivel%>" />		
	</form>

  <% if (zcount > 0) {

	String zregistroinicials = String.valueOf(zregistroinicial);

	String zregistrofinals = String.valueOf(zregistroinicial + zcounti - 1);

 %>
	<form action="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p1_paz_salvo_resultados.jsp" method="post" name="busqueda" id="busqueda">
		<input type="hidden" id="zfiltro" name="zfiltro" value="<%=zfiltro%>" />
		<input type="hidden" id="zconflicto" name="zconflicto" value="<%=zconflicto%>" />
		<input type="hidden" id="zarea" name="zarea" value="<%=zarea%>" />
		<input type="hidden" id="zwunit" name="zwunit" value="<%=zwunit%>" />
		<input type="hidden" id="zfecbaja" name="zfecbaja" value="<%=zfecbaja%>" />
		<input type="hidden" id="zfeclimite" name="zfeclimite" value="<%=zfeclimite%>" />
		<input type="hidden" id="zinicios" name="zinicios" value="" />
		<input type="hidden" id="znomempleado" name="znomempleado" value="<%=znomempleado%>" />
		<input type="hidden" id="znomconflicto" name="znomconflicto" value="<%=znomconflicto%>" />
		<input type="hidden" id="znomarea" name="znomarea" value="<%=znomarea%>" />
		<input type="hidden" id="znomwunit" name="znomwunit" value="<%=znomwunit%>" />
		<input type="hidden" id="zfiltroemp" name="znivel" value="<%=znivel%>" />
		<a href='javascript:filtrar2();' >Ver Resultados (<%= zcount %>)</a>
	</form>
	
	

</p>


<%}else{%>	

<div class="fuentenodatos">Actualmente no tienes ning&uacute;n dato que validar en este nivel.</div>

<br/> <br/>

 <%}%>

<m4:endpage/>


</div>

</body>

</html>


