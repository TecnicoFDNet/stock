<?php
session_start();
	if(!isset($_SESSION['usuario'])){
		header("Location: index.php"); 
		exit;
	}else{
	}
?>
<?php
include 'conect.php';
?>
<!DOCTYPE html>
<html>
	<head>
		<title>::::FDNet::::</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
		<link rel="stylesheet" href="css/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
			.mySlides {display:none}
			.w3-left, .w3-right, .w3-badge {cursor:pointer}
			.w3-badge {height:13px;width:13px;padding:0}
			.w3-theme {color:#fff !important;background-color:#0081c9ff !important}
			.w3-theme-d1 {color:#585c5f !important; background-color:#a2a5a9 !important}
		</style>
	</head>	<body>
	<!--INICIO HEADER-->
		<header class="w3-container w3-theme">
			<h3>::CONTROLE DE MATERIAIS::</h3>
			<div class="w3-bar w3-theme">
				<a href="#" class="w3-bar-item w3-button">Home</a>
				<!--<a href="#" class="w3-bar-item w3-button w3-hide-small">Cadastrar</a>-->
				<div class="w3-dropdown-hover">
	    			<button class="w3-button">Cadastrar <i class="fa fa-caret-down"></i></button>
	    			<div class="w3-dropdown-content w3-bar-block">
		      			<a href="#" class="w3-bar-item w3-button">Airgrid</a>
		      			<a href="#" class="w3-bar-item w3-button">LiteBeam M5</a>
		      			<a href="#" class="w3-bar-item w3-button">LiteBeam AC 23</a>
		      			<a href="#" class="w3-bar-item w3-button">LiteBeam AC Gen2</a>
		    		</div>
	  			</div>
				<a href="#" class="w3-bar-item w3-button w3-hide-small">Consultar</a>
				<!--<a href="#" class="w3-bar-item w3-button w3-hide-small">Atualizar</a>-->
				<a href="logout.php" class="w3-bar-item w3-button w3-hide-small w3-hover-red">Sair</a>
				<a href="logout.php" class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white"><i class="fa fa-sign-in"></i></a>
				<a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
			</div>
			<div id="demo" class="w3-bar-block w3-theme w3-hide w3-hide-large w3-hide-medium">
				<!--<a href="#" class="w3-bar-item w3-button">Cadastrar</a>-->
				<a href="#" class="w3-bar-item w3-button">Consultar</a>
				<!--<a href="atualizar.php" class="w3-bar-item w3-button">Atualizar</a>-->
				<a href="logout.php" class="w3-bar-item w3-button w3-hover-red">Sair</a>
			</div>
				<script>
					function myFunction() {
						var x = document.getElementById("demo");
						if (x.className.indexOf("w3-show") == -1) {
							x.className += " w3-show";
						} else { 
							x.className = x.className.replace(" w3-show", "");
						}
					}
				</script>
		</header>
	<!--FIM HEADER-->

	<!--INICIO CONTEUDO-->
	<div class="w3-content">
		<div class="w3-container">
			<h2>Controle de Equipamentos</h2>
			<p>Abaixo segue os principais equipamentos utilizados na FDNet para instalação Rádio</p>
		</div>

		<div class="w3-row-padding w3-padding-16 w3-center" id="food">
			<div class="w3-quarter">
				<a href="#"><img src="img/antena/airgrid.png" alt="Airgrid" style="width:90%"></a>
				<p>Airgrid</p>
			</div>
			<div class="w3-quarter">
				<a href="#"><img src="img/antena/litebeamM5.png" alt="LiteBeam" style="width:90%"></a>
				<p>LiteBeam M5</p>
			</div>
			<div class="w3-quarter">
				<a href="#"><img src="img/antena/litebeam5AC23.png" alt="LitebeamAC23" style="width:90%"></a>
				<p>LiteBeam AC 23</p>
			</div>
			<div class="w3-quarter">
				<a href="#"><img src="img/antena/litebeam5ACGen2.png" alt="Litebeam AC Gen2" style="width:90%"></a>
				<p>LiteBeam AC Gen2</p>
			</div>
		</div>
	<!--INICIO INFORMACOES FUTURAS	
		<div class="w3-section w3-container">
			<div class="w3-card-2">
				<div class="w3-container w3-white">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				</div>  
			</div>
		</div>
		<div class="w3-section w3-container">
			<div class="w3-card-2">
				<div class="w3-container w3-white">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
					<p>Today</p>
				</div>
			</div>
		</div>
	FIM INFORMACAOES FUTURAS-->
		<div class="w3-section w3-container w3-center">
			<div class="w3-card">
					<p>Usuários Cadastrados no Sistema </p>
				<div class="w3-section w3-container">
					<?php
						$sql = "SELECT Idusers, user FROM users";
						$result = $conn->query($sql);
						if ($result->num_rows > 0) {
							echo "<table><tr><th>ID</th><th>Usuário</th><th>Tipo de Acesso</th></tr>";
						while($row = $result->fetch_assoc()) {
							echo "<tr><td>".$row["Idusers"]."</td><td>".$row["user"]."</td></tr>";
						}
						echo "</table>";
						} else {
						echo "Sem Usuários";
						}
					?>
				</div>
			</div>
		</div>
	</div>
	<!--FIM CONTEUDO-->
		<footer class="w3-container w3-theme-d1 w3-center">
			<p>Powered by FDNet 2018&copy;</p>
		</footer>
	</body>
</html>