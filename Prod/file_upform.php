<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>ファイルのアップロード</title>
</head>

<body>
    <form action="file_upload.php" method="POST" enctype="multipart/form-data">
        <fieldset>
            <legend>ファイルアップロード</legend>
            <div>
                <!-- // 使用時には「enctype="multipart/form-data"」が必須!!
         // methodはpostを使用!getだと容量不足の可能性が...!
        -->
                <input type="file" name="upfile" accept="image/*" capture="camera">
    </form>
    </div>
    <div>
        <button>submit</button>
    </div>
    </fieldset>
    </form>

</body>

</html>