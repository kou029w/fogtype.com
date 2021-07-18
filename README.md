# ほんの少し降る雨

## 前提

- Docker Compose
- systemd-journald

Git リポジトリを取得し、設定ファイルを配置

```sh
ssh kou029w@keiu.net
git clone git@github.com:kou029w/keiu.net.git
cd keiu.net
sudo tee /etc/docker/daemon.json < etc/docker/daemon.json
install -m 600 <(echo POSTGRES_PASSWORD=$(python3 -c 'import secrets; print(secrets.token_urlsafe())')) .env
```

## 構築

```sh
docker-compose up -d
```
