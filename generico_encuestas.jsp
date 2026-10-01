<%@ taglib uri="M4Tags" prefix="m4"%>

<%@ page import="java.io.*, java.util.*, java.net.*" %>	
<%@ page  import="com.meta4.session.*, com.meta4.m4operations.*" %>	
	<!--@David: Nuevo manejo de noticias para sonreir en portal redhumana -->

<%
   String zsubsesion_enc = "CCB_ENCUESTA_LIDERAZGO";
   String zmeta4object_enc = "CCB_ENCUESTA_LIDERAZGO";
   String znodo_enc = "CCB_ENCUESTA_LIDERAZGO";
   String znodo_enc2 = "CCB_ENCUESTA_VIG";
   String znodo_enc3 = "CCB_ENCUESTA_ASIGNADAS";

   String znodo_enc4 = "CCB_ENC_CLI_LAB";
   String znodo_enc5 = "CCB_ENC_POB_CLILAB";

   String znodo_enc6 = "CCB_ENC_CLI_LAB_EXT";
   String znodo_enc7 = "CCB_ENC_POB_CLILAB_EXT";


   String ztipocarga_enc = "SSE";  
 
   String zoutputdef_enc = zsubsesion_enc + "!" + znodo_enc + "[*]";
   String zmove_enc = znodo_enc + ":" +znodo_enc + "[FIRST]";
   String zcomun = znodo_enc + ":" + zsubsesion_enc + "!" + znodo_enc + "[&VAR.m4lix]" + ".";

   String zoutputdef_enc2 = zsubsesion_enc + "!" + znodo_enc2 + "[*]";
   String zmove_enc2 = znodo_enc2 + ":" +znodo_enc2 + "[FIRST]";
   String zcomun2 = znodo_enc2 + ":" + zsubsesion_enc + "!" + znodo_enc2 + "[&VAR.m4lix]" + ".";

   String zoutputdef_enc3 = zsubsesion_enc + "!" + znodo_enc3 + "[*]";
   String zmove_enc3 = znodo_enc3 + ":" +znodo_enc3 + "[FIRST]";
   String zcomun3 = znodo_enc3 + ":" + zsubsesion_enc + "!" + znodo_enc3 + "[&VAR.m4lix]" + ".";

   String zoutputdef_enc4 = zsubsesion_enc + "!" + znodo_enc4 + "[*]";
   String zmove_enc4 = znodo_enc4 + ":" +znodo_enc4 + "[FIRST]";
   String zcomun4 = znodo_enc4 + ":" + zsubsesion_enc + "!" + znodo_enc4 + "[&VAR.m4lix]" + ".";

   String zoutputdef_enc5 = zsubsesion_enc + "!" + znodo_enc5 + "[*]";
   String zmove_enc5 = znodo_enc5 + ":" +znodo_enc5 + "[FIRST]";
   String zcomun5 = znodo_enc5 + ":" + zsubsesion_enc + "!" + znodo_enc5 + "[&VAR.m4lix]" + ".";   

   String zoutputdef_enc6 = zsubsesion_enc + "!" + znodo_enc6 + "[*]";
   String zmove_enc6 = znodo_enc6 + ":" +znodo_enc6 + "[FIRST]";
   String zcomun6 = znodo_enc6 + ":" + zsubsesion_enc + "!" + znodo_enc6 + "[&VAR.m4lix]" + ".";

   String zoutputdef_enc7 = zsubsesion_enc + "!" + znodo_enc7 + "[*]";
   String zmove_enc7 = znodo_enc7 + ":" +znodo_enc7 + "[FIRST]";
   String zcomun7 = znodo_enc7 + ":" + zsubsesion_enc + "!" + znodo_enc7 + "[&VAR.m4lix]" + ".";   

   String zmetodocarga_enc = "CARGA:" + zsubsesion_enc + "!CCB_ENCUESTA_LIDERAZGO.CCB_ACCESO_ENCUESTAS";

   String id_balance;
   long par_cedula = Long.parseLong(zCEDULA);
   par_cedula = (par_cedula*2)+4;
    
   id_balance = String.valueOf(par_cedula);

   %>	

	<script type="text/javascript">		

		function abrir_noticias(){

			  window.location = "../sse_g6/sse_g6_frentes_beneficios.jsp?estado=61"

			  var params = [

				  'height='+(screen.height-60),

				  'width='+(screen.width-20),

				  'top=0',

				  'left=0',

				  'scrollbars'

			   ].join(',');

			url='../sse_generico/Noticias_para_sonreir.pdf';

			window.open(url,"",params);	

		}

		function abrir_balance(){

              window.location = "../sse_generico/generico_portal.jsp?estado=61"

			  var params = [

				  'height='+(screen.height-60),

				  'width='+(screen.width-20),

				  'top=0',

				  'left=0',

				  'scrollbars'

			   ].join(',');

			url='/Balances/<%=id_balance%>.pdf'; 

			window.open(url,"",params);	

		}

		function submitEncuesta(tipoenc){
			//alert("TipoEnc");
			m4valor("NombreFormulario","CCB_P_TIPO",tipoenc,"set");
			m4submit("NombreFormulario");
		}
	</script>	


	  <div class="btn_ayuda">
