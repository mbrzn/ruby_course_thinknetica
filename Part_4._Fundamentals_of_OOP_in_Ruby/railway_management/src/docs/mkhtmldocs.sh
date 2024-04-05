#!/usr/bin/bash
# Конвертирует .adoc файлы в рабочей директории (и вложенных)
# в html 
#
set -Eeuo pipefail   

wd=$( pwd )
stdin=$( find $wd -type f -name "*.adoc" )

#echo ${arr[@]}

declare -a arr
IFS=$'\n' # split on newline only
set -f    # disable globbing
arr=($(printf "%s" "$stdin"))

for file in ${arr[@]}
	do
    echo "$file"
    (PLANTUML_URL="https://www.plantuml.com/plantuml" \
      PLANTUML_ENCODING="deflate" \
      asciidoctor -r asciidoctor-plantuml $file)
	done




