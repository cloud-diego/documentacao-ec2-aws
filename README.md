# 📔 Documentação: Configuração de Infraestrutura Web com AWS EC2

Este repositório contém minha documentação prática com a criação e o gerenciamento de uma instância EC2 na AWS, como parte das atividades do programa **AWS re/Start - Campinho Digital**.

## 🧠 O que eu aprendi

- Criar e configurar uma instância EC2 (Amazon Linux)  
- Acessar via SSH com chave PEM  
- Instalar e executar serviços no Linux (como o Apache HTTP Server)  
- Redimensionar instâncias (CPU/RAM)  
- Modificar volumes EBS (aumentar armazenamento)  
- Gerenciar segurança com Grupos de Segurança (Security Groups)  
- Parar, reiniciar e encerrar instâncias EC2  

---

## 🛠️ Tecnologias Utilizadas

<div align="left">

  <img src="https://img.shields.io/badge/Linux-%23000000?style=for-the-badge&logo=linux&logoColor=white" alt="Linux" />
  <img src="https://img.shields.io/badge/Bash-%234EAA25?style=for-the-badge&logo=gnubash&logoColor=white" alt="Bash" />
  <img src="https://img.shields.io/badge/AWS%20EC2-%23FF9900?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS EC2" />
  <img src="https://img.shields.io/badge/CloudWatch-%23232F3E?style=for-the-badge&logo=amazonaws&logoColor=white" alt="CloudWatch" />
  <img src="https://img.shields.io/badge/Amazon%20Linux-%23232F3E?style=for-the-badge&logo=linux&logoColor=white" alt="Amazon Linux" />

</div>

---

## 📁 Estrutura do Repositório

`Documentacao-EC2-AWS/`

```

├── ec2-screenshots/   # Capturas de tela organizadas por etapa
├── ec2-scripts/       # Scripts e comandos usados no terminal
└── README.md          # Este arquivo

````

---

## 🖥️ Etapas Realizadas

### 1. Criação da Instância EC2

- Sistema: Amazon Linux 2023  
- Tipo: `t3.micro` (modificado posteriormente)  
- Armazenamento: 8 GiB (modificado posteriormente)  
- Nome da chave PEM: `vockey.pem`  

### ⚙️ Configuração da instância no console da AWS

#### Nome da instância  
<img width="878" height="648" alt="01-nome" src="https://github.com/user-attachments/assets/56955fe6-6966-47ca-994b-60b6f9c058ed" />

#### Escolha de AMI (Amazon Machine Image)  
<img width="878" height="648" alt="02-escolha-ami" src="https://github.com/user-attachments/assets/3a760a79-bbd3-4109-988b-31e4b7bbe330" />

#### Tipo da instância e Key Pair  
<img width="878" height="648" alt="03-tipo-keypair" src="https://github.com/user-attachments/assets/90841f27-e64d-4917-8bfc-1d409b09a668" />

#### Configuração de rede e grupos de segurança  
<img width="878" height="648" alt="04-redes-securitygroup01" src="https://github.com/user-attachments/assets/5293784e-1d22-4843-94f6-e60a1c0d9205" />  
<img width="878" height="648" alt="05-securitygroup02" src="https://github.com/user-attachments/assets/0a81a631-63c2-4d6b-ad81-3b54c52586bd" />

#### Configuração do volume de armazenamento  
<img width="882" height="652" alt="06-configuraca0-volume" src="https://github.com/user-attachments/assets/1c803762-fc39-47db-b5ce-79e01b4db9c9" />

#### Ativação da proteção contra término durante o lançamento da instância  
<img width="878" height="648" alt="07-protecao-termino-ativada" src="https://github.com/user-attachments/assets/5e11bfd2-dfb8-4ea5-b574-af8c4cacaf06" />

#### Script de inicialização (User Data)  
<img width="878" height="648" alt="08-userdata" src="https://github.com/user-attachments/assets/5262d89a-f2fc-421c-9393-4dbd4cf017f4" />

---

### 2. Conectando-se à instância via SSH

```bash
chmod 400 vockey.pem
ssh -i "vockey.pem" ec2-user@ec2-35-92-244-247.us-west-2 -35-92-244-247.us-west-2.compute.amazonaws.com
````

#### 🧑‍💻 Acesso via terminal (Linux)

<img width="878" height="653" alt="10-acesso-ssh" src="https://github.com/user-attachments/assets/bda68bbf-0171-4d6e-9646-db856f48cfed" />

---

### 3. 📊 Monitoramento da Instância

* Verificação de status (3/3 verificações concluídas com êxito)
* Visualização de métricas no CloudWatch

<img width="1302" height="653" alt="12-monitoramento-cw" src="https://github.com/user-attachments/assets/965766d7-d4bc-45cd-9f63-8586a90cd9a8" />

---

### 4. Instalação do Apache (HTTP Server)

```bash
#!/bin/bash
# Autor: Diego Gonçalves
# Instância: Amazon Linux Web Server - AWS re/Start BRSAO215

yum update -y
yum install -y httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Servidor EC2</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
            color: #333;
        }
        .container {
            background-color: white;
            padding: 30px;
            margin: auto;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
        }
        p {
            font-size: 18px;
        }
        .logo {
            width: 150px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png" alt="AWS Logo" class="logo">
        <h1>Servidor EC2 funcionando!</h1>
        <p><strong>Autor:</strong> Diego Gonçalves</p>
        <p><strong>Instância:</strong> Amazon Linux Web Server - AWS re/Start BRSAO215</p>
    </div>
</body>
</html>
EOF

systemctl start httpd
systemctl enable httpd
```

#### 🌐 Acesso ao servidor web com sucesso

<img width="1300" height="737" alt="11-acesso-web-server" src="https://github.com/user-attachments/assets/60c84856-a8b0-411f-9444-50acc9c4389d" />

---

### 5. 📦 Redimensionamento

* Tipo da instância alterado: `t3.micro` → `t3.small`

  <img width="1298" height="654" alt="13-instancia-alterada" src="https://github.com/user-attachments/assets/d0675265-658f-4df0-a34a-13fa5b4e20a8" />

* Volume EBS expandido: 8 GiB → 10 GiB

  <img width="1302" height="653" alt="14-volume-modificado" src="https://github.com/user-attachments/assets/8ab2aa78-0078-4f16-908c-bee73640f99d" />

---

### 6. 🔐 Teste da Proteção contra Término

* Tentativa de término da instância bloqueada

  <img width="1298" height="654" alt="15-falha-finalizacao-instancia" src="https://github.com/user-attachments/assets/a515e294-136e-41de-b384-40395c3be150" />

* Proteção desativada manualmente

  <img width="1298" height="654" alt="16-desativacao-manual" src="https://github.com/user-attachments/assets/f008f061-a98c-4f77-9003-f42d99a08180" />

* Remoção da proteção contra término

  <img width="1298" height="654" alt="17-remocao-protecao" src="https://github.com/user-attachments/assets/e0c9d520-87fc-4e5f-926d-822cc8bfec33" />

* Instância encerrada com sucesso

  <img width="1298" height="654" alt="18-instancia-finalizada" src="https://github.com/user-attachments/assets/bda2d4cd-9e8b-484e-8595-333c3bcb6198" />