<!--FT@META4 12/03/2019: Ocultar Opciones Exito  -->
        <!--a onclick="abrir_noticias();" onmouseover="this.style.cursor='hand'">

			<img src="/iconos/espanol/btn_noticias_sonreir.jpg" alt="Noticias para sonreir" width="200px" height="100px"/>

        </a-->

    </div>

	

	

	<div class="btn_ayuda">
<!--FT@META4 12/03/2019: Ocultar Opciones Exito  -->
        <!--a href="/sse_generico/espanol/ola_F1.pdf" onmouseover="this.style.cursor='hand'" target="_blank">

			<img src="/iconos/espanol/botonF1.png" alt="F1" width="200px" height="100px"/>

        </a-->

    </div>
	


<m4:startpage m4task="<%=zsubsesion_enc%>"/>
<m4:beginjob/>
	<m4:datadef m4o="<%=zmeta4object_enc%>" m4name="<%=zsubsesion_enc%>"/>
	<m4:exec m4method="<%=zmetodocarga_enc%>"></m4:exec>
	<m4:outputdef m4alias="<%=znodo_enc%>" ><m4:param name="m4name0" value="<%=zoutputdef_enc%>"/></m4:outputdef>
	<m4:outputdef m4alias="<%=znodo_enc2%>"><m4:param name="m4name0" value="<%=zoutputdef_enc2%>"/></m4:outputdef>
	<m4:outputdef m4alias="<%=znodo_enc3%>"><m4:param name="m4name0" value="<%=zoutputdef_enc3%>"/></m4:outputdef>
	<m4:outputdef m4alias="<%=znodo_enc4%>"><m4:param name="m4name0" value="<%=zoutputdef_enc4%>"/></m4:outputdef>
	<m4:outputdef m4alias="<%=znodo_enc5%>"><m4:param name="m4name0" value="<%=zoutputdef_enc5%>"/></m4:outputdef>	
	<m4:outputdef m4alias="<%=znodo_enc6%>"><m4:param name="m4name0" value="<%=zoutputdef_enc6%>"/></m4:outputdef>
	<m4:outputdef m4alias="<%=znodo_enc7%>"><m4:param name="m4name0" value="<%=zoutputdef_enc7%>"/></m4:outputdef>	
	<!--Contiene si el empleado tiene acceso a teletrabajo-->
<m4:endjob/>
<m4:move>
	<m4:param name="<%=zsubsesion_enc%>" value="<%=zmove_enc%>"/>
	<m4:param name="<%=zsubsesion_enc%>" value="<%=zmove_enc2%>"/>
	<m4:param name="<%=zsubsesion_enc%>" value="<%=zmove_enc3%>"/>
	<m4:param name="<%=zsubsesion_enc%>" value="<%=zmove_enc4%>"/>
	<m4:param name="<%=zsubsesion_enc%>" value="<%=zmove_enc5%>"/>
	<m4:param name="<%=zsubsesion_enc%>" value="<%=zmove_enc6%>"/>
	<m4:param name="<%=zsubsesion_enc%>" value="<%=zmove_enc7%>"/>
</m4:move>
<%
int  zcounti_enc  = 0;
int  zcounti_enc2  = 0;
int  zcounti_enc3  = 0;

int  zcounti_enc4  = 0;
int  zcounti_enc5  = 0;

int  zcounti_enc6  = 0;
int  zcounti_enc7  = 0;

String zOrdInt = "";
String zOrdExt = "";

