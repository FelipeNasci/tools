## Linux

### Basic config

```bash
cd /

apt update -y && apt upgrade -y && apt install -y curl

curl -s -O https://raw.githubusercontent.com/FelipeNasci/tools/main/linux/basic-config/index.sh && chmod +x index.sh && ./index.sh

rm index.sh
```