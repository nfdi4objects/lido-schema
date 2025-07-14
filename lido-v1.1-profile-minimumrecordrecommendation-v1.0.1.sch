<?xml version="1.0" standalone="yes"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" queryBinding="xslt2">
  <sch:title xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">Schematron constraints for LIDO Version 1.1</sch:title>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" uri="http://www.lido-schema.org" prefix="lido"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" uri="http://www.w3.org/2002/07/owl#" prefix="owl"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" uri="http://www.w3.org/2004/02/skos/core#" prefix="skos"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" uri="http://www.w3.org/1999/02/22-rdf-syntax-ns#" prefix="rdf"/>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
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
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>conceptComplexType allows only skos:Concept from SKOS namespace</sch:title>
            <sch:p>Asserts that only skos:Concept and not any other class from the SKOS namespace is used for 
					statements about a LIDO element based on <tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>.</sch:p>
            <sch:rule abstract="true" id="sch_SKOS">
               <sch:assert role="fatal" test="not(skos:*[not(self::skos:Concept)])">
						Only skos:Concept should be used as embedded class in <sch:name/> from the SKOS namespace.
					</sch:assert>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>skos:Concept allows only SKOS properties</sch:title>
            <sch:p>Asserts that only properties in the domain or range of the skos:Concept 
					Class are used for statements about a LIDO sub-element of <tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>.</sch:p>
            <sch:rule context="skos:Concept" id="sch_SKOS_properties">
               <sch:report role="fatal" test="child::*[namespace-uri() != 'http://www.w3.org/2004/02/skos/core#']">
						Only SKOS properties in the domain or range of the skos:Concept Class are allowed.
					</sch:report>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
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
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
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
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
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
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:title>lido:collection must contain lido:objectName</sch:title>
            <sch:p>Asserts that lido:collection contains at least lido:object/lido:objectName.</sch:p>
            <sch:rule abstract="true" id="sch_collection">
               <sch:assert role="fatal" test="lido:object/lido:objectName">
						lido:collection must contain lido:object/lido:objectName.
					</sch:assert>
            </sch:rule>
         </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:nationalityActor">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:vitalPlaceActor">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:genderActor">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:actor">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:roleActor">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:attributionQualifierActor">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:extentActor">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:actor">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                        <sch:rule context="lido:classification">
                           <sch:extends rule="sch_SKOS"/>
                        </sch:rule>
                     </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:eventType">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:roleInEvent">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:culture">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:periodName">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:eventMethod">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:category">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:termMaterialsTech">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:extentMaterialsTech">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:measurementType">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:measurementUnit">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:extentMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:qualifierMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:formatMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:shapeMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:scaleMeasurements">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:object">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                        <sch:rule context="lido:objectWorkType">
                           <sch:extends rule="sch_SKOS"/>
                        </sch:rule>
                     </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:partOfPlace">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:placeClassification">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:place">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                        <sch:rule context="lido:recordType">
                           <sch:extends rule="sch_SKOS"/>
                        </sch:rule>
                     </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                        <sch:rule context="lido:recordSource">
                           <sch:extends rule="sch_OWL"/>
                        </sch:rule>
                     </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                        <sch:rule context="lido:collection">
                           <sch:extends rule="sch_collection"/>
                        </sch:rule>
                     </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:relatedEventRelType">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:relatedWorkRelType">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:repositoryName">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:repositoryLocation">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:resourceRelType">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:resourcePerspective">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:resourceSource">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:rightsType">
                        <sch:extends rule="sch_SKOS"/>
                        <sch:extends rule="sch_rightsType_type"/>
                        <sch:extends rule="sch_rightsType"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:rightsHolder">
                        <sch:extends rule="sch_OWL"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:extentConcept">
                        <sch:extends rule="sch_MixedContent"/>
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
                     <sch:rule context="lido:subjectConcept">
                        <sch:extends rule="sch_SKOS"/>
                     </sch:rule>
                  </sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0">
            <sch:rule context="lido:lido" role="warn">
               <sch:assert test="lido:descriptiveMetadata/lido:objectClassificationWrap/lido:objectWorkTypeWrap/lido:objectWorkType/skos:Concept"> mds0002: objectWorkType should prefer an URI from a controlled
							vocabulary.</sch:assert>
               <sch:assert test="lido:descriptiveMetadata/lido:objectClassificationWrap/lido:classificationWrap/lido:classification[count(lido:conceptID|skos:Concept) &gt; 0]"> mds0003: A classification is recommended.</sch:assert>
               <sch:assert test="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:objectDescriptionWrap/lido:objectDescriptionSet/lido:descriptiveNoteValue"> mds0005: A description is recommended.</sch:assert>
               <sch:assert test="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:objectMaterialsTechWrap/lido:objectMaterialsTechSet/lido:materialsTech/lido:termMaterialsTech[@lido:type='http://terminology.lido-schema.org/lido00132'][lido:conceptID|skos:Concept] or        lido:descriptiveMetadata/lido:eventWrap/lido:eventSet/lido:event/lido:eventMaterialsTech/lido:materialsTech/lido:termMaterialsTech[@lido:type='http://terminology.lido-schema.org/lido00132'][lido:conceptID|skos:Concept]"> mds0006: Use of information from controlled ocabulary about materials utilized is
							recommended.</sch:assert>
               <sch:assert test="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:objectMaterialsTechWrap/lido:objectMaterialsTechSet/lido:materialsTech/lido:termMaterialsTech[@lido:type='http://terminology.lido-schema.org/lido00131'][lido:conceptID|skos:Concept] or        lido:descriptiveMetadata/lido:eventWrap/lido:eventSet/lido:event/lido:eventMaterialsTech/lido:materialsTech/lido:termMaterialsTech[@lido:type='http://terminology.lido-schema.org/lido00131'][lido:conceptID|skos:Concept]"> mds0007: Use of information from controlled ocabulary about techniques employed is
							recommended.</sch:assert>
               <sch:assert test="lido:descriptiveMetadata/lido:objectIdentificationWrap/lido:objectMeasurementsWrap/lido:objectMeasurementsSet or        lido:descriptiveMetadata/lido:eventWrap/lido:eventSet/lido:event/lido:eventMeasurements"> mds0008: Measurements are recommended.</sch:assert>
               <sch:assert test="lido:descriptiveMetadata/lido:objectRelationWrap/lido:subjectWrap/lido:subjectSet/lido:subject/lido:subjectConcept[lido:conceptID|skos:Concept]"> mds0013: Subject headings (concepts) are recommended.</sch:assert>
               <sch:assert test="lido:administrativeMetadata/lido:recordWrap/lido:recordInfoSet[@lido:type='http://terminology.lido-schema.org/lido00470']/lido:recordMetadataDate[@lido:type='http://terminology.lido-schema.org/lido00472']"> mds0026: An export date/time stamp is recommended.</sch:assert>
               <sch:assert test="lido:administrativeMetadata/lido:recordWrap/lido:recordInfoSet/lido:recordInfoLink"> mds0025: Link to record (recordInfoLink) recommended.</sch:assert>
               <sch:assert test="lido:lidoRecID[string(normalize-space(text()))] and lido:administrativeMetadata/lido:recordWrap/lido:recordID[string(normalize-space(text()))]" role="fatal"> mds0018: Each record has to have non-null lidoRecID and recordID Identifiers.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:titleSet" role="error">
               <sch:assert test="lido:appellationValue[string(normalize-space(text()))]"> mds0001: A object title or appellation is required.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:objectWorkType" role="warn">
               <sch:assert test="matches(skos:Concept/@rdf:about, '^http.?://(w{3}\.)?([\w-]+\.)+(\w{2})(/[\w\.-]+)*')"> mds0002: Use of URI in objectWorkType is strongly
							recommended.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:repositorySet[@lido:type='http://terminology.lido-schema.org/lido00475' or @lido:type='http://terminology.lido-schema.org/lido01017']" role="fatal">
               <sch:assert test="lido:workID"> mds0004: A current repository work id is
							required.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:objectDescriptionSet" role="warn">
               <sch:assert test="lido:objectDescriptionRights"> mds0005: A
							rightsDescription for an objectDescription is recommended. </sch:assert>
            </sch:rule>
            <sch:rule context="lido:eventObjectMeasurements|lido:objectMeasurementSet" role="warn">
               <sch:assert test="lido:objectMeasurements/lido:measurementsSet"> mds0008:
							Full measurement information is recommended.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:objectMeasurements/lido:measurementsSet/lido:measurementUnit" role="warn">
               <sch:assert test="skos:Concept"> mds0008: skos:Concept is preferred for
							measurement units.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:objectMeasurements/lido:measurementsSet/lido:measurementValue" role="fatal">
               <sch:assert test="matches(., '^[0-9]*[.,]?[0-9]*$')"> mds0008: Use only
							(decimal) numbers.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:subjectSet/lido:subject" role="warn">
               <sch:assert test="count(lido:subjectConcept) &lt; 2"> mds0013: Use of only one
							subjectConcept per subjectSet recommended.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:subjectConcept/skos:Concept/@rdf:about" role="fatal">
               <sch:assert test=". != //lido:objectWorkType/skos:Concept/@rdf:about">
							mds0013: Use only concepts/subject headings that are disctinct from
							objectWorkType.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:actorInRole" role="warn">
               <sch:assert test="lido:actor/lido:actorID"> mds0010: It is recommended to
							provide an identifier for <sch:name/>.</sch:assert>
               <sch:assert test="lido:roleActor"> mds0010: It is recommended to provide
							information about the role for <sch:name/>.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:eventDate/lido:date" role="fatal">
               <sch:assert test="matches(lido:earliestDate, '^([&#x2212;\-])?\d{4,}(-\d\d(-\d\d(T\d\d:\d\d(:\d\d)?(\.\d+)?(([+-]\d\d:\d\d)|Z)?)?)?)?$')"> mds0011: It is recommended to use an ISO date format for <sch:name/>. </sch:assert>
               <sch:assert test="matches(lido:latestDate, '^([&#x2212;\-])?\d{4,}(-\d\d(-\d\d(T\d\d:\d\d(:\d\d)?(\.\d+)?(([+-]\d\d:\d\d)|Z)?)?)?)?$')"> mds0011: It is recommended to use an ISO date format for <sch:name/>.
						</sch:assert>
            </sch:rule>
            <sch:rule context="lido:event" role="fatal">
               <sch:assert test="lido:eventType"> mds0009: It is required to provide an
							event type for <sch:name/> via lido:eventType. LIDO terminology is recommended.</sch:assert>
               <sch:assert test="lido:eventActor or lido:eventDate or lido:eventPlace">
							mds0010: Each event has to have at least either an eventActor, an
							eventDate or an eventPlace.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:event/lido:eventType/skos:Concept" role="fatal">
               <sch:assert test="starts-with(@rdf:about, 'http://terminology.lido-schema.org/lido')" role="warn"> mds0009: EventType should use lido
							terminology.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:eventPlace/lido:place" role="warn">
               <sch:assert test="lido:placeID and lido:namePlaceSet"> mds0012: Providing
							both an identifier and a name for a place is recommended for
							<sch:name/>.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:resourceSet">
               <sch:assert test="lido:resourceDescription" role="warn"> mds0017: A
							resourceDescription (alt-text) is recommended.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:rightsResource/lido:rightsType" role="warn">
               <sch:assert test="@lido:type='http://terminology.lido-schema.org/lido00921'"> mds0015: RightsResource statement type should be specific
							(http://terminology.lido-schema.org/lido00921).</sch:assert>
            </sch:rule>
            <sch:rule context="lido:rightsResource[lido:rightsType/skos:Concept[@rdf:about='http://creativecommons.org/publicdomain/mark/1.0/']]" role="fatal">
               <sch:assert test="count(lido:rightsHolder)=0"> mds0016: There should be no
							rightsHolder for public domain material.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:rightsResource[lido:rightsType/skos:Concept[@rdf:about!='http://creativecommons.org/publicdomain/mark/1.0/']]" role="fatal">
               <sch:assert test="count(lido:rightsHolder) &gt; 0"> mds0016: RightsHolder
							mandatory for non public domain material even if not known.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:recordWrap/skos:Concept" role="fatal">
               <sch:assert test="@rdf:about[.='http://terminology.lido-schema.org/lido00141' or .='http://terminology.lido-schema.org/lido00453' or       .='http://terminology.lido-schema.org/lido01021' or .='http://terminology.lido-schema.org/lido00447']"> mds0020: recordType must be either item, component, conceptual or
							group level record type.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:classification" role="warn">
               <sch:assert test="starts-with(@lido:type, 'http://terminology.lido-schema.org/lido')"> mds0003: <sch:name/> @type should use lido terminology. </sch:assert>
            </sch:rule>
            <sch:rule context="lido:repositorySet/lido:repositoryName">
               <sch:assert test="count(lido:legalBodyID[@lido:type='http://terminology.lido-schema.org/lido00099']) &gt; 0" role="fatal"> mds0021: A repository ID (URI) is required.</sch:assert>
               <sch:assert test="lido:legalBodyName" role="warn"> mds0021: A name for the
							repository is recommended.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:repositoryWrap">
               <sch:assert test="count(lido:repositorySet) &gt; 0" role="fatal"> mds0021:
							At least one repository set required.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:recordSource">
               <sch:assert test="lido:legalBodyID[string(normalize-space(text())) and @lido:type='http://terminology.lido-schema.org/lido00099']">
							mds0022: Identifier for data source of record required.</sch:assert>
            </sch:rule>
            <sch:rule context="lido:metaDataDate" role="fatal">
               <sch:assert test="matches(., '^\d{4}(-\d\d(-\d\d(T\d\d:\d\d(:\d\d)?(\.\d+)?(([+-]\d\d:\d\d)|Z)?)?)?)?$')"> mds0026: Must use an ISO date format for <sch:name/>. </sch:assert>
            </sch:rule>
            <rule xmlns="http://www.lido-schema.org/lidoProfile/" context="lido:titleSet">
               <assert test="@lido:type">Title sets should have @lido:type specified.</assert>
               <assert test="lido:appellationValue/@xml:lang">The language of each title
							should be specified.</assert>
            </rule>
         </sch:pattern>
  <sch:diagnostics/>
</sch:schema>
