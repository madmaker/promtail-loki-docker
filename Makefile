project-root = /var/www

.SILENT:
default:
	echo "Wrong Command\n"
	echo "Available commands:"
	echo "up - up docker service"
	echo "down - down docker service"

	echo "\n"
	echo "Example: make up"

up:
	docker compose up -d

down:
	docker compose down --remove-orphans