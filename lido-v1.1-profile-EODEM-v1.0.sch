<?xml version="1.0" standalone="yes"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" queryBinding="xslt2">
  <sch:title xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">Schematron constraints for LIDO Version 1.1</sch:title>
  <sch:title xmlns:lido="http://www.lido-schema.org" xmlns:lido-qa="http://www.lido-schema.org/quality-assurance" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">Abstract Schematron rules</sch:title>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" uri="http://www.lido-schema.org" prefix="lido"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" uri="http://www.w3.org/2002/07/owl#" prefix="owl"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" uri="http://www.w3.org/2004/02/skos/core#" prefix="skos"/>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>Either free text or index element</sch:title>
            <sch:p>In LIDO v1.1 some text elements are extended to <tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>
					in order to foster controlled indexing in the future. To enable backwards 
					compatibility either elements of <tei:ref target="#textComplexType">textComplexType</tei:ref> or elements of 
					<tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>  
					are allowed. Note that the elements are defined to be mutually exclusive.</sch:p>
            <sch:rule abstract="true" id="sch_MixedContent">
               <sch:assert role="fatal" test="        (skos:Concept or lido:conceptID or lido:term) and not(text()[not(normalize-space(.) = '')] or @xml:lang or @lido:encodinganalog or @lido:label)        or        (text()[normalize-space(.) != ''] and not(skos:Concept or lido:conceptID or lido:term))        or        (not(*) and (not(text()) or normalize-space(.) = ''))        "> Asserts that either an element based on <tei:ref target="#textComplexType">textComplexType</tei:ref> or an element 
						based on <tei:ref target="#conceptComplexType">conceptComplexType</tei:ref> is used for <sch:name/>, but not both at the same time.
						</sch:assert>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>conceptComplexType allows only skos:Concept from SKOS namespace</sch:title>
            <sch:p>Asserts that only skos:Concept and not any other class from the SKOS namespace is used for 
					statements about a LIDO element based on <tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>.</sch:p>
            <sch:rule abstract="true" id="sch_SKOS">
               <sch:assert role="fatal" test="not(skos:*[not(self::skos:Concept)])">
						Only skos:Concept should be used as embedded class in <sch:name/> from the SKOS namespace.
					</sch:assert>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>skos:Concept allows only SKOS properties</sch:title>
            <sch:p>Asserts that only properties in the domain or range of the skos:Concept 
					Class are used for statements about a LIDO sub-element of <tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>.</sch:p>
            <sch:rule context="skos:Concept" id="sch_SKOS_properties">
               <sch:report role="fatal" test="child::*[namespace-uri() != 'http://www.w3.org/2004/02/skos/core#']">
						Only SKOS properties in the domain or range of the skos:Concept Class are allowed.
					</sch:report>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>ComplexType allows only owl:sameAs from OWL namespace</sch:title>
            <sch:p>Asserts that only owl:sameAs and not any other property or class from the 
					OWL namespace is used to state identity equivalence in instances of LIDO elements contained in
					<tei:ref target="#actorComplexType">actorComplexType</tei:ref>,
					<tei:ref target="#eventComplexType">eventComplexType</tei:ref>, 
					<tei:ref target="#legalBodyRefComplexType">legalBodyRefComplexType</tei:ref>, 
					<tei:ref target="#objectComplexType">objectComplexType</tei:ref>,
					<tei:ref target="#placeComplexType">placeComplexType</tei:ref>,
					<tei:ref target="#rightsHolderComplexType">rightsHolderComplexType</tei:ref>.
	              </sch:p>
            <sch:rule abstract="true" id="sch_OWL">
               <sch:assert role="fatal" test="not(owl:*[not(self::owl:sameAs)])"> Only owl:sameAs should be 
						used as embedded property of <sch:name/> from the OWL namespace. </sch:assert>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>Values for rightsType@type</sch:title>
            <sch:p>A LIDO <tei:ref target="#rightsType">rightsType</tei:ref> element can either hold the type attribute 'generic' or 'specific', respectively. 
					Since a generic rights type and a specific rights or license statement fall into different logical 
					categories, these types are mutually exclucive.</sch:p>
            <sch:rule abstract="true" id="sch_rightsType">
               <sch:let name="type" value="@lido:type"/>
               <sch:let name="sibling_type" value="following-sibling::lido:rightsType[@lido:type]"/>
               <sch:assert role="fatal" test="       @lido:type = 'http://terminology.lido-schema.org/lido00920'       and not(preceding-sibling::lido:rightsType[@lido:type = 'http://terminology.lido-schema.org/lido00921'])       or       @lido:type = 'http://terminology.lido-schema.org/lido00921'       and not(preceding-sibling::lido:rightsType[@lido:type = 'http://terminology.lido-schema.org/lido00920'])       or count(parent::*/lido:rightsType) = 1 and not(@lido:type)       ">
                  <sch:value-of select="name(parent::*)"/> can either hold a specific or a generic lido:rightsType@lido:type (mutually exclusive). If lido:rightsType@lido:type is used in <sch:value-of select="name(parent::*)"/>, it must be used in all <sch:value-of select="name(parent::*)"/>.
					</sch:assert>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>Possible values for lido:rightsType@lido:type</sch:title>
            <sch:p>In LIDO v1.1 a type attribute is introduced for the LIDO <tei:ref target="#rightsType">rightsType</tei:ref> element 
					in order to discern generic rights and specific ones.
					This rule asserts that only the URIs for these two types of rights are used when the type attribte is set.</sch:p>
            <sch:rule abstract="true" id="sch_rightsType_type">
               <sch:assert role="warn" test="(@lido:type = 'http://terminology.lido-schema.org/lido00920' or @lido:type = 'http://terminology.lido-schema.org/lido00921')       or not(@lido:type)">
						@lido:type can either be omitted or must hold one of the following URIs: http://terminology.lido-schema.org/lido00920, http://terminology.lido-schema.org/lido00921.
					</sch:assert>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>lido:collection must contain lido:objectName</sch:title>
            <sch:p>Asserts that lido:collection contains at least lido:object/lido:objectName.</sch:p>
            <sch:rule abstract="true" id="sch_collection">
               <sch:assert role="fatal" test="lido:object/lido:objectName">
						lido:collection must contain lido:object/lido:objectName.
					</sch:assert>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:nationalityActor">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:vitalPlaceActor">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:genderActor">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:actor">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:roleActor">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:attributionQualifierActor">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:extentActor">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:actor">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:eventType">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:roleInEvent">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:culture">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:periodName">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:eventMethod">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:lidoRecID">
                        <sch:extends rule="sch_pref"/>
                        <sch:extends rule="sch_alternate"/>
                        <sch:extends rule="eodem_nonempty"/>
                        <sch:extends rule="eodem_identifier_type"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:objectPublishedID">
                        <sch:extends rule="sch_pref"/>
                        <sch:extends rule="sch_alternate"/>
                        <sch:extends rule="eodem_identifier_type"/>
                        <sch:extends rule="eodem_objectPublishedID"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:category">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:applicationProfile">
                        <sch:extends rule="sch_pref"/>
                        <sch:extends rule="sch_alternate"/>
                        <sch:extends rule="eodem_nonempty"/>
                        <sch:extends rule="eodem_applicationProfile"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:termMaterialsTech">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:extentMaterialsTech">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:measurementType">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:measurementUnit">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:extentMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:qualifierMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:formatMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:shapeMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:scaleMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:object">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                        <sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" context="lido:objectWorkType">
                           <sch:extends rule="sch_SKOS"/>
                           <sch:extends rule="eodem_term"/>
                        </sch:rule>
                     </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:partOfPlace">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:placeClassification">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:place">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                        <sch:rule context="lido:recordType">
                           <sch:extends rule="sch_SKOS"/>
                        </sch:rule>
                     </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                        <sch:rule context="lido:recordSource">
                           <sch:extends rule="sch_OWL"/>
                        </sch:rule>
                     </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                        <sch:rule context="lido:collection">
                           <sch:extends rule="sch_collection"/>
                        </sch:rule>
                     </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:relatedEventRelType">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:relatedWorkRelType">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:repositoryName">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:repositoryLocation">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:resourceType">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:resourceRelType">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:resourcePerspective">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:resourceSource">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:rightsType">
                        <sch:extends rule="sch_SKOS"/>
                        <sch:extends rule="sch_rightsType_type"/>
                        <sch:extends rule="sch_rightsType"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:rightsHolder">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:extentConcept">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:subjectConcept">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <pattern xmlns="http://www.lido-schema.org/lidoProfile/">
               <rule context="lido:lido">
                  <assert test="lido:administrativeMetadata/lido:recordWrap/lido:recordID">LIDO requires each record to have a local Record Identifier</assert>
                  <assert test="lido:administrativeMetadata/lido:recordWrap/lido:recordInfoSet[@lido:type='http://terminology.lido-schema.org/lido00470']/lido:recordMetadataDate[@lido:type='http://terminology.lido-schema.org/lido00472']">The export date/time stamp must be included.</assert>
                  <assert test="lido:administrativeMetadata/lido:recordWrap/lido:recordType">LIDO requires each record to have a Record Type</assert>
                  <assert test="count(lido:applicationProfile)=1">The application profile must be specified.</assert>
                  <assert test="count(lido:descriptiveMetadata)=1">Exactly one descriptiveMetadata element must be specified.</assert>
                  <assert test="count(lido:descriptiveMetadata/lido:objectClassificationWrap/lido:objectWorkTypeWrap/lido:objectWorkType/lido:term) &gt; 0">At least one object/work type keyword (term) must be specified.</assert>
                  <assert test="count(lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:descriptionWrap/lido:descriptionSet/lido:descriptiveNoteValue[@lido:label='brief description']) &lt; 2">No more than one brief description should be specified</assert>
                  <assert test="count(lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:repositoryWrap/lido:repositorySet/lido:repositoryName/lido:legalBodyName/lido:appellationValue) = 1">Exactly one lender must be specified.</assert>
                  <assert test="count(lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:repositoryWrap/lido:repositorySet/lido:workID)=1">An EODEM record for an object contains exactly one local identifier.</assert>
                  <assert test="count(lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:titleWrap/lido:titleSet/lido:appellationValue) &gt; 0">An EODEM record for an object must have a title/name.</assert>
                  <assert test="lido:lidoRecID[string(normalize-space(text()))]">LIDO requires each record to have a non-null Record Identifier</assert>
                  <assert test="count(lido:lidoRecID)=1">LIDO requires each record to have exactly one Record Identifier</assert>
                  <assert test="count(lido:objectPublishedID) &lt; 2">An EODEM object record contains at most one published identifier.</assert>
               </rule>
               <rule context="lido:appellationValue|lido:conceptID|lido:descriptiveNoteValue|lido:legalBodyID|lido:term|lido:workID">
                  <assert test="string(normalize-space(text()))">
                     <value-of select="name()"/> must have a non-empty value</assert>
               </rule>
               <rule context="lido:conceptID|lido:legalBodyID|lido:lidoRecID|lido:workID">
                  <assert test="@lido:type[.='http://terminology.lido-schema.org/lido00099' or .='http://terminology.lido-schema.org/lido00100' or .='http://terminology.lido-schema.org/lido00510']">The <value-of select="name()"/> type attribute must have a LIDO URL meaning 'iri', 'local_identifier' or 'uri'.</assert>
               </rule>
               <rule context="lido:actor">
                  <assert test="@lido:type[.='http://terminology.lido-schema.org/lido00163' or .='http://terminology.lido-schema.org/lido00542' or .='http://terminology.lido-schema.org/lido00165' or .='http://terminology.lido-schema.org/lido00166' or .='http://terminology.lido-schema.org/lido00413']">The actor type attribute must have a LIDO URL meaning 'groups_of_persons', 'family', 'organization' or 'person'.</assert>
                  <assert test="count(lido:nameActorSet/lido:appellationValue[@lido:label='display name' or @lido:label='sort name']) &gt; 0">A display name and/or sort name must be specified for each actor.</assert>
               </rule>
               <rule context="lido:applicationProfile">
                  <assert test=".='https://lido-schema.org/schema/v1.1/lido-v1.1-profile-EODEM-v1.0.xsd'">The EODEM application profile must be used</assert>
               </rule>
               <rule context="lido:measurementsSet">
                  <assert test="count(lido:measurementType)=1">Each measurement set must have exactly one type.</assert>
                  <assert test="count(lido:measurementUnit)=1">Each measurement set must have exactly one unit.</assert>
                  <assert test="count(lido:measurementValue)=1">Each measurement set must have exactly one value.</assert>
               </rule>
               <rule context="lido:objectMaterialsTechSet">
                  <assert test="count(lido:displayMaterialsTech|lido:materialsTech/lido:termMaterialsTech/lido:term) &gt; 0">Each Material group must contain Material Description and/or one or more Material Keywords.</assert>
               </rule>
               <rule context="lido:objectMeasurementsSet">
                  <assert test="count(lido:displayObjectMeasurements|lido:objectMeasurements) &gt; 0">Each measurement group must contain Measurement Text and/or Dimension Aspect Group.</assert>
               </rule>
               <rule context="lido:objectPublishedID">
                  <assert test="string(normalize-space(text()))">A published identifier must have a value.</assert>
                  <assert test="@lido:type='http://terminology.lido-schema.org/lido00099'">A published identifier @type must have the LIDO URL meaning 'uri' (http://terminology.lido-schema.org/lido00099)</assert>
               </rule>
               <rule context="@lido:pref">
                  <assert test=".='http://terminology.lido-schema.org/lido00169' or .='http://terminology.lido-schema.org/lido00170' or .='http://terminology.lido-schema.org/lido00426' or .='http://terminology.lido-schema.org/lido00526'">The pref attribute must have a LIDO URL meaning 'alternative', 'display', 'hidden' or 'preferred'.</assert>
               </rule>
               <rule context="lido:repositorySet">
                  <assert test="@lido:type[.='http://terminology.lido-schema.org/lido00475']">The EODEM repository type must be the LIDO URL for the current repository or location (http://terminology.lido-schema.org/lido00475)</assert>
               </rule>
               <rule context="lido:titleSet">
                  <assert test="@lido:type">Title sets must have a type specified.</assert>
                  <assert test="count(lido:appellationValue)=1">There should be exactly one title/name per titleSet element.</assert>
                  <assert test="lido:appellationValue/@xml:lang">The language of each title should be specified.</assert>
               </rule>
               <rule context="@lido:type">
                  <assert test="string(normalize-space(.))">A type attribute must have a value.</assert>
               </rule>
            </pattern>
         </sch:pattern>
  <sch:pattern xmlns:lido="http://www.lido-schema.org" xmlns:lido-qa="http://www.lido-schema.org/quality-assurance" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                <sch:title>Basic EODEM validation rules</sch:title>
                <sch:p>These rules are complementary to the derived EODEM XML Schema, and should be used in
                conjunction with it.</sch:p>
                
                <sch:rule abstract="true" id="eodem_nonempty">
                    <sch:assert test="string(.)" role="warn">
                        <sch:name/> should have a non-empty value.
                    </sch:assert>
                </sch:rule>
                <sch:rule abstract="true" id="eodem_applicationProfile">
                    <sch:assert test=".='EODEM version 1'" role="warn">
                        <sch:name/> must have the value 'EODEM version 1'.
                    </sch:assert>
                </sch:rule>
                <sch:rule abstract="true" id="eodem_objectPublishedID">
                    <sch:assert test="not(@type) or @type='http://terminology.lido-schema.org/lido00099'" role="warn">
                        If <sch:name/> has a type attribute, it must have value 'http://terminology.lido-schema.org/lido00099'.
                    </sch:assert>
                </sch:rule>
                <sch:rule abstract="true" id="eodem_identifier_type">
                    <sch:assert test="not(@type) or @type='http://terminology.lido-schema.org/lido00510'                              or @type='http://terminology.lido-schema.org/lido00100'                              or @type='http://terminology.lido-schema.org/lido00099'" role="warn">
                    </sch:assert>
                </sch:rule>
                <sch:rule abstract="true" id="eodem_term">
                    <sch:assert test="count(lido:term) &gt; 0" role="warn">
                        <sch:name/> should contain at least one lido:term element.
                    </sch:assert>
                </sch:rule>
            </sch:pattern>
  <sch:diagnostics/>
</sch:schema>
