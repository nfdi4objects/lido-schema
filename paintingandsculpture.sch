<?xml version="1.0" standalone="yes"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xs="http://www.w3.org/2001/XMLSchema" queryBinding="xslt2">
  <sch:title xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">Schematron constraints for LIDO Version 1.1</sch:title>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" uri="http://www.lido-schema.org" prefix="lido"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" uri="http://www.w3.org/2002/07/owl#" prefix="owl"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" uri="http://www.w3.org/2004/02/skos/core#" prefix="skos"/>
  <sch:ns xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#" uri="http://www.w3.org/1999/02/22-rdf-syntax-ns#" prefix="rdf"/>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Either free text or index element</sch:title>
				<sch:p>
In LIDO v1.1 some text elements are extended to
<tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>
in order to foster controlled indexing in the future. To enable backwards compatibility either elements of
<tei:ref target="#textComplexType">textComplexType</tei:ref>
or elements of
<tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>
are allowed. Note that the elements are defined to be mutually exclusive.
</sch:p>
				<sch:rule abstract="true" id="sch_MixedContent">
					<sch:assert role="fatal" test=" (skos:Concept or lido:conceptID or lido:term) and not(text()[not(normalize-space(.) = '')] or @xml:lang or @lido:encodinganalog or @lido:label) or (text()[normalize-space(.) != ''] and not(skos:Concept or lido:conceptID or lido:term)) or (not(*) and (not(text()) or normalize-space(.) = '')) ">
Asserts that either an element based on
<tei:ref target="#textComplexType">textComplexType</tei:ref>
or an element based on
<tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>
is used for
<sch:name/>
, but not both at the same time.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>conceptComplexType allows only skos:Concept from SKOS namespace</sch:title>
				<sch:p>
Asserts that only skos:Concept and not any other class from the SKOS namespace is used for statements about a LIDO element based on
<tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>
.
</sch:p>
				<sch:rule abstract="true" id="sch_SKOS">
					<sch:assert role="fatal" test="not(skos:*[not(self::skos:Concept)])">
Only skos:Concept should be used as embedded class in
<sch:name/>
from the SKOS namespace.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>skos:Concept allows only SKOS properties</sch:title>
				<sch:p>
Asserts that only properties in the domain or range of the skos:Concept Class are used for statements about a LIDO sub-element of
<tei:ref target="#conceptComplexType">conceptComplexType</tei:ref>
.
</sch:p>
				<sch:rule context="skos:Concept" id="sch_SKOS_properties">
					<sch:report role="fatal" test="child::*[namespace-uri() != 'http://www.w3.org/2004/02/skos/core#']"> Only SKOS properties in the domain or range of the skos:Concept Class are allowed. </sch:report>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>ComplexType allows only owl:sameAs from OWL namespace</sch:title>
				<sch:p>
Asserts that only owl:sameAs and not any other property or class from the OWL namespace is used to state identity equivalence in instances of LIDO elements contained in
<tei:ref target="#actorComplexType">actorComplexType</tei:ref>
,
<tei:ref target="#eventComplexType">eventComplexType</tei:ref>
,
<tei:ref target="#legalBodyRefComplexType">legalBodyRefComplexType</tei:ref>
,
<tei:ref target="#objectComplexType">objectComplexType</tei:ref>
,
<tei:ref target="#placeComplexType">placeComplexType</tei:ref>
,
<tei:ref target="#rightsHolderComplexType">rightsHolderComplexType</tei:ref>
.
</sch:p>
				<sch:rule abstract="true" id="sch_OWL">
					<sch:assert role="fatal" test="not(owl:*[not(self::owl:sameAs)])">
Only owl:sameAs should be used as embedded property of
<sch:name/>
from the OWL namespace.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Values for rightsType@type</sch:title>
				<sch:p>
