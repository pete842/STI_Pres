#!/bin/bash

basepath=$(git rev-parse --show-toplevel)
prespath="$basepath/presentation"
mdfile="$prespath/presentation.md"
slides="$prespath/slides"
mdresult="$prespath/result.md"
assets="$prespath/assets"
public="$basepath/public"

cd "$basepath"

echo "[pandoc] Cleaning /public"
rm -rf "$public/*"

echo "[pandoc] Creating the reveal.js presentation..."
cp $mdfile $mdresult
cat $slides/* >> $mdresult

pandoc --no-highlight -t revealjs --template="$prespath/reveal.template" -s -o "$public/index.html" "$mdresult" --slide-level=2 --quiet

#pandoc -t revealjs -s -o "$tmppath/notes.html" "$mdtmp" --highlight-style=breezedark --slide-level=2 --quiet -V showNotes=true

echo "public path : ${public}"
cp -r "$assets" "$public"
