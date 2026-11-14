#!/usr/bin/env bash
# Roda os blocos (kit/blocos/*.sh) em ordem, como o aluno: um HOME temporário só, que começa vazio.
# O a1a clona o kit do GitHub, então capture DEPOIS do push. Grava kit/saidas/<bloco>.txt.
#   fila-vaga gpu agentes-do-zero -- bash kit/capturar.sh
set -uo pipefail
K=$(cd "$(dirname "$0")" && pwd); T=$(mktemp -d /tmp/adz.XXXX); trap 'rm -rf "$T"' EXIT
mkdir -p "$T/h"
for b in $(cd "$K/blocos" && ls *.sh | sed 's/\.sh$//'); do
  ( cd "$T/h" && HOME="$T/h" OLLAMA_MODELS="${OLLAMA_MODELS:-}" timeout 900 bash "$K/blocos/$b.sh" < /dev/null ) 2>&1 \
    | sed -E 's/\x1b\[[0-9;?]*[a-zA-Z]//g' | tr -d '\r' | sed "s#$T/h#~#g; s#$T#/tmp#g; s#$HOME#~#g" | cat -s > "$K/saidas/$b.txt"
  echo "$b: $(wc -l < "$K/saidas/$b.txt") linhas"
done
