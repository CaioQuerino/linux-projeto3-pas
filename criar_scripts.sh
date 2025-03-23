#!/bin/bash

cat > /app/provisionar_servidor_web.sh << 'EOF'
#!/bin/bash

# Função para atualizar o sistema
atualizar_sistema() {
  echo "Atualizando o sistema..."
  apt update -y && apt upgrade -y
}

# Função para instalar pacotes necessários
instalar_pacotes() {
  echo "Instalando Apache2, Unzip, NodeJs e npm ..."
  apt install apache2 unzip nodejs npm  -y
}

# Função para baixar a aplicação do repositório
baixar_aplicacao_repositorio() {
  echo "Baixando a aplicação do repositório..."
  wget https://github.com/CaioQuerino/inecs/archive/refs/heads/main.zip -O /tmp/main.zip
  unzip /tmp/main.zip -d /tmp/

  # Verifica se o diretório foi criado corretamente
  if [ -d "/tmp/inecs-main" ]; then
    cd /tmp/inecs-main
    npm i build
    npm run build
  else
    echo "Erro: Diretório /tmp/inecs-main não encontrado!"
    exit 1
  fi
}

# Função para copiar os arquivos da aplicação para o diretório do Apache
copiar_arquivos() {
  echo "Copiando arquivos para o diretório do Apache..."
  if [ -d "/tmp/inecs-main/dist" ]; then
    cp -R /tmp/inecs-main/dist/* /var/www/html/
  else
    echo "Erro: Diretório /tmp/inecs-main/dist não encontrado!"
    exit 1
  fi
}

# Função principal que executa todas as etapas
main() {
  atualizar_sistema
  instalar_pacotes
  baixar_aplicacao_repositorio
  copiar_arquivos
  echo "Processo concluído!"
}

# Executa a função principal
main
EOF

cat > /app/apagar_arqvs_para_testar.sh << 'EOF'
#!/bin/bash

# Remove o diretório do projeto e o conteúdo do Apache
cd /tmp/ && rm -Rf inecs-main
cd /var/www/ && rm -Rf html && mkdir html

echo "Arquivos de teste removidos com sucesso!"
EOF

chmod +x /app/provisionar_servidor_web.sh /app/apagar_arqvs_para_testar.sh

echo "Scripts criados e tornados executáveis com sucesso!"

echo "Executando provisionar_servidor_web.sh..."
/app/provisionar_servidor_web.sh