A LIDO
<tei:ref target="#rightsType">rightsType</tei:ref>
element can either hold the type attribute 'generic' or 'specific', respectively. Since a generic rights type and a specific rights or license statement fall into different logical categories, these types are mutually exclucive.
</sch:p>
				<sch:rule abstract="true" id="sch_rightsType">
					<sch:let name="type" value="@lido:type"/>
					<sch:let name="sibling_type" value="following-sibling::lido:rightsType[@lido:type]"/>
					<sch:assert role="fatal" test=" @lido:type = 'http://terminology.lido-schema.org/lido00920' and not(preceding-sibling::lido:rightsType[@lido:type = 'http://terminology.lido-schema.org/lido00921']) or @lido:type = 'http://terminology.lido-schema.org/lido00921' and not(preceding-sibling::lido:rightsType[@lido:type = 'http://terminology.lido-schema.org/lido00920']) or count(parent::*/lido:rightsType) = 1 and not(@lido:type) ">
						<sch:value-of select="name(parent::*)"/>
can either hold a specific or a generic lido:rightsType@lido:type (mutually exclusive). If lido:rightsType@lido:type is used in
<sch:value-of select="name(parent::*)"/>
, it must be used in all
<sch:value-of select="name(parent::*)"/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Possible values for lido:rightsType@lido:type</sch:title>
				<sch:p>
In LIDO v1.1 a type attribute is introduced for the LIDO
<tei:ref target="#rightsType">rightsType</tei:ref>
element in order to discern generic rights and specific ones. This rule asserts that only the URIs for these two types of rights are used when the type attribte is set.
</sch:p>
				<sch:rule abstract="true" id="sch_rightsType_type">
					<sch:assert role="warn" test="(@lido:type = 'http://terminology.lido-schema.org/lido00920' or @lido:type = 'http://terminology.lido-schema.org/lido00921') or not(@lido:type)"> @lido:type can either be omitted or must hold one of the following URIs: http://terminology.lido-schema.org/lido00920, http://terminology.lido-schema.org/lido00921. </sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>lido:collection must contain lido:objectName</sch:title>
				<sch:p>Asserts that lido:collection contains at least lido:object/lido:objectName.</sch:p>
				<sch:rule abstract="true" id="sch_collection">
					<sch:assert role="fatal" test="lido:object/lido:objectName"> lido:collection must contain lido:object/lido:objectName. </sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Use lido:objectPublishedID</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Asserts that at least one lido:objectPublishedID is given to allow for automatic referencing.</sch:p>
				<sch:rule abstract="true" id="hps_objectPublishedID">
					<sch:assert test="count(child::lido:objectPublishedID) gt 0" role="caution"> To allow for automatic referencing, at least one lido:objectPublishedID should be given. </sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:objectWorkType/@lido:type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>This rule asserts that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_objectWorkType_type">
					<sch:assert test="@lido:type[. = ('http://terminology.lido-schema.org/lido00789', 'http://terminology.lido-schema.org/lido00767', 'http://terminology.lido-schema.org/lido00766', 'http://terminology.lido-schema.org/lido00934', 'http://terminology.lido-schema.org/lido00768')]" role="info">
Use of LIDO terminology is recommended for for
<sch:name/>
/@type.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Use URIs for concepts</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that concepts refer to URIs of a controlled vocabulary.</sch:p>
				<sch:rule abstract="true" id="hps_controlledVocabulary">
					<sch:assert test="child::skos:Concept[@rdf:about] or child::lido:conceptID" role="caution">
						<sch:name/>
should be a valid URI referring to a controlled vocabulary.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:titleSet/@lido:type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_titleSet_type">
					<sch:assert test="@lido:type[. = ('http://vocab.getty.edu/aat/300417200', 'http://vocab.getty.edu/aat/300417194', 'http://vocab.getty.edu/aat/300417199', 'http://vocab.getty.edu/aat/300417205', 'http://vocab.getty.edu/aat/300417201', 'http://vocab.getty.edu/aat/300417202', 'http://vocab.getty.edu/aat/300417204', 'http://vocab.getty.edu/aat/300417206', 'http://vocab.getty.edu/aat/300417214', 'http://vocab.getty.edu/aat/300417203', 'http://vocab.getty.edu/aat/300417208', 'http://vocab.getty.edu/aat/300417210', 'http://vocab.getty.edu/aat/300417227', 'http://vocab.getty.edu/aat/300417226', 'http://vocab.getty.edu/aat/300417228', 'http://vocab.getty.edu/aat/300312006')]" role="info">
