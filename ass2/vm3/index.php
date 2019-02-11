
<!DOCTYPE HTML>
<html>
<body>
<?php
$freq="5";
if ($_SERVER["REQUEST_METHOD"] == "POST"){
	$freq = $_POST["freq"];
	echo "Current freq (default 5 secs): ";
	echo $freq;
	exec("pkill vm3");
	shell_exec("/var/www/html/vm3.sh ".$freq." >/dev/null &");	
}
?>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
Frequency (IN SECS): <input type="text" name="freq"> <br>
<input type="submit" name="submit" value="Update!">
</form>

<?php
	
?>

<iframe src="./output.html" id="myIframe"></iframe>
<script>
window.setInterval("reloadIFrame();", 2000);
function reloadIFrame() {
 document.getElementById("myIframe").src="./output.html";
}
</script>

</body>
</html>

