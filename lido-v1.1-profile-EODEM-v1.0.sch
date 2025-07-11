<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:lido="http://www.lido-schema.org"
    xmlns:lido-qa="http://www.lido-schema.org/quality-assurance"
    xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xml="http://www.w3.org/XML/1998/namespace"
    targetNamespace="http://www.lido-schema.org/quality-assurance" elementFormDefault="qualified"
    attributeFormDefault="qualified">
    <!--
        xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        xx This is an additional schema for EODEM v1.0. It is to be understood as a complementary tool for
        xx assuring the quality of EODEM records. 
        xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    -->
    
    <xs:annotation>
        <xs:appinfo>
            <sch:ns uri="http://www.lido-schema.org" prefix="lido"/>
            <sch:ns uri="http://www.w3.org/2002/07/owl#" prefix="owl"/>
            <sch:ns uri="http://www.w3.org/2004/02/skos/core#" prefix="skos"/>
            
            <sch:title>Abstract Schematron rules</sch:title>
            <sch:pattern>
                <sch:title>Basic EODEM validation rules</sch:title>
                <sch:p>These rules are complementary to the derived EODEM XML Schema, and should be used in
                conjunction with it.</sch:p>
                
                <sch:rule abstract="true" id="eodem_nonempty">
                    <sch:assert
                        test="string(.)" role="warn">
                        <sch:name/> should have a non-empty value.
                    </sch:assert>
                </sch:rule>
                <sch:rule abstract="true" id="eodem_applicationProfile">
                    <sch:assert
                        test=".='EODEM version 1'" role="warn">
                        <sch:name/> must have the value 'EODEM version 1'.
                    </sch:assert>
                </sch:rule>
                <sch:rule abstract="true" id="eodem_objectPublishedID">
                    <sch:assert
                        test="not(@type) or @type='http://terminology.lido-schema.org/lido00099'" role="warn">
                        If <sch:name/> has a type attribute, it must have value 'http://terminology.lido-schema.org/lido00099'.
                    </sch:assert>
                </sch:rule>
                <sch:rule abstract="true" id="eodem_identifier_type">
                    <sch:assert
                        test="not(@type) or @type='http://terminology.lido-schema.org/lido00510' 
                            or @type='http://terminology.lido-schema.org/lido00100' 
                            or @type='http://terminology.lido-schema.org/lido00099'" role="warn">
                    </sch:assert>
                </sch:rule>
                <sch:rule abstract="true" id="eodem_term">
                    <sch:assert
                        test="count(lido:term) &gt; 0" role="warn">
                        <sch:name/> should contain at least one lido:term element.
                    </sch:assert>
                </sch:rule>
            </sch:pattern>
        </xs:appinfo>
    </xs:annotation>
</xs:schema>
