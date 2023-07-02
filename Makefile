
DB_PATH = /home/balnahdi/data/md
WP_PATH = /home/balnahdi/data/wp

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

down:	
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo rm -rf $(DB_PATH) $(WP_PATH)

all: volume build run 

re: clean all 

fclean: clean
	@sudo docker system prune -a -f
