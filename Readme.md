## Linux

### Basic config

```bash
apt update -y && apt upgrade -y && apt install -y curl

cd /

curl -s -o https://raw.githubusercontent.com/FelipeNasci/tools/main/linux/basic-config/index.sh && chmod +x index.sh && ./index.sh

rm index.sh
```