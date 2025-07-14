# Extract Schematron from XML Schema file
%.sch: %.xsd
	xsltproc ExtractSchFromXSD-2.xsl $< > $@

schematron: lido-v1.1.sch lido-v1.1-profile-EODEM-v1.0.sch lido-v1.1-profile-minimumrecordrecommendation-v1.0.1.sch paintingandsculpture.sch
