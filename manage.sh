#!/bin/bash

# Docker Compose Management Script
# Usage: ./manage.sh [up|down|logs|restart|status]

# Detect docker-compose command
if docker compose version >/dev/null 2>&1; then
    DOCKER_COMPOSE="docker compose"
elif docker-compose version >/dev/null 2>&1; then
    DOCKER_COMPOSE="docker-compose"
else
    echo "Error: Neither 'docker compose' nor 'docker-compose' found."
    echo "Please install Docker Compose first."
    exit 1
fi

COMMAND=$1

case $COMMAND in
  up)
    echo "Starting services using $DOCKER_COMPOSE..."
    $DOCKER_COMPOSE up -d
    ;;
  down)
    echo "Stopping services using $DOCKER_COMPOSE..."
    $DOCKER_COMPOSE down
    ;;
  logs)
    echo "Viewing logs (Ctrl+C to exit) using $DOCKER_COMPOSE..."
    $DOCKER_COMPOSE logs -f
    ;;
  restart)
    echo "Restarting services using $DOCKER_COMPOSE..."
    $DOCKER_COMPOSE restart
    ;;
  status)
    echo "Checking service status using $DOCKER_COMPOSE..."
    $DOCKER_COMPOSE ps
    ;;
  *)
    echo "Usage: $0 {up|down|logs|restart|status}"
    exit 1
    ;;
esac
