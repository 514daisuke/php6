<?php

function connect_to_db()
{
    // DB接続情報
    $dbn = 'mysql:dbname=gsacf_d08_05_prod;charset=utf8;port=3306;host=localhost';
    $user = 'root';
    $pwd = '';

    // DB接続 new PDOを returnする
    try {
        return new PDO($dbn, $user, $pwd);
    } catch (PDOException $e) {
        echo json_encode(["db error" => "{$e->getMessage()}"]);
        exit();
    }
}

// ログイン状態のチェック関数
function check_session_id()
{
    // 失敗時はログイン画面に戻る。 session_idがない。 idが一致しない
    if (
        !isset($_SESSION['session_id']) || $_SESSION['session_id'] != session_id()
    ) {
        // ログイン画面へ移動
        header('Location: login.php');
    } else {
        // セッションidの再生成
        session_regenerate_id(true);
        // セッション変数上書き
        $_SESSION['session_id'] = session_id();
    }
}

