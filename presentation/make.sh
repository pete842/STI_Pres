#!/bin/bash

basepath=$(git rev-parse --show-toplevel)
prespath="$basepath/presentation"
mdfile="$prespath/presentation.md"
slides="$prespath/slides"
mdtmp="$prespath/result.md"
assets="$prespath/assets"
tmppath=$(mktemp -d)
branch=$(git branch | grep \* | cut -d ' ' -f2)

cd "$basepath"

function cleanup() {
    echo -en "\nCleaning up...\n        - "
    git checkout "$branch" 1>/dev/null
    git stash pop 1>/dev/null

    if [[ $# -ne 1 ]]; then
      rm -rf "$tmppath"
    fi
}

if [[ $# -eq 1 ]]; then
  echo "no push mode, wrinting in pres/tmp"
  tmppath="$prespath/tmp"

  mkdir -p $tmppath
fi

echo "pandoc: Creating the reveal.js presentation..."
cp $mdfile $mdtmp
cat $slides/* >> $mdtmp

pandoc -t revealjs -s -o "$tmppath/index.html" "$mdtmp" --highlight-style=breezedark --slide-level=2 --quiet

pandoc -t revealjs -s -o "$tmppath/notes.html" "$mdtmp" --highlight-style=breezedark --slide-level=2 --quiet -V showNotes=true

rm $mdtmp

echo "tmppath : ${tmppath}"
cp -r "$assets" "$tmppath"

if [[ $# -eq 1 ]]; then
  exit
fi

echo "   git: Stashing any changes..." 
git stash 1>/dev/null

if [[ -z $(git rev-parse --verify gh-pages 2>/dev/null) ]];
then
    echo -en "   git: No 'gh-pages' branch found. Creating one...\n        - "
    git checkout --orphan gh-pages 1>/dev/null
    git rm -rf "$basepath" 1>/dev/null
else
    echo -en "   git: Existing 'gh-pages' branch found!\n        - "
    git checkout gh-pages 1>/dev/null
fi

cp -a "$tmppath/." "$basepath"

echo -e "   git: Pushing the new presentation with its assets...\n"
git add "$basepath/index.html" "$basepath/assets" "$basepath/notes.html" 1>/dev/null
git commit -m "Push presentation (index.html, notes.html)" 1>/dev/null
git push -u origin gh-pages 1>/dev/null

trap cleanup EXIT
