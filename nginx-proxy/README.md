#### Reload nginx conf

docker exec -it $(docker ps -n=-1 -q --filter name=nginx-proxy_api --format="{{.ID}}") nginx -s reload

docker-compose exec api nginx -s reload
