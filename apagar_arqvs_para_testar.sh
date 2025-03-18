#!/bin/bash

# Remove o diretório do projeto e o conteúdo do Apache
cd /tmp/ && rm -Rf inecs-main
cd /var/www/ && rm -Rf html && mkdir html

echo "Arquivos de teste removidos com sucesso!"
