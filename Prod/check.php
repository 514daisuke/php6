<?php
// まずはこれ
// var_dump($_GET);
// exit();

session_start();
// 関数ファイルの読み込み
include('functions.php');
check_session_id();

// DB接続
$pdo = connect_to_db();

// GETデータ取得
$user_id = $_GET['user_id'];

// SQL作成件数処理
// いいね状態のチェック(COUNTで件数を取得できる!)
$sql = 'SELECT COUNT(*) FROM check_table WHERE user_id=:user_id';
// $sql ='INSERT INTO check_table(id, user_id, created_at) VALUES(NULL, :user_id,sysdate())';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':user_id', $user_id, PDO::PARAM_INT);

$status = $stmt->execute();

if ($status == false) {
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
// エラー処理
} else {
    $like_count = $stmt->fetch();
    // var_dump($like_count);
    // exit();

    // いいねしていれば削除，していなければ追加のSQLを作成
if ($like_count[0] != 0) {
    $sql = 'DELETE FROM check_table WHERE user_id=:user_id';
} else {
    // SQL文は1行にまとめる
    $sql = 'INSERT INTO check_table(id, user_id, created_at) VALUES(NULL, :user_id,sysdate())';
}
    // INSERTのSQLは前項で使用したものと同じ!
    // 以降(SQL実行部分と一覧画面への移動)は変更なし!
    $stmt = $pdo->prepare($sql);
    $stmt->bindValue(':user_id', $user_id, PDO::PARAM_INT);

    $status = $stmt->execute();

    if ($status == false) {
        $error = $stmt->errorInfo();
        echo json_encode(["error_msg" => "{$error[2]}"]);
        exit();
    } else {
        header("Location:read.php");
        exit();
    }
}