try {
    M4Operations m = new M4Operations(request);
    zcounti_enc = m.getCountInClient(znodo_enc,zsubsesion_enc,znodo_enc);
	zcounti_enc2 = m.getCountInClient(znodo_enc2,zsubsesion_enc,znodo_enc2);
	zcounti_enc3 = m.getCountInClient(znodo_enc3,zsubsesion_enc,znodo_enc3);

	zcounti_enc4 = m.getCountInClient(znodo_enc4,zsubsesion_enc,znodo_enc4);
	zOrdInt = m.getItem(znodo_enc4,zsubsesion,znodo_enc4,"0","ORDINAL");
	zcounti_enc5 = m.getCountInClient(znodo_enc5,zsubsesion_enc,znodo_enc5);

	zcounti_enc6 = m.getCountInClient(znodo_enc6,zsubsesion_enc,znodo_enc6);
	zOrdExt = m.getItem(znodo_enc6,zsubsesion,znodo_enc6,"0","ORDINAL");
	zcounti_enc7 = m.getCountInClient(znodo_enc7,zsubsesion_enc,znodo_enc7);
} catch(Exception e) {}

String zcountv =  String.valueOf(zcounti_enc -1);
String zcountv2 =  String.valueOf(zcounti_enc2);
String zcountv3 =  String.valueOf(zcounti_enc3);

String zcountv4 =  String.valueOf(zcounti_enc4);
String zcountv5 =  String.valueOf(zcounti_enc5);

String zcountv6 =  String.valueOf(zcounti_enc6);
String zcountv7 =  String.valueOf(zcounti_enc7);

%>

<form action="/servlet/CheckSecurity/JSP/sse_generico/sse_generico_inter_enc_cli_lab.jsp" method="post" name="NombreFormulario" id="NombreFormulario">
<input type="hidden" id="CCB_P_ORDINAL" name="CCB_P_ORDINAL" value="" />
<input type="hidden" id="CCB_P_TIPO" name="CCB_P_TIPO" value="" />
</form>

<%if (zcounti_enc2>0 && zcounti_enc3>0){ %>
	 <div class="btn_ayuda">	 
        <a href="/servlet/CheckSecurity/JSP/sse_generico/sse_generico_inter_enc.jsp" onmouseover="this.style.cursor='hand'">
			<img src="/iconos/espanol/btn_boton_liderazgo.png" alt="Encuesta Liderazgo" width="200px" height="80px"/>
        </a>
    </div>
<%}%>

<%if (zcounti_enc4>0 && zcounti_enc5>0){ %>
	 <div class="btn_ayuda">	 
        <!--a href="/servlet/CheckSecurity/JSP/sse_generico/sse_generico_inter_enc_cli_lab.jsp" onmouseover="this.style.cursor='hand'"-->
        <a title="<%=zOrdInt%>" href="javascript:submitEncuesta('0');" onmouseover="this.style.cursor='hand'">
			<img src="/iconos/espanol/botonEncuestaClimaInterna.png" alt="Encuesta Clima Laboral Interna" width="200px" height="80px"/>
        </a>
    </div>
<%}%>

<%if (zcounti_enc6>0 && zcounti_enc7>0){ %>
	 <div class="btn_ayuda">	 
        <!--a href="/servlet/CheckSecurity/JSP/sse_generico/sse_generico_inter_enc_cli_lab.jsp" onmouseover="this.style.cursor='hand'"-->
        <a title="<%=zOrdExt%>" href="javascript:submitEncuesta('1');" onmouseover="this.style.cursor='hand'">		
			<img src="/iconos/espanol/botonEncuestaClimaExterna.png" alt="Encuesta Clima Laboral Externa" width="200px" height="80px"/>
        </a>
    </div>
<%}%>

