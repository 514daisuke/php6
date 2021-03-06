<?php
var_dump($_POST)
exit();

// セッションの開始
session_start();
// 関数ファイル読み込み
include('functions.php');
// idチェック関数の実行
check_session_id();

if (
    !isset($_POST['username']) || $_POST['username'] == '' ||
    !isset($_POST['username']) || $_POST['username'] == ''
) {
    echo json_encode(["error_msg" => "no input"]);
    exit();
}

$username = $_POST["username"];
$password = $_POST["password"];

$pdo = connect_to_db();

$sql = 'SELECT COUNT(*) FROM user_config WHERE username=:username';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':username', $username, PDO::PARAM_STR);
$status = $stmt->execute();

if ($status == false) {
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
}

if ($stmt->fetchColumn() > 0) {
    echo "<p>すでに登録されているユーザです．</p>";
    echo '<a href="login.php">login</a>';
    exit();
}

$sql = 'INSERT INTO user_config(id, username, password, is_admin, is_deleted, created_at, updated_at) VALUES(NULL, :username, :password, 0, 0, sysdate(), sysdate())';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':username', $username, PDO::PARAM_STR);
$stmt->bindValue(':password', $password, PDO::PARAM_STR);
$status = $stmt->execute();

if ($status == false) {
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    header("Location:login.php");
    exit();
}
