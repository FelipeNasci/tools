#!/bin/bash

output="/tmp/linux-basic-config"

mkdir ${output} -p
cd ${output}

# Declarando o array corretamente
scripts=(
  "https://raw.githubusercontent.com/FelipeNasci/tools/main/hello-world.sh"
  "https://raw.githubusercontent.com/FelipeNasci/tools/main/bye-bye-world.sh"
)

# Percorrendo o array
for script in "${scripts[@]}"; do
  curl -O -s "${script}"
done

for file in "${output}"/*; do
  echo "Executando o arquivo ${file}"
  chmod +x "${file}"
  ${file}
   
done