<%
	

	//La variable zES_ESPECIAL es una cadena que contiene los códigos separadas por comas, de las encuestas en las que participa el empleado

	


	//Encuesta 1: Tu prima crece con exito
	
	//Encuesta 2: Encuesta compensación flexible
	//Encuesta 3: Plan institucional Pole

	//Encuesta 4: Balance social empleado

	//Encuesta 12: Encuesta SALUD EN EL TRABAJO
	//Encuesta 13: Encuesta Habeas Data

	//Encuesta 14: Encuesta Servicio de aseo

	//Encuesta 16: Encuesta Exploradores

	//Encuesta 20: Encuesta COPASST Antioquia
	//Encuesta 21: Encuesta COPASST Oriente
	//Encuesta 22: Encuesta COPASST Valle
	//Encuesta 23: Encuesta COPASST Costa
	//Encuesta 24: Encuesta COPASST Centro
	//Encuesta 25: Encuesta COPASST Occidente
	//Encuesta 26: Encuesta Comite de convivencia
	//Encuesta 27: Encuesta Equipares	

	// Asi se pregunta por encuesta activa cuando se controlan los empleados a los que les debe aparecer mediante la tabla M4SSE_HR_PROCESO

	// if(zES_ESPECIAL.indexOf(",1,")>=0 && encuesta1){

	// Asi se pregunta por encuesta activa cuando es para todos los empleados

	// if(encuesta1){

	

	int fecha_int = Integer.parseInt(stringFecha);
	
	

	//Distribucion pole a plan institucional
	boolean encuesta1 = false;	
	boolean encuestaX2 = false;	
	boolean encuesta2 = false;	
	boolean encuesta3 = false;	
	boolean encuesta4 = false;	
	boolean encuesta12 = false ;
	boolean encuesta13 = false ;
	boolean encuesta14 = false ;
	
	boolean encuesta20 = false ;
	boolean encuesta21 = false ;
	boolean encuesta22 = false ;
	boolean encuesta23 = false ;
	boolean encuesta24 = false ;
	boolean encuesta25 = false ;
	boolean encuesta26 = false ;
	boolean encuesta27 = false ;

	
   //Fechas 2017 encuesta aseo
   if((fecha_int>=2017012905 && fecha_int<=2017020423) || 
   (fecha_int>=2017022601 && fecha_int<=2017030423) || 
   (fecha_int>=2017032900 && fecha_int<=2017040423) || 
   (fecha_int>=2017042800 && fecha_int<=2017050423) || 
   (fecha_int>=2017052900 && fecha_int<=2017060423) || 
   (fecha_int>=2017062800 && fecha_int<=2017070423) || 
   (fecha_int>=2017072900 && fecha_int<=2017080423) || 
   (fecha_int>=2017082900 && fecha_int<=2017090423) || 
   (fecha_int>=2017092800 && fecha_int<=2017100423) || 
   (fecha_int>=2017102900 && fecha_int<=2017110423) || 
   (fecha_int>=2017112800 && fecha_int<=2017120423) || 
   (fecha_int>=2017122900 && fecha_int<=2018010423)) {
	   encuesta14 = true;
	}

	//Tu prima crece
	if(fecha_int >= 2018101607 && fecha_int < 2018111312){
	   encuesta1 = true;
	}
	
	//Distribucion Pole Position
	if(fecha_int >= 2019031113 && fecha_int < 2019031417){
	   encuesta2 = true;
	}

	//Plan institucional Pole
	if(fecha_int >= 2019031113 && fecha_int < 2019031417){
	   encuesta3 = true;
	}

	//Balance social empleado
	if(fecha_int >= 2022011907 && fecha_int < 2022070423){
	   encuesta4 = true;
	}

	//Encuesta SALUD EN EL TRABAJO
	if(fecha_int>=2018080816 && fecha_int <2019082023){
	   encuesta12 = true;
	}

	//Encuesta Habeas Data
	if(fecha_int>=2018031406 && fecha_int<2019123123){
	   encuesta13 = true;
	}

	// Encuesta COPASST Antioquia
	if(fecha_int>=2018082806 && fecha_int<2018090712){
	   encuesta20 = true;
	}

	// Encuesta COPASST Oriente
	if(fecha_int>=2018091108 && fecha_int<2018092412){
	   encuesta21 = true;
	}

	// Encuesta COPASST Valle
	if(fecha_int>=2018082201 && fecha_int<2018083123){
	   encuesta22 = true;
	}

	// Encuesta COPASST Costa
	if(fecha_int>=2018101607 && fecha_int<2018102123){
	   encuesta23 = true;
	}

	// Encuesta COPASST Centro
	if(fecha_int>=2018103008 && fecha_int<2018110923){
	   encuesta24 = true;
	}

	// Encuesta COPASST Occidente
	if(fecha_int>=2018121006 && fecha_int<2018122623){
	   encuesta25 = true;
	}

	//Encuesta Comite de convivencia
	if(fecha_int>=2019011708 && fecha_int<2019013112){
	   encuesta26 = true;
	}

	//Equipares
	if(fecha_int >= 2021091507 && fecha_int < 2021093023){
	   encuesta27 = true;
	}

	// *******  SE HACEN LOS LLAMADOS A LAS DIFERENTES ENCUESTAS  ****************************************************
	%>		

	<% if(zES_ESPECIAL.indexOf(",2,")>=0  && encuesta2){ %>
		<div class="btn_ayuda">	
		<a href="generico_pole1.jsp" >
			<img src="/iconos/espanol/EncuestaPole.png" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
		</a>
		</div>
	<% } %>

	<% if(zES_ESPECIAL.indexOf(",3,")>=0  && encuesta3){ %>
		<div class="btn_ayuda">	
		<a href="https://es.surveymonkey.com/r/L8T9TNC?id_usr=<%= zCEDULA %>" target="_blank">
			<img src="/iconos/espanol/Plan_institucional.png" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
		</a>
		</div>
	<% } %>


	<% if(zES_ESPECIAL.indexOf(",4,")>=0  && encuesta4){ %>
		<div class="btn_ayuda">	
            <!-- <a onclick="abrir_balance();" onmouseover="this.style.cursor='hand'">       juandiegosanta@gmail.com  5 mar 2021   HU  201277 Reporte de descarga del balance social individual  -->
			<!--    <a onclick="abrir_balance();" onmouseover="this.style.cursor='hand'">    -->
			<a href="generico_balance_social.jsp" onmouseover="this.style.cursor='hand'"   > 	
	
				<img src="/iconos/espanol/boton-reconocimientos.png" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>


	<%


	if(zES_ESPECIAL.indexOf(",14,")>=0 && encuesta14){
	%>		
		<div class="btn_ayuda">								
			<a onclick="abrirEncuesta('<%= zCEDULA %>','<%= zNom_Ape %>','<%= zIdDependencia %>','encuestaaseo')" >
			   <img src="/iconos/espanol/Encuesta_servicio_aseo.png" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>
	<% } %>


	<% if(encuesta12){ %>
		<div class="btn_ayuda">	
	   <a href="https://es.surveymonkey.com/r/3HGSB2S" target="_blank">
			   <img src="/iconos/espanol/Encuesta_salud.png" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>




	<% if(encuesta13){ %>
		<div class="btn_ayuda">	
	   <a href="https://es.surveymonkey.com/r/GFHFZYH?usr_id=<%= zCEDULA %>" target="_blank">
			   <img src="/iconos/espanol/botonHabeasData.png" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>

	<% if(encuesta26){ %>
		<div class="btn_ayuda">	
	   <a href="https://es.surveymonkey.com/r/NL6XLYS?usr_id=<%= zCEDULA %>" target="_blank">
			   <img src="/iconos/espanol/LogoConvivenciaLaboral.jpg" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>
	
	<% if(zES_ESPECIAL.indexOf(",21,")>=0 && encuesta21){ %>
		<div class="btn_ayuda">	
	   <a href="https://es.surveymonkey.com/r/PCGN2TQ?usr_id=<%= zCEDULA %>" target="_blank">
			   <img src="/iconos/espanol/Logoencuestacoppast.jpg" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>

	<% if(zES_ESPECIAL.indexOf(",22,")>=0 && encuesta22){ %>
		<div class="btn_ayuda">	
	   <a href="https://es.surveymonkey.com/r/B3YNVSB?usr_id=<%= zCEDULA %>" target="_blank">
			   <img src="/iconos/espanol/Logoencuestacoppast.jpg" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>

	<% if(zES_ESPECIAL.indexOf(",23,")>=0 && encuesta23){ %>
		<div class="btn_ayuda">	
	   <a href="https://es.surveymonkey.com/r/5RNPBNV?usr_id=<%= zCEDULA %>" target="_blank">
			   <img src="/iconos/espanol/Logoencuestacoppast.jpg" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>

	<% if(zES_ESPECIAL.indexOf(",24,")>=0 && encuesta24){ %>
		<div class="btn_ayuda">	
	   <a href="https://es.surveymonkey.com/r/WZ68P7Y?usr_id=<%= zCEDULA %>" target="_blank">
			   <img src="/iconos/espanol/Logoencuestacoppast.jpg" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>

	<% if(zES_ESPECIAL.indexOf(",25,")>=0 && encuesta25){ %>
		<div class="btn_ayuda">	
	   <a href="https://es.surveymonkey.com/r/MV5YKCQ?usr_id=<%= zCEDULA %>" target="_blank">
			   <img src="/iconos/espanol/Logoencuestacoppast.jpg" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>

	<% if(encuesta27){ %>
		<div class="btn_ayuda">	
	   <a href="https://survey.equipares.org/" target="_blank">
			   <img src="/iconos/espanol/boton_equipares.png" width="200px" height="80px" onmouseover="this.style.cursor='hand'" />
			</a>
		</div>	
	<% } %>

<!--	<div class="btn_ayuda">	
	<a href="https://es.surveymonkey.com/r/Q38YFBN?id_usr=xxxx">prueba survey</a>
	</div>
	-->

	<% /*
		String url = request.getRequestURL().toString(); 
		out.println("tu url "+url);
		*/
	%>
	<m4:endpage/>