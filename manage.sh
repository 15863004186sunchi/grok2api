#!/bin/bash

# Docker Compose Management Script
# Usage: ./manage.sh [up|down|logs|restart|status]

COMMAND=$1

case $COMMAND in
  up)
    echo "Starting services..."
    docker-compose up -d
    ;;
  down)
    echo "Stopping services..."
    docker-compose down
    ;;
  logs)
    echo "Viewing logs (Ctrl+C to exit)..."
    docker-compose logs -f
    ;;
  restart)
    echo "Restarting services..."
    docker-compose restart
    ;;
  status)
    echo "Checking service status..."
    docker-compose ps
    ;;
  *)
    echo "Usage: $0 {up|down|logs|restart|status}"
    exit 1
    ;;
esac