See the handbook for recommended values of
<sch:name/>
/@type.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:repositorySet/@lido:type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_repositorySet_type">
					<sch:assert test="@lido:type[. = ('http://terminology.lido-schema.org/lido00475', 'http://terminology.lido-schema.org/lido01017', 'http://terminology.lido-schema.org/lido00476', 'http://terminology.lido-schema.org/lido01019')]" role="info">
See the handbook for recommended values of
<sch:name/>
/@type.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Identify current repository by ID</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that the current repository, if known, is identified by an ID.</sch:p>
				<sch:rule abstract="true" id="hps_legalBodyID">
					<sch:assert test="child::lido:legalBodyID" role="caution"> If the current repository is known, lido:legalBodyID should be given. </sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>URI validator</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that the given node contains a valid URI.</sch:p>
				<sch:rule abstract="true" id="hps_URI">
					<sch:assert test="matches(., '(http(s)?://)?(w{3}\.)?([\w-]+\.)+(\w{2,})(/[\w\.-]+)*')" role="caution">
						<sch:name/>
should contain a valid URI.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide current inventory number</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that the current inventory number is given if the current repository is known.</sch:p>
				<sch:rule abstract="true" id="hps_workID">
					<sch:assert test="parent::*/child::lido:workID" role="caution"> If the current repository is known, lido:workID should be given. </sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Identify current inventory number as such</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that the current inventory number is identified as such by lido:workID/@lido:type, if possible.</sch:p>
				<sch:rule abstract="true" id="hps_workID_type">
					<sch:let name="current" value="parent::lido:repositorySet[@lido:type='http://terminology.lido-schema.org/lido01017']"/>
					<sch:assert test="not($current) or @lido:type = 'http://terminology.lido-schema.org/lido00113'" role="caution">
If the current repository is known,
<sch:name/>
/@type should be http://terminology.lido-schema.org/lido00113.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide a source for lido:displayEdition</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that lido:displayEdition has a sibling lido:sourceStateEdition, identifying a source for the content of the former.</sch:p>
				<sch:rule abstract="true" id="hps_displayEdition">
					<sch:assert test="parent::*/child::lido:sourceStateEdition" role="info">
When providing
<sch:name/>
, lido:sourceStateEdition should be given.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:objectDescriptionSet/@lido:tyle</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_objectDescriptionSet_type">
					<sch:assert test="@lido:type[. = ('http://terminology.lido-schema.org/lido00268', 'http://terminology.lido-schema.org/lido01114', 'http://terminology.lido-schema.org/lido01115', 'http://terminology.lido-schema.org/lido01113')]" role="info">
Refer to the handbook for recommended values of
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:objectMeasurementsSet/@lido:type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_objectMeasurementsSet_type">
					<sch:assert test="@lido:type[. = ('http://terminology.lido-schema.org/lido00927', 'http://terminology.lido-schema.org/lido00923')]" role="info">
Use of http://terminology.lido-schema.org/lido00923 or http://terminology.lido-schema.org/lido00927 as values for
<sch:name/>
/@type is recommended.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide measurements</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that at least one complete set of measurements is given for an object.</sch:p>
				<sch:rule abstract="true" id="hps_objectMeasurementsSet">
					<sch:assert test="/node()" role="caution">
At least one complete
<sch:name/>
should be given.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:termMaterialsTech/@lido:type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_termMaterialsTech_type">
					<sch:assert test="@lido:type[. = ('http://terminology.lido-schema.org/lido00132', 'http://terminology.lido-schema.org/lido00513', 'http://terminology.lido-schema.org/lido00514', 'http://terminology.lido-schema.org/lido00131', 'http://terminology.lido-schema.org/lido00248')]" role="info">
