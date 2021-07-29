<?php
// セッションの開始
session_start();
// セッション変数を空の配列で上書き
$_SESSION = array();
if (isset($_COOKIE[session_name()])) {
    setcookie(session_name(), '', time() - 42000, '/');
}
session_destroy();
header('Location:login.php');
exit();

?>
