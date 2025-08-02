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

