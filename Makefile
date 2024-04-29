# make up, make down - запускает нижеследующие команды:
#---------------------------------------------------------------------------

up:
	docker compose up -d
down:
	docker compose down
stop:
	docker compose stop
down-v:
	docker compose down -v

# social_app - container name, app - service, node - service,
social-app:
	docker exec -it social_app bash
npm-install:
	docker compose exec node npm install
npm-build:
	docker compose exec node npm run build
npm-dev:
	docker compose exec node npm run dev
tinker:
	docker compose exec app php artisan tinker

# if we change - "all - 1", we get - model, migration, factory, seeder, requests, policy, resource-controller
model:
	docker compose exec app php artisan make:model
resource:
	docker compose exec app php artisan make:resource
controller:
	docker compose exec app php artisan make:controller

build:
	docker compose build --no-cache --force-rm
composer-update:
	docker exec app bash -c "composer update"
data:
	docker exec app bash -c "php artisan migrate"
	docker exec app bash -c "php artisan db:seed"

# make setup - запускает все нижележащие команды makefile
install:
	@make model
	@make request
	@make resource
	@make controller
setup:
	@make build
	@make up
	@make composer-update
