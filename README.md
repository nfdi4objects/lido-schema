# LIDO Schema

This repository contains a copy of [the official XML Schemas](https://cidoc.mini.icom.museum/working-groups/lido/lido-overview/lido-schema/) for local use.

The files have been adjusted to use relative references to included schema files, so no HTTP requests are needed to get the full schema. This considerably speeds up validation, unless schemas are cached anyway.

## Usage

Validate `lido-file.xml` against XML Schema with xmllint:

~~~sh
xmllint --schema lido-v1.1.xsd lido-file.xml --noout
~~~

The script `lido-valid`, included in this repository, can be used to call xmllint with reference to LIDO 1.1 XML Schema:

~~~sh
./lido-valid lido-file.xml
~~~


## License

[Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)
