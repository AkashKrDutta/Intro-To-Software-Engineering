<!DOCTYPE html>
<html>
        <head>
                <title>Average and Feedbacks</title>
                <meta name="viewport" content = "width = device-width, initial-scale = 1">      
                <link rel = "stylesheet"
                        href = "https://fonts.googleapis.com/icon?family=Material+Icons">
                <link rel = "stylesheet"
                        href = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
                <script  type="text/javascript"
                        src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>           
                <script src = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js">
                </script>
		<style>
.collapsible {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #555;
}

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}
</style>           
        </head>


<body>

<?php
$servername = "10.42.0.52";
$username = "vm1";
$password = "vm1";
$dbname = "db1";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT AVG(q1) as q1, AVG(q2) as q2, AVG(q3) as q3, AVG(q4) as q4 FROM table1";
$result = $conn->query($sql);
echo "<h3> Numeral Feedbacks </h3>";
if ($result->num_rows > 0) {
    echo "<table><tr><th>Query</th><th>Average Response</th></tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>Are you satisfied with our products?</td> <td>" .$row[q1]. "</td></tr><tr><td>Do you find our products easy to use?</td><td>" . $row[q2]. "</td></tr><tr><td>How much impact our products have made on your daily routine?</td><td>" . $row[q3]. "</td></tr><tr><td>Would you recommend our products to your firends and family?</td><td>" . $row[q4]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "Error fetching values from SQL Table!";
}


echo "<h3> Textual Feedbacks </h3>";
$sql = "SELECT feed FROM table1";
$result = $conn->query($sql);
$count=1;
if ($result->num_rows > 0) {
    echo "<ol>";
    while($row = $result->fetch_assoc()) {
        echo "<li><details><summary> Feed: ". $count." Click to view!</summary>".$row[feed]."</details></li>";
	$count++;
    }
    echo "</ol>"; 
    
}
else {
    echo "No comments yet.</body></html>";
}


$conn->close();
?>

</body>
</html>

