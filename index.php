<!DOCTYPE html>
<html>
<head>
<title>Acesso ao Sistema</title>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/w3.css">

<style>
.w3-theme {color:#fff !important;background-color:#0081c9ff !important}
</style>

</head>
<body>
<div class="w3-container w3-padding-16">
		<p></p>
	</div>
	<div class="w3-cotainer w3-theme">
		<img class="w3-margin-left" src="img/logo.png" alt="">
	</div>
<div class="w3-center w3-white w3-panel w3-card w3-padding-16 w3-display-middle">
	<form action="userauthentication.php" method="post">
		<img src="img/user_new.png" alt=""><br><br>
		<input class="w3-input" type="text" name="usuario" autofocus>
		<label>Usuário</label>
		<input class="w3-input" type="password" name="senha">
		<label>Senha</label><br><br>
		<input type="submit" value="Acessar --->">
	</form>
</div>
</body>
</html>