Refer to the handbook for recommended values of
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:eventType/@lido:type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_eventType_type">
					<sch:let name="values" value="('http://terminology.lido-schema.org/lido00226', 'http://terminology.lido-schema.org/lido00007', 'http://terminology.lido-schema.org/lido00224', 'http://terminology.lido-schema.org/lido01096', 'http://terminology.lido-schema.org/lido00006', 'http://terminology.lido-schema.org/lido00225', 'http://terminology.lido-schema.org/lido00931', 'http://terminology.lido-schema.org/lido00024', 'http://terminology.lido-schema.org/lido00034', 'http://terminology.lido-schema.org/lido00402', 'http://terminology.lido-schema.org/lido00026', 'http://terminology.lido-schema.org/lido00003', 'http://terminology.lido-schema.org/lido00001', 'http://terminology.lido-schema.org/lido00005', 'http://terminology.lido-schema.org/lido00009')"/>
					<sch:assert test="child::skos:Concept/@rdf:about[. = $values] or child::lido:conceptID/text()[. = $values]" role="info">
Refer to the handbook for recommended terminology values of
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:actor/@lido:type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_actor_type">
					<sch:assert test="@lido:type[. = ('http://terminology.lido-schema.org/lido00163', 'http://terminology.lido-schema.org/lido00413', 'http://terminology.lido-schema.org/lido00542')]" role="info">
Refer to the handbook for recommended values of
<sch:name/>
/@type.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide at least one participating actor for an event</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that at least one participating actor is provided for any lido:event, if possible.</sch:p>
				<sch:rule abstract="true" id="hps_event">
					<sch:assert test="child::lido:eventActor" role="info">
It is recommended to provide an eventActor for
<sch:name/>
, if possible.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>ISO Date validator</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that the given node contains a valid ISO date.</sch:p>
				<sch:rule abstract="true" id="hps_ISODate">
					<sch:assert test="matches(., '\d{4}(-\d\d(-\d\d(T\d\d:\d\d(:\d\d)?(\.\d+)?(([+-]\d\d:\d\d)|Z)?)?)?)?')" role="caution">
It is recommended to use an ISO date format for
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide a role for actors</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that each actor is identified by their role.</sch:p>
				<sch:rule abstract="true" id="hps_roleActor">
					<sch:assert test="child::lido:roleActor" role="info">
It is recommended to provide roleActor for
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide a source for actor roles</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that a source for the attribution of a role to an actor is provided.</sch:p>
				<sch:rule abstract="true" id="hps_sourceActorInRole">
					<sch:assert test="following-sibling::lido:sourceActorInRole" role="info">
It is recommended to provide sourceActorInRole with
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide an event type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that an event is identified by its type.</sch:p>
				<sch:rule abstract="true" id="hps_eventType">
					<sch:assert test="descendant::lido:eventType" role="caution">
An element lido:eventType is required for
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide an event date</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that a date is provided for an event.</sch:p>
				<sch:rule abstract="true" id="hps_eventDate">
					<sch:assert test="descendant::lido:eventDate" role="info">
A date should be provided for
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide an event place</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that a place is provided for an event.</sch:p>
				<sch:rule abstract="true" id="hps_eventPlace">
					<sch:assert test="descendant::lido:eventPlace" role="info">
At least one place should be provided for
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide @lido:type for lido:eventDescriptionSet</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that an eventDescriptionSet is classified by @lido:type.</sch:p>
				<sch:rule abstract="true" id="hps_eventDescriptionSet_type">
					<sch:assert test="@lido:type" role="info">
It is recommended to provide @type for
<sch:name/>
. Refer to the handbook for suggested values.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide @lido:type for lido:subject</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that a subject is classified by @lido:type.</sch:p>
				<sch:rule abstract="true" id="hps_subject_type">
					<sch:assert test="@lido:type" role="info">
It is recommended to provide @type for
<sch:name/>
. Refer to the handbook for suggested values.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:rightsType/@lido:type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_rightsType_type">
					<sch:assert test="@lido:type[. = ('http://terminology.lido-schema.org/lido00920', 'http://terminology.lido-schema.org/lido00921')]" role="caution">
						<sch:name/>
/@type should either be 'http://terminology.lido-schema.org/lido00920' or 'http://terminology.lido-schema.org/lido00921'.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Use LIDO terminology for concepts</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that concepts are referenced via LIDO terminology.</sch:p>
				<sch:rule abstract="true" id="hps_SKOS_rdf">
					<sch:assert test="matches(child::skos:Concept/@rdf:about, 'terminology\.lido') or matches(child::lido:conceptID, 'terminology\.lido')" role="caution">
