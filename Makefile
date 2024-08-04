REMOTE_USER := nebel
REMOTE_HOST := fogtype.com

.PHONY: help
help:
	@cat README.md

.PHONY: deploy
deploy:
	ssh $(REMOTE_USER)@$(REMOTE_HOST) <$@

.PHONY: install
install: .deploy_key .known_hosts
	ssh-copy-id -i .deploy_key.pub $(REMOTE_USER)@$(REMOTE_HOST)
	scp install $(REMOTE_USER)@$(REMOTE_HOST):install
	ssh -t $(REMOTE_USER)@$(REMOTE_HOST) '\
		ssh-keygen -t ed25519; \
		cat ~/.ssh/id_ed25519.pub; \
		./install; \
		rm install; \
	'

.deploy_key:
	ssh-keygen -t ed25519 -C deploy_key -f $@

.known_hosts:
	ssh-keyscan -t ed25519 -H $(REMOTE_HOST) >$@

.PHONY: keyrings
keyrings: \
	etc/apt/keyrings/docker-archive-keyring.gpg \
	etc/apt/keyrings/tailscale-archive-keyring.gpg \

etc/apt/keyrings/docker-archive-keyring.gpg:
	curl -sSf --tlsv1.3 https://download.docker.com/linux/ubuntu/gpg \
		| gpg --dearmor >$@

etc/apt/keyrings/tailscale-archive-keyring.gpg:
	curl -sSf --tlsv1.3 -o $@ https://pkgs.tailscale.com/stable/ubuntu/noble.noarmor.gpg
