#!/bin/bash
# createRproject.sh

mkdir -p Scripts
mkdir -p Analysis
mkdir -p Saved/Citations_history
currDate=`date "+%Y-%m-%d"`
projFile=${PWD##*/}.Rproj
scriptDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
templateDir=${scriptDir}/Templates

cat ${templateDir}/Rproj.default.txt > $projFile
cat ${templateDir}/Rprofile.default.txt > .Rprofile
cat ${templateDir}/Gitignore.default.txt > .gitignore
echo -e "---\ntitle: \"${PWD##*/}\"" > README.Rmd
echo "author: \"Keaton Stagaman\"" >> README.Rmd
echo "date: \"${currDate}\"" >> README.Rmd
echo -e "output:\n  github_document:\n    toc: true\n    toc_depth: 3\nalways_allow_html: true\n---\n" >> README.Rmd
cat ${templateDir}/Rmarkdown.default.setupChunk.txt >> README.Rmd
cp ${templateDir}/packages.R ./

cp ${templateDir}/DefaultRscripts/* Scripts
cp ${templateDir}/DefaultAnalysisScripts/* Analysis

git init
git add .
open $projFile