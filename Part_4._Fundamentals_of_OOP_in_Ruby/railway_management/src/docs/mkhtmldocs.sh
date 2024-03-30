#!/usr/bin/bash
set -Eeuo pipefail   

wd=$( pwd )
PLANTUML_URL="https://www.plantuml.com/plantuml" 
PLANTUML_ENCODING="deflate" 

find $wd -type f -name "*.adoc" |\
  xargs asciidoctor -r asciidoctor-plantuml

