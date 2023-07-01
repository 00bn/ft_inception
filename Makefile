
DB_PATH = /Users/badriah/Desktop/md
WP_PATH = /Users/badriah/Desktop/wp

volume:
	mkdir -p $(DB_PATH) $(WP_PATH)

build:
	docker-compose -f ./srcs/docker-compose.yml build 

run:
	docker-compose -f ./srcs/docker-compose.yml up

build_run:
	docker-compose -f ./srcs/docker-compose.yml up --build

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	rm -rf $(DB_PATH) $(WP_PATH)

all: volume build 

re: clean all

fclean: clean
	docker system prune -a -f