Use of LIDO terminology is recommended for
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Recommended values for lido:recordMetadataDate/@lido:type</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that one of the values recommended for this attribute is used.</sch:p>
				<sch:rule abstract="true" id="hps_recordMetadataDate_type">
					<sch:assert test="@lido:type[. = ('http://terminology.lido-schema.org/lido00472', 'http://terminology.lido-schema.org/lido00473')]" role="caution">
						<sch:name/>
should be either 'http://terminology.lido-schema.org/lido00472' or 'http://terminology.lido-schema.org/lido00473'.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide representations for display and preview purposes</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that each representation of a resource is provided in a display (high quality) and preview (compressed) version.</sch:p>
				<sch:rule abstract="true" id="hps_resourceRepresentationCount">
					<sch:assert test="count(child::lido:resourceRepresentation[@lido:type = 'http://terminology.lido-schema.org/lido00451']) eq 1 and count(child::lido:resourceRepresentation[@lido:type = 'http://terminology.lido-schema.org/lido00464']) eq 1" role="info">
It is recommended to provide two representations per
<sch:name/>
: one in high quality, one in lower quality as a preview. These should be marked as such via
<sch:name/>
/@lido:type.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Provide complete legal information on a resource</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that a resource's rights and rights holders are identified.</sch:p>
				<sch:rule abstract="true" id="hps_resourceSet_rightsType">
					<sch:assert test="./lido:rightsResource[lido:rightsType][lido:rightsHolder]" role="caution"> The rights for provided resources should be provided. </sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Identify the internet media type of a resource</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that the internet media type of a resource is identified via @lido:formatResource.</sch:p>
				<sch:rule abstract="true" id="hps_linkResource_format">
					<sch:assert test="not(./@formatResource)" role="info">
Use of @lido:formatResource is recommended for
<sch:name/>
.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
				<sch:title>Identify preferred and alternative variants</sch:title>
				<sch:p>Schematron rule for the Handbook Painting and Sculpture.</sch:p>
				<sch:p>Assert that when variants of a node are provided for one language, the preferred as well as alternative variants are identified as such.</sch:p>
				<sch:p>An optional display value can be identified, should this deviate from the preferred variant.</sch:p>
				<sch:rule abstract="true" id="hps_pref">
					<sch:let name="current" value="current()"/>
					<sch:let name="currentName" value="$current/name()"/>
					<sch:let name="parent" value="$current/.."/>
					<sch:let name="lang" value="$current/@xml:lang/string()"/>
					<sch:let name="siblings" value="$parent/child::*[name(.) = $currentName and (@xml:lang/string() = $lang or not(@xml:lang or $current/@xml:lang))]"/>
					<sch:let name="alternatives" value="count($siblings) - 1"/>
					<sch:assert test="count($siblings[@lido:pref = 'http://terminology.lido-schema.org/lido00526']) lt 2">
Do not provide more than one display preference for
<sch:name/>
					</sch:assert>
					<sch:assert test="(count($siblings) eq 1 or count($siblings[@lido:pref = 'http://terminology.lido-schema.org/lido00169']) eq 1 and count($siblings[@lido:pref[. = ('http://terminology.lido-schema.org/lido00170', 'http://terminology.lido-schema.org/lido00526')]]) eq $alternatives)" role="caution">
