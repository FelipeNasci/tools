#!/bin/bash

output="/tmp/ccae-scripts"

clear

mkdir ${output} -p
cd ${output}

# list with all scripts to download
scripts=(
  "https://raw.githubusercontent.com/FelipeNasci/tools/main/linux/basic-config/install-dependencies.sh"
)

# download each file
for script in "${scripts[@]}"; do
  curl -O -s "${script}"
done

for file in "${output}"/*; do
  echo "Executando o arquivo ${file}"
  chmod +x "${file}"
  ${file}
done


# curl -O -s <<"${script}">> && chmod +x "${script}" && "${script}"