<?php
session_start();
include("functions.php");
check_session_id();
?>

<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ファイルの保存（入力画面）</title>
</head>

<body>
    <!-- input type="file"の追加，actionの宛先変更，enctype属性の追加  -->
    <form method="post" action="create_file_act.php" enctype="multipart/form-data">
        <fieldset>
            <legend>ファイルの保存</legend>
            <!-- <div>
                todo: <input type="text" name="todo">
            </div>
            <div>
                deadline: <input type="date" name="deadline">
            </div> -->
            <div>
                <input type="file" name="upfile" accept="image/*" capture="camera">
            </div>

            <div>
                <button>submit</button>
            </div>
        </fieldset>
    </form>

</body>

</html>