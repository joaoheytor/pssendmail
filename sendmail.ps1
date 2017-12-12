# Script para Envio de E-mail Autenticado

# E-mail do REMETENTE
$FROMEmail = "teste@joaoheytor.com"

# Senha deste e-mail
$FROMPassword = "123mudar"

# E-mail do DESTINATÁRIO
$TOEmail = "teste@joaoheytor.com"

# Emdereço do Servidor SMTP
$SMTPServer = "smtp.joaoheytor.com"

# Porta do Servidor SMTP
$SMTPPort = "587"

# Iniciando a função SendMail. Está função terá dois parametros que serão usados quando formos enviar o e-mail, são eles: ASSUNTO e CORPO DO E-MAIL
function SendMail($subject, $body){
  # Vamos criar uma nova instância do SMTPClient, responsável por fazer a mágica do envio de e-mail pelo .NET 
  $SMTPSend = New-Object Net.Mail.SmtpClient($SMTPServer, $SMTPPort)
  
  # Caso seu e-mail exija SSL, aqui deverá ser alterado para $true
  $SMTPSend.EnableSsl = $false

  # Devemos criar uma nova instação do NetworkCredential para podermos informar as credenciais que serão usadas para se autenticar no servidor SMTP
  $SMTPSend.Credentials = New-Object System.Net.NetworkCredential($FROMEmail, $FROMPassword)

  # Por fim, chamamos o metódo Send e passamos todos os parametros declarados e/ou coletados nos passos acima
  $SMTPSend.Send($FROMEmail, $TOEmail, $subject, $body)
}

# Agora basta chamar a função SendMail e passar os parametros ASSUNTO (Subject) e o CORPO DO E-MAIL (BODY)
SendMail -subject "Testando" -body "Isso é um teste de envio de e-mail"
