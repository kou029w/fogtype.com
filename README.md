# Fogtype

## 前提

- Docker Compose
- systemd
- systemd-journald

Git リポジトリを取得し、設定ファイルを配置

```bash
ssh kou029w@fogtype.com
git clone git@github.com:kou029w/fogtype.com.git
cd fogtype.com
sudo install -m 644 {,/}etc/docker/daemon.json
sudo systemctl restart docker
```

## 構築

```sh
docker compose up -d
```
