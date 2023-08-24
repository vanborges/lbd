@author: Diego Bulhões - https://github.com/DiegoBulhoes/database-laboratory

# Docker play
https://labs.play-with-docker.com/


# Docker PostgreSQL

Exemplo de uso do Docker + Postgres, para execultar o exemplo basta execultar.

```
docker-compose up
```

Para execultar em background use esse comando

```
docker-compose up -d
```

O PGAdmin4 poderá ser acessado usando link http://0.0.0.0:8080 ou http://174.20.0.3

```
User: pgadmin4@pgadmin.org
Password: pgadmin4
```

O ip do servidor Postgres é 174.20.0.2

```
User: postgres
Password: postgres
```
## Acessando o PSQL
	docker exec -it postgres psql -U postgres

## Instalação do Docker

```
curl -fsSL https://get.docker.com | sh
```

Se você quiser usar o Docker como um usuário não root, considere adicionar o usuário ao grupo "docker".

```
sudo usermod -aG docker $your_user
```

## Instalação do Docker-compose

Execute este comando para baixar a versão estável atual do Docker Compose:

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Aplique permissões executáveis ​​ao binário:

```
sudo chmod +x /usr/local/bin/docker-compose
```

Nota: Se o comando docker-compose falhar após a instalação, verifique a path. Você também pode criar um link simbólico para /usr/bin ou qualquer outro diretório em seu caminho

```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

## Remover os containers, volumes e network

```
docker-compose down
```
