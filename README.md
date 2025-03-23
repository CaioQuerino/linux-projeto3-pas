# Provisionamento de Servidor Web com Node.js e Apache

Este projeto contém scripts Bash para automatizar a configuração de um servidor web Linux, incluindo a instalação do Apache, Node.js e a implantação de uma aplicação web. O objetivo é facilitar a configuração e o provisionamento do ambiente web de maneira rápida e eficiente.

## Estrutura do Projeto
O projeto inclui três scripts principais:

1. **`criar_scripts.sh`** - Gera os scripts de provisionamento e limpeza e os torna executáveis.
2. **`provisionar_servidor_web.sh`** - Configura o servidor, instala pacotes necessários e implanta a aplicação.
3. **`apagar_arqvs_para_testar.sh`** - Remove os arquivos e diretórios criados para testes.

## Estrutura de Diretórios Criada
Após a execução do script `provisionar_servidor_web.sh`, a seguinte estrutura será criada:
```
/tmp/inecs-main/   # Diretório temporário onde a aplicação é baixada, descompactada e construída.
/var/www/html/      # Diretório padrão do Apache onde os arquivos da aplicação são copiados.
```

## Pré-requisitos
- Sistema operacional Linux.
- Permissões de superusuário (`sudo`).
- Docker instalado (opcional, se for executar via container).

## Como Usar

### 1. Criar os Scripts
Execute o script `criar_scripts.sh` para gerar os scripts necessários:
```bash
bash criar_scripts.sh
```

### 2. Executar o Script de Provisionamento
Execute o script para configurar o servidor e implantar a aplicação:
```bash
sudo ./provisionar_servidor_web.sh
```

### 3. Para Limpar o Ambiente
Se precisar remover os arquivos e diretórios criados, execute:
```bash
sudo ./apagar_arqvs_para_testar.sh
```

## Uso com Docker
Caso queira executar o processo dentro de um container Docker, siga os passos:

### 1. Construir a Imagem Docker
```bash
docker build --no-cache -t deploy-inecs .
```

### 2. Rodar o Container
```bash
docker run -d --name deploy-inecs deploy-inecs
```

### 3. Copiar os Arquivos do Container para o Host
```bash
sudo docker cp <CONTAINER_ID>:/var/www/html/* /var/www/html/
```
Substitua `<CONTAINER_ID>` pelo ID real do container em execução.

## Detalhes dos Scripts

### **1. `criar_scripts.sh`**
- Cria os scripts de provisionamento e limpeza.
- Torna os scripts executáveis.

### **2. `provisionar_servidor_web.sh`**
- **Atualiza o sistema**: Executa `apt update` e `apt upgrade`.
- **Instala pacotes necessários**: Apache2, Unzip, Node.js e npm.
- **Baixa a aplicação**: Faz o download do repositório do GitHub.
- **Realiza o build da aplicação**: Instala dependências e gera a pasta `dist`.
- **Copia os arquivos**: Move os arquivos para `/var/www/html/` para que o Apache sirva a aplicação.

### **3. `apagar_arqvs_para_testar.sh`**
- Remove o diretório da aplicação em `/tmp/`.
- Limpa o diretório `/var/www/html/`.

## Permissões
- O diretório `/var/www/html/` deve ter permissões adequadas para o Apache (`755` para diretórios, `644` para arquivos).

## Contribuição
Se deseja contribuir para este projeto, sinta-se à vontade para abrir uma issue ou enviar um pull request no repositório.

---

