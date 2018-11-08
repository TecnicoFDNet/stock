<?php
include 'conect.php';
?>
<!DOCTYPE html>
<html>
<head>
<meta <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8"/>
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Authentication</title>
	<script>
		function loginsuccessfully(){
			setTimeout("window.location='main.php'",250);
		}
		function loginfailed(){
			setTimeout("window.location='index.php'",1500);
		}
	</script>
</head>
<body>
<div class="w3-container w3-display-middle w3-center w3-text-blue">
	<?php
	$usuario=$_POST['usuario'];	
	$senha=$_POST['senha'];
	$sql = "SELECT * from users where user = '$usuario' and pwd = '$senha'";
	$result = mysqli_query($conn, $sql);
	$row = mysqli_num_rows($result);

	if($row > 0){
	
		session_start();
		$_SESSION['usuario']=$_POST['usuario'];		
		$_SESSION['senha']=$_POST['senha'];
		echo "<script>loginsuccessfully()</script>";
		echo "redirecionando...";
	
	} else {
		echo "<script>loginfailed()</script>";
		echo "Usuário ou Senha incorreto... Aguarde...";
	}
	?>
<!--  <h1>Spinning Elements</h1>
  <p>Use the w3-spin class to spin an element 360 degrees:</p>-->
  <p><i class="fa fa-spinner w3-spin" style="font-size:32px"></i></p>
</div>
</body>
</html>