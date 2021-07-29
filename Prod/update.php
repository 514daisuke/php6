<?php
// セッションの開始
session_start();
// 関数ファイル読み込み
include('functions.php');
// idチェック関数の実行
check_session_id();

$pdo = connect_to_db();

// 各値をpostで受け取る
$recoder = $_POST['recoder'];
$memo = $_POST['memo'];
$id = $_POST['id'];

// var_dump($id);
// exit();

// idを指定して更新するSQLを作成(UPDATE文)
$sql = 'UPDATE user_tabel SET recoder=:recoder, memo=:memo, updated_at=sysdate() WHERE id=:id';
// var_dump($sql);
// exit();

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':recoder', $recoder, PDO::PARAM_STR);
$stmt->bindValue(':memo', $memo, PDO::PARAM_STR);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$status = $stmt->execute();

// // 各値をpostで受け取る
if ($status == false) {
    // SQL実行に失敗した場合はここでエラーを出力し，以降の処理を中止する
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    // 正常に実行された場合は一覧ページファイルに移動し，処理を実行する
    header("Location:read.php");
    exit();
}
?>