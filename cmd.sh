## 建立編譯環境
docker buildx create --name builder || echo 1
docker buildx use builder
docker buildx inspect --bootstrap

## 編譯
# docker buildx build --platform linux/amd64,linux/arm64 -t dkr.sgis.tw/reset_url --push image
docker buildx build --platform linux/amd64,linux/arm64 -t dkr.tw/sgis/reset_url --push image

## 執行
# docker run -it --rm -v $PWD/src:/data dkr.sgis.tw/reset_url python3 re_url.py
docker pull dkr.tw/sigs/reset_url
docker run -it -p 8501:8501 -v $PWD/src:/data dkr.tw/sgis/reset_url nohup python3 re_url.py >/dev/null 2>log &