<?php
session_start();
unset($_SESSION['adminEmail']);
echo "<script>
location.assign('signin.php');
</script>";
?>