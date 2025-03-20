# Linux - Projeto 3: Provisionamento de Servidor Web com Node.js

Este projeto consiste em scripts Bash para automatizar a configuração de um servidor web no Linux, incluindo a instalação do Apache, Node.js, e a implantação de uma aplicação web. O objetivo é facilitar o provisionamento de um ambiente web completo, desde a instalação dos pacotes necessários até a implantação da aplicação.

## Scripts
O projeto contém três scripts principais:

### 1. `criar_scripts.sh`
- Cria os scripts `provisionar_servidor_web.sh` e `apagar_arqvs_para_testar.sh`.
- Torna os scripts executáveis.

### 2. `provisionar_servidor_web.sh`
- Atualiza o sistema.
- Instala o Apache2, Unzip, Node.js e npm.
- Baixa uma aplicação web de um repositório GitHub.
- Instala o build para gerar a pasta dist.
- Copia os arquivos da aplicação para o diretório padrão do Apache.

### 3. `apagar_arqvs_para_testar.sh`
- Remove os arquivos e diretórios criados durante o provisionamento.
- Útil para limpar o ambiente após testes ou quando a infraestrutura não é mais necessária.

## Estrutura de Diretórios
O script `provisionar_servidor_web.sh` cria a seguinte estrutura de diretórios:
```
/tmp/inecs-main/   # Diretório temporário onde a aplicação é baixada, descompactada e construída.
/var/www/html/      # Diretório padrão do Apache onde os arquivos da aplicação são copiados.
```

## Como Usar

### **Pré-requisitos**
- Sistema operacional Linux.
- Permissões de superusuário (`sudo`) para executar os scripts.

### **Passos**

#### **1. Criar os Scripts**
Execute o script `criar_scripts.sh` para gerar os scripts de provisionamento e limpeza:
```bash
bash criar_scripts.sh
```

#### **2. Executar o Script de Provisionamento**
Execute o script `provisionar_servidor_web.sh` para configurar o servidor e implantar a aplicação:
```bash
sudo ./provisionar_servidor_web.sh
```

#### **3. Para Limpar o Ambiente**
Execute o script `apagar_arqvs_para_testar.sh` para remover os arquivos e diretórios criados:
```bash
sudo ./apagar_arqvs_para_testar.sh
```

## Detalhes dos Scripts

### **1. `criar_scripts.sh`**
- Gera os scripts `provisionar_servidor_web.sh` e `apagar_arqvs_para_testar.sh`.
- Torna os scripts executáveis.

### **2. `provisionar_servidor_web.sh`**
- **Atualização do Sistema:** Atualiza os pacotes do sistema.
- **Instalação de Pacotes:** Instala o Apache2, Unzip, Node.js e npm.
- **Download da Aplicação:** Baixa a aplicação web de um repositório GitHub e a descompacta.
- **Build da Aplicação:** Instala o build para gerar a pasta dist.
- **Cópia dos Arquivos:** Copia os arquivos da aplicação para o diretório do Apache.

### **3. `apagar_arqvs_para_testar.sh`**
- **Limpeza de Diretórios:** Remove o diretório da aplicação em `/tmp/` e limpa o diretório `/var/www/html/`.

## Permissões
- **Diretório `/var/www/html/`**: Permissões padrão do Apache (geralmente `755` para diretórios e `644` para arquivos).

## Contribuição
Se você deseja contribuir para este projeto, sinta-se à vontade para abrir uma issue ou enviar um pull request.

---

