<?php
// var_dump($_POST);
// exit();

// セッションの開始
session_start();
// 関数ファイル読み込み
include('functions.php');
// DB接続
$pdo = connect_to_db();

// データ受け取り→変数に入れる
$username = $_POST['username'];
$password = $_POST['password'];

// WHEREで条件を指定
$sql = 'SELECT * FROM user_config WHERE username=:username AND password=:password AND is_deleted=0';




$stmt = $pdo->prepare($sql);
$stmt->bindValue(':username', $username, PDO::PARAM_STR);
$stmt->bindValue(':password', $password, PDO::PARAM_STR);
$status = $stmt->execute();


if ($status == false) {
    $error = $stmt->errorInfo();
    echo json_encode(["error_msg" => "{$error[2]}"]);
    exit();
} else {
    $val = $stmt->fetch(PDO::FETCH_ASSOC);
    // var_dump($val);
    // exit();

    // session変数には必要な値を保存する(今回は管理者フラグとユーザ名).
    // 自身のアプリで使いたい値を保存しましょう!

    // 該当レコードだけ取得
    if (!$val) {
        // 該当データがないときはログインページへのリンクを表示
        echo "<p>ログイン情報に誤りがあります.</p>";
        echo '<a href="login.php">login</a>';
        exit();
    } else {
        // DBにデータがあればセッション変数に格納
        $_SESSION = array();
        // セッション変数を空にする
        $_SESSION["session_id"] = session_id();
        $_SESSION["is_admin"] = $val["is_admin"];
        $_SESSION["username"] = $val["username"];
        header("Location:input.php");
        // 一覧ページへ移動
        exit();
    }
}
