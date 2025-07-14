# LIDO Schemas

This repository contains a copy of [the official XML Schemas](https://cidoc.mini.icom.museum/working-groups/lido/lido-overview/lido-schema/), Schematron schemas, and [LIDO Profiles](https://cidoc.mini.icom.museum/working-groups/lido/lido-overview/profiles/).

The files have been adjusted to use relative references to included schema files, so no HTTP requests are needed to get the full schema. This considerably speeds up validation (unless schemas are cached anyway).

## Formats and Application Profiles

See [formats.json](formats.json) for a machine-readable list:

- LIDO 1.1
- LIDO 1.0
- Minimum Record Recommenation for Museums and Collections (aka Minimaldatensatz) 1.0.1 (based on LIDO 1.1)
- EODEM Exhibition Object Data Exchange Model 1.0 (based on LIDO 1.1)
- LIDO Handbook "Painting and Sculpture" (based on LIDO 1.1)

## Local copies of referenced schema files

- `xml.xsd` = <https://www.w3.org/2001/03/xml.xsd>
- `xlink.xsd` = <https://www.w3.org/1999/xlink.xsd>
- `smil/smil20.xsd` = <https://www.w3.org/2001/SMIL20/smil20.xsd> with includes embedded
- `smil/smil20-language.xsd` = <https://www.w3.org/2001/SMIL20/smil20-language.xsd>
- `gml/*` = <https://schemas.opengis.net/gml/3.1.1/base/gml.xsd> and includes 
- `XMLSchema.dtd` = <https://www.w3.org/2009/XMLSchema/XMLSchema.dtd>
- `datatypes.dtd` =  <https://www.w3.org/2009/XMLSchema/datatypes.dtd>

## Schematron Schemas

All Schematron Schema files (`.xsd`) have been extracted from the corresponding XML Schema files with command `make -B schematron`.

## Installation

Requires the `xmllint` command line tool, included in the `libxml2-utils` Debian package.

## Usage

Validate `lido-file.xml` against XML Schema with `xmllint`:

~~~sh
xmllint --schema lido-v1.1.xsd lido-file.xml --noout
~~~

The script `lido-valid`, included in this repository, can be used to call `xmllint` with reference to LIDO 1.1 XML Schema:

~~~sh
./lido-valid lido-file.xml
~~~

## License

[Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)
