# reset_url

## Build Dcoker
```
docker build -t re_url:v1 -f Dockerfile .
```
## 進入docker
-p 後需指定主機的端口，docker的端口默認為8501，：前指定一個主機的可用端口
```
docker run -it -p 8501:8501 re_url:v1 /bin/bash
```

## 進入docker後運行
```
nohup python3.8 /data/reset_url/re_url.py >/dev/null 2>log &
```

## 測試
瀏覽器訪問
```
ip:8501/-L5mcFQ-WGtzIzexktqkKw$II$Y$.png
```
如可以正常訪問到圖片，代表已部署成功
