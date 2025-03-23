# Provisionamento de Servidor Web com Node.js

Este projeto automatiza o provisionamento de um servidor web no Linux usando scripts Bash. Ele inclui a instalação do Apache, Node.js e npm, além do download e implantação de uma aplicação web hospedada no GitHub.

## 📌 Funcionalidades
- Atualização do sistema operacional.
- Instalação dos pacotes necessários (Apache, Node.js, npm, etc.).
- Download e construção da aplicação web.
- Implantação automática no servidor Apache.
- Script de limpeza para reconfiguração ou testes.

## 📂 Estrutura do Projeto
```
/
├── criar_scripts.sh                # Criação dos scripts de provisionamento e limpeza
├── Dockerfile                      # Configuração do container Docker
├── requirements.txt                 # Lista de pacotes necessários
└── README.md                        # Documentação do projeto
```

## 🚀 Como Usar

### 📌 Pré-requisitos
- Linux instalado e acesso ao terminal.
- Permissões de superusuário (`sudo`).
- Docker (caso queira executar o provisionamento via container).

### 🔹 1. Criar os Scripts
Execute o script `criar_scripts.sh` para gerar os scripts de provisionamento e limpeza:
```bash
bash criar_scripts.sh
```

### 🔹 2. Executar o Provisionamento
Para configurar o servidor e implantar a aplicação, execute:
```bash
sudo ./provisionar_servidor_web.sh
```

### 🔹 3. Limpar o Ambiente (Opcional)
Caso precise resetar o ambiente para novos testes:
```bash
sudo ./apagar_arqvs_para_testar.sh
```

## 🐳 Uso com Docker
Se desejar executar o provisionamento dentro de um container, utilize os seguintes comandos:

### 🔹 1. Construir a Imagem Docker
```bash
docker build --no-cache -t deploy-inecs .
```

### 🔹 2. Executar o Container
```bash
docker run -d --name deploy-inecs deploy-inecs
```

### 🔹 3. Copiar Arquivos do Container para o Host
```bash
sudo docker cp deploy-inecs:/var/www/html/ /var/www/html/
```

## 📜 Detalhes dos Scripts

### 1️⃣ `criar_scripts.sh`
- Cria os scripts `provisionar_servidor_web.sh` e `apagar_arqvs_para_testar.sh`.
- Torna os scripts executáveis.

### 2️⃣ `provisionar_servidor_web.sh`
- Atualiza os pacotes do sistema.
- Instala Apache, Unzip, Node.js e npm.
- Baixa a aplicação web de um repositório GitHub.
- Realiza o build da aplicação.
- Copia os arquivos para o diretório do Apache.

### 3️⃣ `apagar_arqvs_para_testar.sh`
- Remove a aplicação baixada.
- Limpa o diretório `/var/www/html/`.

## 📦 Lista de Pacotes (requirements.txt)
Os pacotes necessários para execução incluem:
```text
python3
python3-pip
build-essential
apache2
wget
unzip
nodejs
npm
```

## 🤝 Contribuição
Se deseja contribuir, abra uma issue ou envie um pull request.

---
📌 **Autor:** Caio Querino

📌 **Repositório:** https://github.com/CaioQuerino/linux-projeto3-pas/tree/main

