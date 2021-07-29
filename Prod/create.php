<?php
// var_dump($_POST);
// exit();

// セッションの開始
session_start();
// 関数ファイル読み込み
include('functions.php');
// idチェック関数の実行
check_session_id();

$pdo = connect_to_db();

// データのチェック
if (
    !isset($_POST['no']) || $_POST['no'] == '' ||
    !isset($_POST['date']) || $_POST['date'] == '' ||
    !isset($_POST['name']) || $_POST['name'] == '' ||
    // !isset($_POST['kana']) || $_POST['kana'] == '' ||
    !isset($_POST['birthday']) || $_POST['birthday'] == '' ||
    !isset($_POST['recoder']) || $_POST['recoder'] == '' ||
    !isset($_POST['memo']) || $_POST['memo'] == ''
) {
    exit('ParamError');
}

//入力
$no = $_POST['no'];
$day = $_POST['date'];
$name = $_POST['name'];
$birthday = $_POST['birthday'];
$recoder = $_POST['recoder'];
$memo = $_POST['memo'];



// SQL文
// $sql = 'INSERT INTO contract_user(id, name, gender, created_at, updated_at) VALUES(NULL, :name, :gender, sysdate(), sysdate())';
$sql = 'INSERT INTO `user_tabel`(`id`, `no`,`date`, `name`, `birthday`, `recoder`, `memo`, `created_at`, `updated_at`)  VALUES (NULL, :no, :date, :name, :birthday, :recoder, :memo, sysdate(), sysdate())';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':no', $no, PDO::PARAM_STR);
$stmt->bindValue(':date', $day, PDO::PARAM_STR);
$stmt->bindValue(':name', $name, PDO::PARAM_STR);
$stmt->bindValue(':birthday', $birthday, PDO::PARAM_STR);
$stmt->bindValue(':recoder', $recoder, PDO::PARAM_STR);
$stmt->bindValue(':memo', $memo, PDO::PARAM_STR);


// SQLを実行
$status = $stmt->execute();

if ($status == false) {
    // データ登録失敗次にエラーを表示
    exit('sqlError:' . $error[2]);
    $error = $stmt->errorInfo();
} else {
    // 登録ページへ移動
    header('Location:input.php');
}
?>