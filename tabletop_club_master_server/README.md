# tabletop club server

base is https://github.com/drwhut/tabletop_club_master_server

根据`server.js`代码，你需要准备好域名以支持https传输服务的SSL证书。

# run

```shell
docker run --rm -d --network=host table
```
虽然说在`Dockerfile`中指定了暴露端口，但实际使用中为了保持服务完整，请直接使用`host`网络模式。