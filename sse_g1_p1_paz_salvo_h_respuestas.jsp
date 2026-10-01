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
<%@ include file="../../sse_generico/espanol/menu_ess.jsp" %>
<%
Generatablaparametros zobjtabla = new Generatablaparametros(request);
String estado = zobjtabla.m4paramvalor("estado");
String zfiltro =zobjtabla.m4paramvalor("zfiltro");
String zinicios =zobjtabla.m4paramvalor("zinicios");	
String zid_person = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"id_person");
String zconflicto =zobjtabla.m4paramvalor("conflicto");
String zperiodo =zobjtabla.m4paramvalor("id_periodo");
String znombre_conf =zobjtabla.m4paramvalor("nombre_conf");
String znombre_emp =zobjtabla.m4paramvalor("nombre_emp");
if ((estado==null)||(estado.equals(""))){estado="0";}
if ((zfiltro==null)|| (""==zfiltro)){zfiltro = "Todos";} 
if ((zid_person==null)|| (""==zid_person)){zid_person = "";} 
if ((zconflicto==null)||(zconflicto.equals(""))){zconflicto="0";}
if ((zperiodo==null)||(zperiodo.equals(""))){zperiodo="0";}
if ((znombre_conf==null)||(znombre_conf.equals(""))){znombre_conf="";}
if ((znombre_emp==null)||(znombre_emp.equals(""))){znombre_emp="";}

// Nivel Post/Get

String znivel =zobjtabla.m4paramvalor("znivel");
if ((znivel==null)||(znivel.equals(""))){
znivel = com.meta4.taglib.util.M4SafeRequest.getParameter(request,"znivel");
if ((znivel==null)||(znivel.equals(""))){znivel = "1";}
}



if ((zinicios==null)||(zinicios.equals(""))){zinicios = "1";}
%>
<script type="text/javascript">
function filtrar(){
var valor =m4select("filtro","prueba","value");//m4select("filtro","prueba","value");
m4valor("oculto","zfiltro",valor,"set");
valor =m4select("conflicto","prueba","value");//m4select("filtro","prueba","value");
m4valor("oculto","zconflicto",valor,"set");
document.forms["oculto"].submit();
}
function m4enviar(){
	var cadena="";
	var URL = "{TAG=SSE_PERSONA_CONFLICTO";
	if (typeof(document.forms['a0']) != "undefined"){
		var numregistros = parseInt(document.forms['a0'].elements[0].name);
		cadena = cadena + URL;
		for (var i = 0; i < numregistros; i++){
			var formulario = "b" + i;
			if (document.forms[formulario].elements[0].checked == true){
				var formulario1 = "a" + i;
				cadena = cadena + "{" + document.forms[formulario1].elements[0].value + "*" + "ACC=ACEPTAR";
				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Posicion="+document.forms[formulario1].elements[0].value;
				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Respuesta="+document.forms[formulario1].elements[1].value;
				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Valor="+document.forms[formulario1].elements[2].value;
				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Comentario="+document.forms[formulario1].elements[3].value;
			}
			if (document.forms[formulario].elements[1].checked == true){
				var formulario1 = "a" + i;
				cadena = cadena + "{" + document.forms[formulario1].elements[0].value + "*" + "ACC=CANCELAR";
				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Posicion="+document.forms[formulario1].elements[0].value;
				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Respuesta="+document.forms[formulario1].elements[1].value;
				cadena = cadena + "{"+document.forms[formulario1].elements[0].value+"*"+"Comentario="+document.forms[formulario1].elements[3].value;
			}
		}
		document.forms["envio"].elements["param"].value=cadena;
		document.forms["envio"].elements["TAG"].value="SSE_PERSONA_CONFLICTO";
		document.forms["envio"].submit();
	}
}

