
DB_PATH = /home/balnahdi/md
WP_PATH = /home/balnahdi/wp

volume:
	@sudo mkdir -p $(DB_PATH) $(WP_PATH)

build:
	#START
	@sudo docker-compose -f ./srcs/docker-compose.yml build 
	#END
run:
	@sudo docker-compose -f ./srcs/docker-compose.yml up

build_run:
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build

stop:
	@sudo docker-compose -f ./srcs/docker-compose.yml stop

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo rm -rf $(DB_PATH) $(WP_PATH)

all: volume build 

re: clean all run

fclean: clean
	@sudo docker system prune -a -f
