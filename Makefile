name = inception

all: launch

launch:
	@printf "Building configuration ${name}...\n"
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@printf "Building configuration ${name}...\n"
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml --env-file up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file down

re: down
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file up -d --build

rebuild: fclean build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data

fclean: 
	@printf "Total clean of all configurations docker\n"
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data

.PHONY	: all build down re clean fclean rebuild
