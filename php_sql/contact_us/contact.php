<!DOCTYPE HTML>  
<html>
	<head>
		<style type="text/css">
			.error {
				color: #FF0000;
			}
		</style>
	</head>

	<body> 
		<?php
			$server = "localhost"; $port = "3306"; $user = "root"; $pass = "root"; $db = "contact_db";
			$conn = new mysqli("$server:$port", $user, $pass);
			$db_selected = mysql_select_db($db, $conn);
			if ($conn->connect_error) {
				die("Connection failed: " . $conn->connect_error);
			}
			echo "Connected successfully";
	
			$sql = "CREATE DATABASE IF NOT EXISTS contact_db";
			$sql = "CREATE TABLE IF NOT EXISTS contact_table (
						id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
						name VARCHAR(50) NOT NULL,
						email VARCHAR(50) NOT NULL,
						comment VARCHAR(1000),
						send_date TIMESTAMP
						)"
		?>

		<?php
			$name = ""; $nameErr = ""; $email = ""; $emailErr = ""; $comment = ""; $subject = "Email from " + $name; $header = "From: " + $email;
			if ($_SERVER["REQUEST_METHOD"] == "POST") {
				if (empty($_POST["name"])) {
					$nameErr = "Name is required";
				}
				else {
					$name = test_input($_POST["name"]);
					if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
						$nameErr = "Only letters and white space allowed"; 
					}
				}
  
				if (empty($_POST["email"])) {
					$emailErr = "Email is required";
				}
				else {
					$email = test_input($_POST["email"]);
					if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
						$emailErr = "Invalid email format"; 
					}
				}
				if (empty($_POST["comment"])) {
					$comment = "";
				}
				else {
				$comment = test_input($_POST["comment"]);
				}
				mail("mail@igtech.co", $subject, $comment, $header);
				$sql = "INSERT INTO contact_table(name, email, comment, send_date)
							VALUES('$name', '$email', '$comment', now())";
			}
		?>

		<h2>Contact Us</h2>
		<p><span class="error">* required field.</span></p>

		<form method="post" action="sent.php">  
			Name: <input type="text" name="name" value="<?php echo $name;?>"><span class="error">* <?php echo $nameErr;?></span><br><br>
			E-mail: <input type="text" name="email" value="<?php echo $email;?>"><span class="error">* <?php echo $emailErr;?></span><br><br>
			Comment: <textarea name="comment" rows="5" cols="40"><?php echo $comment;?></textarea><br><br>
			<input type="submit" name="submit" value="Submit"> 
		</form>
	</body>
</html>
