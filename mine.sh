#!/usr/bin/env sh


if [ $1 = 'setup' ]; then
    echo 'iniciando o setup do servidor'
    sudo docker run -d -v .:/cpy:rw --name server imrayh/server-vanila cp -r /server /cpy
    sudo docker exec server cp -r /server /cpy
    sudo docker stop server && sudo docker rm server

    # subindo para finalizar!
    sudo docker compose up -d

elif [ $1 = 'stop' ]
 then
    sudo docker compose down

elif  [ $1 = 'restart' ]
 then
  sudo docker compose restart

elif [ $1 = 'prune' ]; then
    echo 'tem certeza que quer apagar tudo?'
    read resp
    if [ resp = 'y' ]; then
        sudo docker compose down
            sudo rm -r server/
    fi
elif [ $1 = 'start' ]; then
    sudo docker compose up -d
elif [ $1 = 'backup' ]; then
  sudo docker compose down
  sudo docker build -t imrayh/server-vanila .
  sudo docker push imrayh/server-vanila
  sudo docker compose up -d
else
  echo 'nenhum parâmetro oferecido!'
fi
