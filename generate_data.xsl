<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:template match="/">
        <xsl:result-document href="data.xml">
            <manuscripts>
            <xsl:for-each select="collection(iri-to-uri('../../../BiblioPhilly/viewshare/TEI/?select=*.xml;recurse=yes'))">
                <xsl:variable name="fileName" select="tokenize(replace(document-uri(.), '_TEI.xml', ''), '/')[position() = last()]"/>
                <xsl:variable name="title"/>
                <xsl:for-each select="//tei:surface">
                    <xsl:variable name="repository" select="//tei:publisher"/>
                    <xsl:variable name="collection">
                        <xsl:if test="contains($repository,'Free')">0023</xsl:if>
                        <xsl:if test="contains($repository,'Company')">0012</xsl:if>
                        <xsl:if test="contains($repository,'Physicians')">0027</xsl:if>
                        <xsl:if test="contains($repository,'Rosenbach')">0028</xsl:if>
                        <xsl:if test="contains($repository,'Othmer')">0025</xsl:if>
                        <xsl:if test="contains($repository,'McCabe')">0008</xsl:if>
                    </xsl:variable>
                    <xsl:variable name="fol" select="@n"/>
                    <xsl:variable name="imgFile" select="tei:graphic[contains(@url,'web')]/@url"/>
                    <xsl:variable name="href" select="concat('http://openn.library.upenn.edu/Data/',$collection,'/html/',$fileName,'.html')"/>
                    <xsl:variable name="src" select="concat('http://openn.library.upenn.edu/Data/',$collection,'/',$fileName,'/data/',$imgFile)"/>
                    <xsl:variable name="shelfmark" select="//tei:idno[@type='call-number']"/>
                    <xsl:variable name="title" select="//tei:msItem[1]/tei:title"/>
                    <xsl:variable name="deco" select="//tei:decoNote[@n=$fol]/text()"/>
                    <ms>
                        <href><xsl:value-of select="$href"/></href>
                        <src><xsl:value-of select="$src"/></src>
                        <caption><xsl:value-of select="$repository"/>, <xsl:value-of select="$shelfmark"/>, <xsl:value-of select="$fol"/>. <xsl:if test="$deco != ''"><xsl:value-of select="$deco"/>. </xsl:if></caption>
                </ms></xsl:for-each>
            </xsl:for-each>
            </manuscripts>
        </xsl:result-document>
        
    </xsl:template>
    
</xsl:stylesheet>