restart: stop start

start:
	@docker compose up -d --build

stop:
	@docker compose down