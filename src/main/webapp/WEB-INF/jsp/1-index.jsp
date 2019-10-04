<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Log in</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/pu_login.css">
    <link rel="icon" href="img/icon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon" />

    <script src="js/jQuery.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- 引入 ECharts 文件 -->
    <script src="js/echarts.min.js"></script>


</head>

<body>
<c:if test="${!empty error}">
    <script>
        alert("${error}");
        window.location.href="login.html";
    </script>
</c:if>

<div class="container margin-top70">
    <div class="row shake animated">
        <div class="col-md-offset-3 col-md-5 ">
            <div class="head-pic col-md-offset-3">
                <img src="img/img2.png" alt="" style="margin-left:-100px;">
            </div>
<%--            <form class="form-horizontal">--%>
            <div class="form-horizontal">
                <span class="heading">Log In To Libarary System</span>
                <div class="form-group">
                    <input type="text" class="form-control" id="inputEmail3" placeholder="PhoneNumber">
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group help">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="PassWord">
                    <i class="fa fa-lock"></i>
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <div class="checkbox text-left">
                    <label>
                        <input type="checkbox" id="remember">记住密码
                    </label>
                </div>
                <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
                <div class="form-group">
                    <button type="submit" id="loginButton" class="btn btn-default " style="width: 370px;">Log In</button>
                    <span class="text"><a href="Retrieve.html">Forget Password?</a></span>

                    <span class="text" style="margin-left: 150px"><a href="Register.html">Register now</a></span>
                </div>
<%--            </form>--%>
            </div>
        </div>
    </div>

    <script>
        $("#inputEmail3").keyup(function () {
                if(isNaN($("#inputEmail3").val())){
                    $("#info").text("提示:账号只能为数字");
                }
                else {
                    $("#info").text("");
                }
            });
        // 记住登录信息
        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', {
                username: username,
                password: password,
                remember: checked
            }, {expires: 30, path: ''})
        }
        // 若选择记住登录信息，则进入页面时设置登录信息
        function setLoginStatus() {
            var loginStatusText = Cookies.get('loginStatus')
            if (loginStatusText) {
                var loginStatus
                try {
                    loginStatus = JSON.parse(loginStatusText);
                    $('#inputEmail3').val(loginStatus.username);
                    $('#inputPassword3').val(loginStatus.password);
                    $("#remember").prop('checked',true);
                } catch (__) {}
            }
        }

        // 设置登录信息
        // setLoginStatus();        //??????????
        $("#loginButton").click(function () {
            var id =$("#inputEmail3").val();
            var passwd=$("#inputPassword3").val();
            var remember=$("#remember").prop('checked');
            if (id == '') {
                $("#info").text("提示:账号不能为空");
            }
            else if( passwd ==''){
                $("#info").text("提示:密码不能为空");
            }
            else if(isNaN( id )){
                $("#info").text("提示:账号必须为数字");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "/api/loginCheck",
                    data: {
                        id:id ,
                        passwd: passwd
                    },
                    dataType: "json",
                    success: function(data) {
                        if (data.stateCode.trim() === "0") {
                            $("#info").text("提示:账号或密码错误！");
                        } else if (data.stateCode.trim() === "1") {
                            $("#info").text("提示:登陆成功，跳转中...");
                            window.location.href="/1-admin-index.html";
                        } else if (data.stateCode.trim() === "2") {
                            if(remember){
                                rememberLogin(id,passwd,remember);
                            }else {
                                Cookies.remove('loginStatus');
                            }
                            $("#info").text("提示:登陆成功，跳转中...");
                            window.location.href="/reader_main.html";

                        }
                    }
                });
            }
        })

    </script>

</div>
</body>

</html>
