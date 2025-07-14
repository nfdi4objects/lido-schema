<?xml version="1.0" standalone="yes"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" queryBinding="xslt2">
  <sch:title xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">Schematron constraints for LIDO Version 1.1</sch:title>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" uri="http://www.lido-schema.org" prefix="lido"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" uri="http://www.w3.org/2002/07/owl#" prefix="owl"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" uri="http://www.w3.org/2004/02/skos/core#" prefix="skos"/>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
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
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>conceptComplexType allows only skos:Concept from SKOS namespace</sch:title>
				<sch:p>Asserts that only skos:Concept and not any other class from the SKOS namespace is used for 
					statements about a LIDO element based on <tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>.</sch:p>

				<sch:rule abstract="true" id="sch_SKOS">
					<sch:assert role="fatal" test="not(skos:*[not(self::skos:Concept)])">
						Only skos:Concept should be used as embedded class in <sch:name/> from the SKOS namespace.
					</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>skos:Concept allows only SKOS properties</sch:title>
				<sch:p>Asserts that only properties in the domain or range of the skos:Concept 
					Class are used for statements about a LIDO sub-element of <tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>.</sch:p>

				<sch:rule context="skos:Concept" id="sch_SKOS_properties">
					<sch:report role="fatal" test="child::*[namespace-uri() != 'http://www.w3.org/2004/02/skos/core#']">
						Only SKOS properties in the domain or range of the skos:Concept Class are allowed.
					</sch:report>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
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
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
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
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
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
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>lido:collection must contain lido:objectName</sch:title>
				<sch:p>Asserts that lido:collection contains at least lido:object/lido:objectName.</sch:p>
				<sch:rule abstract="true" id="sch_collection">
					<sch:assert role="fatal" test="lido:object/lido:objectName">
						lido:collection must contain lido:object/lido:objectName.
					</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:nationalityActor">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:vitalPlaceActor">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:genderActor">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:actor">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:roleActor">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:attributionQualifierActor">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:extentActor">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:actor">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:classification">
									<sch:extends rule="sch_SKOS"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:eventType">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:roleInEvent">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:culture">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:periodName">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:eventMethod">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:category">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:termMaterialsTech">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:extentMaterialsTech">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:measurementType">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:measurementUnit">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:extentMeasurements">
								<sch:extends rule="sch_MixedContent"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:qualifierMeasurements">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:formatMeasurements">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:shapeMeasurements">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:scaleMeasurements">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:object">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:objectWorkType">
									<sch:extends rule="sch_SKOS"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:partOfPlace">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:placeClassification">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:place">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:recordType">
									<sch:extends rule="sch_SKOS"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:recordSource">
									<sch:extends rule="sch_OWL"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:collection">
									<sch:extends rule="sch_collection"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:relatedEventRelType">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:relatedWorkRelType">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:repositoryName">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:repositoryLocation">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:resourceType">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:resourceRelType">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:resourcePerspective">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:resourceSource">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:rightsType">
								<sch:extends rule="sch_SKOS"/>
								<sch:extends rule="sch_rightsType_type"/>
								<sch:extends rule="sch_rightsType"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:rightsHolder">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:extentConcept">
								<sch:extends rule="sch_MixedContent"/>
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:subjectConcept">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:diagnostics/>
</sch:schema>
