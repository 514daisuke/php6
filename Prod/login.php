<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
    <!-- <img src="../2021Prod/image/Logo.png" alt=""> -->
    <script src="https://cdn.rawgit.com/dropbox/zxcvbn/v1.0/zxcvbn.js"></script>
    <script src="https://cdn.rawgit.com/kimmobrunfeldt/progressbar.js/0.6.1/dist/progressbar.js"></script>
    <script src="../2021Prod/js/progressbar.js"></script>
    <title>KakeH@shiログイン</title>
</head>

<body>
    <form action="login_act.php" method="POST">
        <fieldset>
            <legend>KakeH@shiログイン</legend>
            <div>
                username: <input type="text" name="username">
            </div>

            <div>
                password:<input id="password" required type="password" name="password" class="form-control">
                <span id="btnEye" class="fa fa-eye" onclick="pushHideButton()"></span>
                <!-- id=password-labelで強さのグラデーションをコントロール -->
                <label id="password-label" alt="New password" placeholder="New password" data-info="Very weak"></label>
                <!-- パスワードのprogressbar-->
                <div class="progress" id="strength-bar"></div>
            </div>

            <div>
                <button>Login</button>
            </div>
            <a href="register.php">新規ログイン</a>
        </fieldset>
    </form>

</body>

<script>
    function pushHideButton() {
        var txtPass = document.getElementById("password");
        var btnEye = document.getElementById("btnEye");
        if (txtPass.type === "text") {
            txtPass.type = "password";
            btnEye.className = "fa fa-eye";
        } else {
            txtPass.type = "text";
            btnEye.className = "fa fa-eye-slash";
        }
    }
</script>


</html>