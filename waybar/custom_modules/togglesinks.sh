#!/bin/bash

# Lista todos os sinks disponíveis
SINKS=($(pactl list short sinks | awk '{print $2}'))

# Se não houver exatamente dois sinks, sai com erro
if [ "${#SINKS[@]}" -ne 2 ]; then
  echo "Erro: esperado exatamente 2 sinks, encontrados ${#SINKS[@]}."
  exit 1
fi

# Pega o sink atual
CURRENT_SINK=$(pactl get-default-sink)

# Decide qual usar
if [ "$CURRENT_SINK" = "${SINKS[0]}" ]; then
  NEW_SINK="${SINKS[1]}"
else
  NEW_SINK="${SINKS[0]}"
fi

# Aplica o novo sink
pactl set-default-sink "$NEW_SINK"
echo "Sink trocado para: $NEW_SINK"
