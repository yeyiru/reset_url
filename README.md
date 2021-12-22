# reset_url

## Build Dcoker
```
docker build -t re_url:v1 -f Dockerfile .
```
## 進入docker後運行
```
nohup python3.8 /data/reset_url/reset_url.py >/dev/null 2>log &
```