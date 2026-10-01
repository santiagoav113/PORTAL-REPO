<%@ taglib uri="M4Tags" prefix="m4"%>
<%@ page import="java.io.*, java.util.*, java.net.*" %>

<!DOCTYPE html 

     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"

    "DTD/xhtml1-transitional.dtd">

<html>

<head><%@ page  import="com.meta4.session.*, com.meta4.m4operations.*,com.meta4.utilities.*" %>

<title>Valida Paz y Salvo - Búsqueda</title>

<link href="/css/estilo_sse.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="/libreria/funciones_sse_val1.js"></script>

<script type="text/javascript" language="Javascript1.2"src="/libreria/funciones_sse.js"></script>

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



// Nivel Post/Get



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

	mensaje1 = "";
	mensaje2 = "";
	mensaje3 = "";
	msjError = "";

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
						//alert("pos1: "+pos);
						mensaje1 = mensaje1 + "- Posición: "+pos+"\n";

						error= 1;

					}

				}else{

					document.forms[formulario1].elements[2].value="";
					//valida comentario
					if(document.forms[formulario1].elements[4].value =="")
					{
						pos = parseInt(document.forms[formulario1].elements[0].value)+1;
						mensaje3 = mensaje3 + "- Posición: "+pos+"\n";
						//alert("pos2: "+pos);
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
		/*if(error == 1){
				alert("Algunas aprobaciones tienen descuento por nomina y no tienen valor.\n\nError encontrado en las siguientes posiciones:\n"+mensaje1+"\nPor favor verifique!");
		}
		if(error == 3){
				alert("Existen registros sin comentario, que no aplican descuento y estan pendientes por validar.\n\nError encontrado en las siguientes posiciones:\n"+mensaje3+"\nPor favor verifique!");
		}*/
		if(error == 1 || error ==3){
				if(mensaje1 !="")
				{
					msjError = "Algunas aprobaciones tienen descuento por nomina y no tienen valor.\n\nError encontrado en las siguientes posiciones:\n"+mensaje1;
					msjError = msjError  + "\n";
				}
				if(mensaje3 !="")
				{
					msjError = msjError  + "Existen registros sin comentario, que no aplican descuento y estan pendientes por validar.\n\nError encontrado en las siguientes posiciones:\n"+mensaje3;
					msjError = msjError  + "\nPor favor verifique!";
				}	
				alert(msjError);
		}
		
	}

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

<%

   String zsubsesion = "SSE_PERSONA_CONFLICTO";

   String zmeta4object = "SSE_PERSONA_CONFLICTO";

   String znodo = "SSE_PERSONA_CONFLICTO";

   String znodon = "SSE_PERSONA_CONFLICTO_NEW";

   String znodoconf = "CCB_CONFLICTOS_VAL";
   
   String znodoarea = "CCB_AREA_CONF_VAL";
   
   String znodowunit = "CCB_WUNIT_LIST";

   String ztipocarga = "SSE";

   String zventanas = "1000";

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

   



   String znodolista = znodo + "_VAL";

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

<table width="90%" align="center" cellspacing="0">

<tr>

  <td class="titulofuncional" colspan="2">Resultados de Búsqueda</td>

</tr>

<tr>

	<td><img alt="Valida direcciones"title="Valida direcciones" src="/iconos/noname_valida_domicilio_122_100.gif" width="122" height="100" /></td>

	<td><div class="descripcionfuncional">Aqui puede ver el resultado de la búsqueda</div></td>

</tr>

</table>





<p>

  <% if (zcount > 0) {

	String zregistroinicials = String.valueOf(zregistroinicial);

	String zregistrofinals = String.valueOf(zregistroinicial + zcounti - 1);

 %>

</p>
<!--<center><input name="Cerrar" type="button" id="Cerrar" value="Cerrar" onclick="window.close()"/></center>-->
<table width = 1800 cellspacing="0">

<tr><td class="tablaestadosceldatitulo" colspan="2">&nbsp;Acciones</td></tr>
<tr  class="fuentevalor">
	<td >
		<a href="Javascript:AprobarAll(this);" >-Aprobar todos-</a>&nbsp;&nbsp;&nbsp;
		<a href="Javascript:PendienteAll(this);" >-Pendientes todos-</a>&nbsp;&nbsp;&nbsp;
		<a href="Javascript:RespuestaAll(this);" >-Respuesta definitiva todos-</a>
	</td>
</tr>
</table>

<div id="DivRoot" align="left">
	<div style="overflow: hidden;" id="DivHeaderRow">
	</div>

	<!--<div style="overflow:scroll;" onscroll="OnScrollDiv(this)" id="DivMainContent">-->
	<div id="DivMainContent">
		<!--Place Your Table Heare-->
		<table width = 1800 >	
			<tr>
				<td class="tablaestadosceldatitulo" align="center">#Reg</td>
				<td class="tablaestadosceldatitulo" align="center">ID Empleado </td>
				<td class="tablaestadosceldatitulo" align="center">Nombre </td>
				<td class="tablaestadosceldatitulo" align="center">Unidad organizativa </td>
				<td class="tablaestadosceldatitulo" align="center">Conflicto </td>
				<td class="tablaestadosceldatitulo" align="center">Fecha baja </td>
				<td class="tablaestadosceldatitulo" align="center">Fecha limite </td>			
				<td class="tablaestadosceldatitulo" align="center">Aprobar <br> liquidaci&oacute;n </td>
				<td class="tablaestadosceldatitulo" align="center">Pendiente <br> por validar </td>
				<td class="tablaestadosceldatitulo" align="center">Descuento <br> de n&oacute;mina </td>
				<td class="tablaestadosceldatitulo" align="center">Valor </td>
				<td class="tablaestadosceldatitulo" align="center">Respuesta <br> definitiva </td>
				<td class="tablaestadosceldatitulo" align="center">Comentarios </td>
				<td class="tablaestadosceldatitulo" align="center">Hist&oacute;rico <br>de respuesta </td>
				<td class="tablaestadosceldatitulo" align="center">Motivo baja </td>
				<td class="tablaestadosceldatitulo" align="center">Modo baja </td>
			</tr>
			<%
			int zposicion = 0;
			int cont = 0;
			String zposicions = "0";
			
			%>
			<m4:loop from="<%=zregistroinicials%>" to="<%=zregistrofinals%>">
			<%  zposicions = m4lix;
				zposicion = Integer.valueOf(zposicions).intValue();
				zposicion = zposicion - zregistroinicial;
				cont = cont + 1;
			%>
			<tr class="fuentevalor">
				<td style="width: 20px;" align="center"><%=cont%></td>
				<td style="width: 80px;"><m4:item m4name="<%=zID_HR%>" htmlsafe="true"/></td>
				<td style="width: 200px;"><m4:item m4name="<%=zNOMBREEMPLEADO%>" htmlsafe="true"/></td>
				<td style="width: 250px;"><m4:item m4name="<%=zWUNITG%>" htmlsafe="true"/></td>
				<td style="width: 150px;"><m4:item m4name="<%=zNOMBRE_CONFLICTO%>" htmlsafe="true"/></td>
				<td style="width: 65px;" align="center"><m4:item m4name="<%=zFECHA_BAJA%>" htmlsafe="true"/></td>				
				<td style="width: 65px;" align="center"><m4:item m4name="<%=zPFECHA_FIN_PORTAL%>" htmlsafe="true"/></td>
				<form name="b<%=zposicion%>" id="b<%=zposicion%>" action=" ">
					<td align="center" style="width: 65px;"><input style="width: 65px;"title="Acepta la petic&oacute;n" id="ac<%=zposicion%>" name="ac<%=zposicion%>" type="checkbox" value="T" onclick="validar_check(this,document.b<%=zposicion%>.ca<%=zposicion%>,1,<%=zposicion%>)"/></td>
					<td align="center" style="width: 75px;"><input style="width: 65px;" title="Pendiente por validar" id="ca<%=zposicion%>" name="ca<%=zposicion%>" type="checkbox" value="T" onclick="validar_check(this,document.b<%=zposicion%>.ac<%=zposicion%>,0,<%=zposicion%>)" /></td>				
				</form>
				<form name="a<%=zposicion%>" id="a<%=zposicion%>" action=" ">
					<input id="ocul<%=zposicion%>" name="<%=zcountv%>" type="hidden" value="<%=zposicion%>" />
					<td align="center" style="width: 65px;">
						<select name="respuesta<%=zposicion%>" id="respuesta<%=zposicion%>" onchange="bloquear_valor(this,<%=zposicion%>)">

							<option value="1">Si</option>
							<option value="2">No </option>
						</select>
					</td>
					<td align="right" style="width: 100px;">
						<input type="text" name="valor<%=zposicion%>" id="valor<%=zposicion%>" onchange="validaNumero(this)" style="width: 100px;"/>		
					</td>	
					<td align="center" style="width: 65px;"><input  title="Respuesta Definitiva" id="rd<%=zposicion%>" name="rd<%=zposicion%>" type="checkbox" value="T" /></td>
					<td align="center" style="width: 100px;">
						<input name="comentario<%=zposicion%>" type="text" id="comentario<%=zposicion%>"  />
					</td>
					<td align="right" style="width: 85px;">
						<a href='sse_g1_p1_paz_salvo_h_respuestas.jsp?id_person=<m4:item m4name="<%=zID_HR%>" htmlsafe="true"/>&id_periodo=1&conflicto=<m4:item m4name="<%=zID_CONFLICTO%>" htmlsafe="true"/>&nombre_emp=<m4:item m4name="<%=zNOMBREEMPLEADO%>" htmlsafe="true"/>&nombre_conf=<m4:item m4name="<%=zNOMBRE_CONFLICTO%>" htmlsafe="true"/>' target="_blank"><m4:item m4name="<%=zNUM_RESPUESTAS%>" htmlsafe="true"/></a>            
					</td>
					<input id="ini<%=zposicion%>" name="ini<%=zposicion%>" type="hidden" value="<%=zregistroinicials%>" /> 
					<input id="ocultos<%=zposicion%>" name="ocultos<%=zposicion%>" type="hidden" value="" />
					<input id="ocul<%=zposicion%>" name="<%=zcountv%>" type="hidden" value="" />
				</form>
				<td><m4:item m4name="<%=zMOTIVO_BAJA%>" htmlsafe="true"/></td>
				<td><m4:item m4name="<%=zMODO_BAJA%>" htmlsafe="true"/></td>
			</tr>
			</m4:loop>	
			<tr>
				<td >
					<form id="envio" name="envio" action="/servlet/CheckSecurity/JSP/sse_g1/sse_g1_p1_paz_salvo_resultados.jsp" method="post">
						<input type="hidden" id="param" name="param" value="" />
						<input type="hidden" id="TAG" name="TAG" value="" />
					</form>	
				</td>
			</tr>
					
		</table>
	</div>
	<br>
	<center>
		<a href="javascript:m4enviar();" title="Enviar"><img src="/iconos/icono_enviar_mss_36_36.gif" alt="Enviar" onmouseover="m4luztotal (this,245,245,245,50,40,40,100,100,100)" onmouseout="m4oscuridad(this)" /></a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a  title="Enviar"><img src="/iconos/btn_cerrar.gif" alt="Cerrar" onclick="window.close()" /></a>
	</center>	
	<div id="DivFooterRow" style="overflow:hidden">
	</div>
</div>



<%}else{%>	

<div class="fuentenodatos">No hay resultados</div>

<br/> <br/>

 <%}%>

<m4:endpage/>

<%@ include file="../../sse_generico/espanol/generico_disclaimer.jsp" %>

</div>

</body>

</html>


