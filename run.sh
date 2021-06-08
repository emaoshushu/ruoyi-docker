#!/bin/sh
sudo docker build -t ruoyi-preview .

sudo docker network create mysqlnet

sudo docker run -it --rm -d -v mysql_data:/var/lib/mysql -v mysql_config:/etc/mysql/conf.d -v "$(pwd)"/sql:/docker-entrypoint-initdb.d --network mysqlnet --name mysqlserver -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:8.0.23

sudo docker run --rm -d --name springboot-server --network mysqlnet -e MYSQL_URL=jdbc:mysql://mysqlserver/petclinic -e MYSQL_USER=root -e MYSQL_PASSWORD=root -p 8080:80 ruoyi-preview
