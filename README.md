# cpcoj-backend-builder

## Download
* Download from Dockerhub
```
$ docker pull fjuonlinejudge/cpcoj-backend-builder
```

* Download from Gittub Registry
```
docker pull docker.pkg.github.com/fjuonlinejudge/cpcoj-backend-builder/cpcoj-backend-builder:latest
```

## Using `docker-compose.yml` (Recommand)
```yml
version: "3.7"
services:
  backend:
    image: fjuonlinejudge/cpcoj-backend-builder:latest # or docker.pkg.github.com/fjuonlinejudge/cpcoj-backend-builder/cpcoj-backend-builder:latest
    ports: 
      - "5000:5000"
    links:
      - db
    volumes:
      - ./:/usr/src/app
    environment: 
      FLASK_ENV: development   
    depends_on:
      - db 
  db:
    image: mysql:latest
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 'root'
      MYSQL_DATABASE: 'oj_0'
```

## Running

```
$ docker-compose up -d
```

## Enter backend container and run mysql service 
```
$ docker ps # Get container id
$ docker exec -it {container_id} bash
root@{container_id}$ service mysql start
root@{container_id}$ sh ./scripts/rebuild.sh
```

