#!/usr/bin/env bash
# build_site.sh by Daniele Lolli (UncleDan) feat. Claude AI - Release 1.0 - 2026-10-19 13-05-40
# Prepara la cartella _site per GitHub Pages con il solo generatore HTML:
#   ramo main (o, se manca, master) -> radice del sito
#   ramo beta                       -> sottocartella beta/
# Se manca il ramo principale si pubblica solo beta (la radice rimanda a beta/).
set -euo pipefail
F=Generatore_Campionato_Baskin.html
OUT=${1:-_site}
rm -rf "$OUT"; mkdir -p "$OUT"
estrai() {  # estrai <ramo> <cartella>: copia l'HTML del ramo, se ramo e file esistono
  if git rev-parse --verify --quiet "origin/$1" >/dev/null && git cat-file -e "origin/$1:$F" 2>/dev/null; then
    mkdir -p "$2"; git show "origin/$1:$F" > "$2/index.html"; cp "$2/index.html" "$2/$F"; return 0
  fi
  return 1
}
PRINC=""
if estrai main "$OUT"; then PRINC=main; elif estrai master "$OUT"; then PRINC=master; fi
BETA=""
if estrai beta "$OUT/beta"; then BETA=beta; fi
if [ -z "$PRINC" ] && [ -z "$BETA" ]; then echo "Nessun ramo main, master o beta con $F: niente da pubblicare." >&2; exit 1; fi
if [ -z "$PRINC" ]; then
  printf '<!DOCTYPE html><meta charset="utf-8"><meta http-equiv="refresh" content="0; url=beta/"><title>Generatore Campionato Baskin</title><a href="beta/">Generatore Campionato Baskin (beta)</a>\n' > "$OUT/index.html"
fi
touch "$OUT/.nojekyll"
echo "Ramo principale: ${PRINC:-nessuno} - ramo beta: ${BETA:-nessuno}"
find "$OUT" -type f | sort
