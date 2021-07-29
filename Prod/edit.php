<?php
// var_dump($GET);
// exit();

// セッションの開始
session_start();
// 関数ファイル読み込み
include('functions.php');
// idチェック関数の実行
check_session_id();

$pdo = connect_to_db();


// 送信されたidをgetで受け取る
$id = $_GET['id'];

// 現在のテーブル情報を取得する WHERE id=:id' そのidだけを取得する
$sql = 'SELECT * FROM user_tabel WHERE id=:id';

$stmt = $pdo->prepare($sql);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$status = $stmt->execute();

// fetch()で1レコード取得できる.
if ($status == false) {
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    // １件だけならfetch 多くの場合はfetch_all
    $record = $stmt->fetch(PDO::FETCH_ASSOC);
}

?>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>利用者情報情報（編集画面）</title>
</head>

<body>
    <form action="update.php" method="POST">
        <fieldset>
            <legend>利用者情報情報（編集画面）</legend>
            <a href="read.php">一覧画面</a>
            <!-- htmlのタグに初期値として設定 -->
            <div>
                記録者: <input type="text" name="recoder" value="<?= $record["recoder"] ?>">
            </div>
            <div>
                記録:<input class="note" type="text" name="memo" value="<?= $record["memo"] ?>" rows="3" cols="30">

            </div>
            <input type="hidden" name="id" value="<?= $record["id"] ?>">
            <div>
                <button>再記録</button>
            </div>
        </fieldset>
    </form>

</body>

</html>