When providing more than one
<sch:name/>
, the preferred and alternative variant(s) should be cleary marked as such via @pref.
</sch:assert>
				</sch:rule>
			</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:nationalityActor">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:vitalDatesActor">
								<sch:extends rule="hps_ISODate"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:vitalPlaceActor">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:genderActor">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:actor">
								<sch:extends rule="sch_OWL"/>
								<sch:extends rule="hps_actor_type"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:roleActor">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:attributionQualifierActor">
								<sch:extends rule="hps_sourceActorInRole"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:extentActor">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:actorInRole">
								<sch:extends rule="hps_roleActor"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:actor">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:appellationValue">
								<sch:extends rule="hps_pref"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:classification">
									<sch:extends rule="sch_SKOS"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:earliestDate">
								<sch:extends rule="hps_ISODate"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:latestDate">
								<sch:extends rule="hps_ISODate"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:displayEdition">
									<sch:extends rule="hps_displayEdition"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:eventType">
								<sch:extends rule="sch_SKOS"/>
								<sch:extends rule="hps_eventType_type"/>
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
							<sch:rule context="lido:eventDescriptionSet">
								<sch:extends rule="hps_eventDescriptionSet_type"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:event">
								<sch:extends rule="hps_event"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:eventSet">
									<sch:extends rule="hps_eventType"/>
									<sch:extends rule="hps_eventDate"/>
									<sch:extends rule="hps_eventPlace"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:legalBodyID">
								<sch:extends rule="hps_pref"/>
								<sch:extends rule="hps_URI"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:legalBodyWeblink">
								<sch:extends rule="hps_pref"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
					<sch:rule context="lido:lido">
						<sch:extends rule="hps_objectPublishedID"/>
					</sch:rule>
				</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:category">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:applicationProfile"/>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:termMaterialsTech">
								<sch:extends rule="hps_controlledVocabulary"/>
								<sch:extends rule="hps_termMaterialsTech_type"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:extentMaterialsTech">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:measurementType">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:measurementUnit">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:extentMeasurements"/>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:qualifierMeasurements">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:formatMeasurements">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:shapeMeasurements">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:scaleMeasurements">
								<sch:extends rule="sch_SKOS"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:object">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:objectWorkType">
									<sch:extends rule="sch_SKOS"/>
									<sch:extends rule="hps_controlledVocabulary"/>
									<sch:extends rule="hps_objectWorkType_type"/>
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
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:recordInfoID">
								<sch:extends rule="hps_URI"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:recordInfoLink"/>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:recordMetadataDate">
								<sch:extends rule="hps_ISODate"/>
								<sch:extends rule="hps_recordMetadataDate_type"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:recordID">
									<sch:extends rule="hps_pref"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:recordType">
									<sch:extends rule="sch_SKOS"/>
									<sch:extends rule="hps_SKOS_rdf"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
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
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:relatedWorkRelType">
								<sch:extends rule="hps_SKOS_rdf"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" context="lido:repositoryName">
								<sch:extends rule="hps_legalBodyID"/>
								<sch:extends rule="hps_workID"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:workID">
								<sch:extends rule="hps_workID_type"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:repositoryLocation">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:repositorySet">
								<sch:extends rule="hps_repositorySet_type"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
										<sch:rule context="lido:linkResource">
											<sch:extends rule="hps_pref"/>
											<sch:extends rule="hps_linkResource_format"/>
											<sch:extends rule="hps_URI"/>
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
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:resourceDateTaken">
								<sch:extends rule="hps_ISODate"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:resourceSource">
								<sch:extends rule="sch_OWL"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:resourceSet">
									<sch:extends rule="hps_resourceRepresentationCount"/>
									<sch:extends rule="hps_resourceSet_rightsType"/>
								</sch:rule>
							</sch:pattern>
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:rightsType">
								<sch:extends rule="sch_SKOS"/>
								<sch:extends rule="sch_rightsType_type"/>
								<sch:extends rule="sch_rightsType"/>
								<sch:extends rule="hps_rightsType_type"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:rightsDate">
								<sch:extends rule="hps_ISODate"/>
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
  <sch:pattern xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
							<sch:rule context="lido:subject">
								<sch:extends rule="hps_subject_type"/>
							</sch:rule>
						</sch:pattern>
  <sch:pattern xmlns="http://www.lido-schema.org/lidoProfile/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:doc="http://www.mda.org.uk/spectrumXML/Documentation" xmlns:gml="http://www.opengis.net/gml" xmlns:lido="http://www.lido-schema.org" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:skos="http://www.w3.org/2004/02/skos/core#">
								<sch:rule context="lido:titleSet">
									<sch:extends rule="hps_titleSet_type"/>
								</sch:rule>
							</sch:pattern>
  <sch:diagnostics/>
</sch:schema>
