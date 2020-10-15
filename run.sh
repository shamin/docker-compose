#!/bin/bash

if [ $# -eq 0 ]
  then
    PS3='Please enter your choice: '
    options=("Mysql" "Mongo" "Elastic Search" "Kafka" "Postgres" "Redis")
    select opt in "${options[@]}"
    do
        case $opt in
            "Mysql")
                docker-compose -f mysql/docker-compose.yml up -d
                break
                ;;
            "Mongo")
                docker-compose -f kafka/docker-compose.yml up -d
                break
                ;;
            "Elastic Search")
                docker-compose -f elasticsearch/docker-compose.yml up -d
                break
                ;;
            "Kafka")
                docker-compose -f kafka/docker-compose.yml up -d
                ;;
            "Postgres")
                docker-compose -f postgres/docker-compose.yml up -d
                ;;
            "Redis")
                docker-compose -f redis/docker-compose.yml up -d
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
else
  available=("mysql" "mongo" "kafka" "memcached" "postgres" "redis")
  if printf '%s\n' "${available[@]}" | grep "^$1$"
    then
      docker-compose -f $1/docker-compose.yml up -d
  else
    echo "Couldn't find a service with name $1"
  fi
fi