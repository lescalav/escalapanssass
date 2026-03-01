<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<!-- Plantilla principal -->
<xsl:template match="/">
    <xsl:apply-templates select="productos/sarten"/>
</xsl:template>

<!-- Cada producto -->
<xsl:template match="sarten">
    <article>

        <!-- Imagen + etiquetas -->
        <div class="producto-imagen">

            <!-- Etiqueta izquierda -->
            <span class="etiqueta-izquierda">
                <xsl:value-of select="categoría"/>
            </span>

            <!-- Etiqueta derecha (solo si existe) -->
            <xsl:if test="destacado">
                <span>
                    <xsl:attribute name="class">
                        etiqueta-derecha 
                        <xsl:choose>
                            <xsl:when test="destacado='Best Seller'">etiqueta-naranja</xsl:when>
                            <xsl:when test="destacado='Agotado'">etiqueta-gris</xsl:when>
                            <xsl:when test="destacado='-15%'">etiqueta-roja</xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:value-of select="destacado"/>
                </span>
            </xsl:if>

            <!-- Imagen -->
            <img>
                <xsl:attribute name="src">
                    images/<xsl:value-of select="imagen"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="nombre"/>
                </xsl:attribute>
            </img>

        </div>

        <!-- Información -->
        <div class="producto-info">
            <h3>
                <xsl:value-of select="nombre"/>
            </h3>

            <p>
                <xsl:value-of select="colección"/>
            </p>

            <ul class="caracteristicas">
                <xsl:for-each select="caracteristicas/caracteristica">
                    <li>
                        <span class="material-symbols-outlined">check_circle</span>
                        <xsl:value-of select="."/>
                    </li>
                </xsl:for-each>
            </ul>
        </div>

        <!-- Acciones -->
        <div class="producto-acciones">
            <span class="precio">
                €<xsl:value-of select="precio"/>
            </span>

            <button>
                <span class="material-symbols-outlined">
                    add_shopping_cart
                </span>
            </button>
        </div>

    </article>
</xsl:template>

</xsl:stylesheet>