function validar_check(checkboxclick,checkboxnoclick,val,pos){
	if (checkboxclick.checked ==true){
		campo = "'a"+pos+"'";
		if(val == 0){
			document.forms[eval(campo)].elements[2].value = "";
			document.forms[eval(campo)].elements[2].disabled = true;
		}else{
			document.forms[eval(campo)].elements[2].disabled = false;
		}
		if (checkboxnoclick.checked==true){ 
			checkboxnoclick.checked = false;
		}
	}
	//validar(checkboxclick,checkboxnoclick);
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
   String znodoconf = "SSE_RESPUESTA_CONFLICTO";
   String ztipocarga = "SSE";
   String zventanas = "4";
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
   

   String znodolista = znodo + "_VAL";
   String zoutputdeflista = zsubsesion + "!" + znodolista + "[*]";
   String zmovelista = znodolista + ":" + znodolista + "[FIRST]";
   String zcomunlista = znodolista + ":" + zsubsesion + "!" + znodolista + "[&VAR.m4lix]" + ".";
   
   String zoutputdefconf = zsubsesion + "!" + znodoconf + "[*]";
   String zmoveconf = znodoconf + ":" + znodoconf + "[FIRST]";
   String zcomunconf = znodoconf + ":" + zsubsesion + "!" + znodoconf + "[&VAR.m4lix]" + ".";
 /*     
   String znodocom = "SSE_COMUNICACION";
   String zoutputdefcom = zsubsesion + "!" + znodocom + "[*]";
   

   //String znodoprincipal = "SSE_PRINCIPAL";*/
   String zmetodocarga = "CARGA:" + zsubsesion + "!" + znodo + ".SSE_CARGA_HISTORICO";
     
  
   String zNOMBREEMPLEADO = zcomun + "SCO_GB_NAME";
   String zID_RESPUESTA = zcomunconf+ "RESPUESTA";
   String zID_CONFLICTO = zcomunconf + "ID_CONFLICTO";
   String zCCB_COMENTARIO = zcomunconf + "CCB_COMENTARIO";
   String zCCB_ESTADO = zcomunconf  + "CCB_ESTADO"; 
   String zDT_START = zcomunconf+ "DT_START";
   String zVALOR = zcomunconf+ "VALOR";
 
%>
<m4:startpage m4task="<%=zsubsesion%>"/><m4:beginjob/>
<m4:datadef m4o="<%=zmeta4object%>" m4name="<%=zsubsesion%>"/>
<m4:exec m4method="<%=zmetodocarga%>"><m4:param name="ID_PERSON" value="<%=zid_person%>"/><m4:param name="CONFLICTO" value="<%=zconflicto%>"/><m4:param name="ID_PERIODO" value="<%=zperiodo%>"/></m4:exec>
<m4:outputdef m4alias="<%=znodo%>" ><m4:param name="m4name0" value="<%=zoutputdef%>"/></m4:outputdef>
<m4:outputdef m4alias="<%=znodoconf%>" ><m4:param name="m4name0" value="<%=zoutputdefconf%>"/></m4:outputdef>
<m4:endjob/>
<m4:move><m4:param name="<%=zsubsesion%>" value="<%=zmove%>"/></m4:move>
<m4:move><m4:param name="<%=zsubsesion%>" value="<%=zmoveconf%>"/></m4:move>
<%
	int  zcounti  = 0;
	int  zcountilista  = 0;
	int  zcounticonf  = 0;
	int  zcount  = 0;	
	try {
		M4Operations m = new M4Operations(request);
		zcounti = m.getCountInClient(znodoconf,zsubsesion,znodoconf);
		zcount = m.getCount(znodoconf,zsubsesion,znodoconf);
		zcounticonf = m.getCountInClient(znodoconf,zsubsesion,znodoconf);
	} catch(Exception e) {}
	String	zcountv = String.valueOf(zcounti);
	String	zcountvconf = String.valueOf(zcounticonf);
	//out.print("couunt:"+zcountvconf);
%>
<table width="90%" align="center" cellspacing="0">
<tr>
  <td class="titulofuncional" colspan="2">Historico de respuestas</td>
</tr>
<tr>
	<td><img alt="Valida direcciones"title="Valida direcciones" src="/iconos/noname_valida_domicilio_122_100.gif" width="122" height="100" /></td>
	<td><div class="descripcionfuncional">Aqui puede ver el historico de las respuestas del empleado</div></td>
</tr>
</table>


<p>
  <% if (zcounticonf > 0) {
	String zregistroinicials = String.valueOf(zregistroinicial);
	String zregistrofinals = String.valueOf(zregistroinicial + zcounticonf - 1);
 %>
</p>
<table width="90%" align="center" cellspacing="0">
<tr>
  <td class="tablaestadosceldatitulo" colspan="2">&nbsp;Historico de respuestas (<%=zcountvconf%>)</td>
</tr>
<%
int zposicion = 0;
String zposicions = "0";
%>
<tr>
	<td colspan="2" class="fuentecampo"><table width="100%" cellspacing="0">
	  <tr>
        <td class="fuentecamponombre" colspan="5">&nbsp;Empleado: <%=znombre_emp%></td>
      </tr>
      <tr>
        <td class="fuentecamponombre" colspan="5">&nbsp;Conflicto:&nbsp;&nbsp;<%=znombre_conf%></td>
      </tr>
      </table>
      <table width="100%" cellpadding="1" cellspacing="0" bgcolor="#000000">
        <tr><td><table width="100%" border="1" cellspacing="0" bordercolor="#000000" bgcolor="#FFFFFF">
      <tr class="tablaestadosceldatitulo">
        <td width="21%" class="fuentecamponombre"><div align="center">Descuento de nomina</div></td>
        <td width="20%" class="fuentecamponombre"><div align="center">Valor</div></td>
        <td width="36%" class="fuentecamponombre"><div align="center">Comentario</div></td>
        <td width="9%" class="fuentecamponombre"><div align="center">Estado</div></td>
        <td width="14%" class="fuentecamponombre"><div align="center">Fecha</div></td>
      </tr>
      <m4:loop from="<%=zregistroinicials%>" to="<%=zregistrofinals%>">
<%  zposicions = m4lix;
	zposicion = Integer.valueOf(zposicions).intValue();
 	zposicion = zposicion - zregistroinicial;
%>
      <tr>
        <td height="20"><div align="center"><m4:item m4name="<%=zID_RESPUESTA%>" htmlsafe="true"/>
          </div></td>
        <td ><div align="center">&nbsp;<m4:item m4name="<%=zVALOR%>" htmlsafe="true"/></DIV></td>
        <td >&nbsp;<m4:item m4name="<%=zCCB_COMENTARIO%>" htmlsafe="true"/></td>
        <td>&nbsp;<m4:item m4name="<%=zCCB_ESTADO%>" htmlsafe="true"/></td>
        <td><div align="center"><m4:item m4name="<%=zDT_START%>" htmlsafe="true"/></DIV></td>
      </tr></m4:loop>
    </table></td></tr></table>
    </td>
	</tr>
<tr>
	<td class="fuentecampo" colspan="2"></td>
</tr>
<tr><td class="separadorlinea" colspan="2">	<hr /></td></tr>

<tr>
	<td width="84%"><div align="center"> <br />
	    <br />
	    <input name="Cerrar" type="button" id="Cerrar" value="Cerrar" onclick="window.close()"/>	
    </div></td>
</tr>
</table>

<%}else{%>	
<div class="fuentenodatos">Actualmente no tienes ning&uacute;n dato que validar en este nivel.</div>
<br/> <br/>
 <%}%>
<m4:endpage/>
<%@ include file="../../sse_generico/espanol/generico_disclaimer.jsp" %>
</div>
</body>
</html>


