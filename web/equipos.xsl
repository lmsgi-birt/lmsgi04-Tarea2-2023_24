<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<!-- Selecciona todos los nodos que cuelgan de club_voleibol -->
<xsl:template match="/club_voleibol">
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
			<!-- 
				Selecciona el equipo que entrena Julio Velasco
				Usa una variable y plantillas
			-->
			<xsl:variable name="entrenador" select="'Julio Velasco'" />

			<xsl:apply-templates select="equipo[entrenador/nombre=$entrenador]" />

		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>	

<!--
	De cada equipo muestra el nombre del entrenador, el nombre del equipo y
	los jugadores o jugadoras titulares con su número de camiseta
-->
<xsl:template match="equipo">
	<h1>
		<a href="{entrenador/url}" target="_blank">
			<xsl:value-of select="entrenador/nombre" />
		</a>
	</h1>

	<article class="equipos">
		<h4><xsl:value-of select='nombre' /></h4>
		<!-- Selecciona los titulares y les aplica una plantilla -->
		<xsl:apply-templates select="jugadores/jugador[@titular='si']" />
	</article>
</xsl:template>

<!-- Plantilla para los datos de los jugadores -->
<xsl:template match="jugador">
	<p><xsl:value-of select='@camiseta' /> - <xsl:value-of select='nombre' /></p>
</xsl:template>

</xsl:stylesheet>