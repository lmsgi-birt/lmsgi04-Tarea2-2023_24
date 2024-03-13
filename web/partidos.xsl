<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<!-- Selecciona todos los nodos que cuelgan de club_voleibol -->
<xsl:template match='/club_voleibol'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
			<h1>PARTIDOS</h1>
			<table>
				<tr>
					<th>PARTIDO</th>
					<th>FECHA</th>
					<th>RESULTADO</th>
				</tr>

				<!-- 
					Selecciona todos los partidos que se juegan en Lima
					Los ordena por fecha desde el más reciente
					Muestra los equipos, la fecha y el resultado
					Si gana el visitante lo muestra en azul
				-->
				<xsl:for-each select="partido[lugar/@ciudad='Lima']">
				<xsl:sort select="fecha" order="descending" />
					<tr>
						<td><xsl:value-of select='equipos/local' /> - <xsl:value-of select='equipos/visitante' /></td>
						<td><xsl:value-of select='fecha' /></td>
						
						<xsl:variable name="local" select="equipos/local/@puntuacion" />
						<xsl:variable name="visitante" select="equipos/visitante/@puntuacion" />
						<xsl:if test="$visitante>$local">
							<td class="azul"><xsl:value-of select='$local' /> - <xsl:value-of select='$visitante' /></td>	
						</xsl:if>
						<xsl:if test="$visitante&lt;=$local">
							<td><xsl:value-of select='$local' /> - <xsl:value-of select='$visitante' /></td>	
						</xsl:if>
						
					</tr>
				</xsl:for-each>
			</table>			
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>