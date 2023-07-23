# elfrss docker

## Run
```bash
sudo docker run \
    -p 8080:8080 \
    -v /path/to/.env.prod:/data/.env.prod \
    -v /path/to/data:/data/data \
    -v /path/to/bot.py:/data/bot.py \
docker/elfrss
```

## 项目来自
- https://github.com/Quan666/ELF_RSS
- [bot创建参考](docs.md)