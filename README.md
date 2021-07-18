# ほんの少し降る雨

## 前提

- Docker Compose
- systemd-journald

Git リポジトリを取得し、 /etc/docker/daemon.json を配置

```sh
ssh kou029w@keiu.net
git clone git@github.com:kou029w/keiu.net.git
cd keiu.net
sudo tee /etc/docker/daemon.json < etc/docker/daemon.json
```

## 構築

```sh
echo POSTGRES_PASSWORD=$(python3 -c 'import secrets; print(secrets.token_urlsafe())') >> .env
chmod 600 .env
docker-compose up -d
```
