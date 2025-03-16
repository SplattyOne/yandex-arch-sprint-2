# pymongo-api

## Как запустить

Запускаем mongodb и приложение

```shell
docker compose -f sharding-repl-cache/compose.yaml up -d
```

Настраиваем шардирование mongodb

```shell
./sharding-repl-cache/scripts/mongo-sharding-init.sh
```

Заполняем mongodb данными

```shell
./sharding-repl-cache/scripts/mongo-testdata-init.sh
```

## Как проверить

Наполнение данными по шардам

```shell
./sharding-repl-cache/scripts/mongo-test.sh
```

### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080

### Если вы запускаете проект на предоставленной виртуальной машине

Узнать белый ip виртуальной машины

```shell
curl --silent http://ifconfig.me
```

Откройте в браузере http://<ip виртуальной машины>:8080

## Доступные эндпоинты

Список доступных эндпоинтов, swagger http://<ip виртуальной машины>:8080/docs
