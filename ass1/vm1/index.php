<!DOCTYPE html>  
<html>
<head>
  <link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body>  

<?php
$servername = "10.42.0.52";
$username = "vm1";
$password = "vm1";
$dbname = "db1";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($_SERVER["REQUEST_METHOD"] == "POST") {

  $q1 = $_POST["question_1"]+1;
  $q2 = $_POST["question_2"]+1;
  $q3 = $_POST["question_3"]+1;
  $q4 = $_POST["question_4"]+1;
  $feed = $_POST["feedback"];


  if ($feed != ''){
	  $sql = "INSERT INTO table1
	  VALUES ('".$q1."','".$q2."','".$q3."','".$q4."','".$feed."')";
	  if ($conn->query($sql) === TRUE) {
	      echo "Data was recorded successfully <br>";
	  } else {
	      echo "Error adding data: " . $conn->error . " <br>";
		echo $q1;
	  }
  }


}



$conn->close();
?>

<button type="button" onclick="location.href = './index.html';">Close</button>
</body>
</html>

