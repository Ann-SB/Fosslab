<?php
if ($_POST['username']=="ann" && $_POST['password']=="qwerty") {
	echo("<h2>Welcome ".$_POST['username']."</h2>");
}
else {
	echo("<h2>You do not have access</h2>");
}
?>
