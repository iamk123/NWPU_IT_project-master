<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="icon" href="img/icon.png" type="image/x-icon" />
    <link rel="shortcut icon" href="img/icon.png" type="image/x-icon" />

    <script src="js/jQuery.js"></script>
    <script src="js/bootstrap.js"></script>
    <style>
        body {
            /*background-image: url(img/beijing.jpg)*/
        }

        #a1 {

            top: -3px;
        }

        #b1 {
            position: absolute;
            left: 20px;
            right: 20px;
        }

        #q1 {
            margin-left: 400px;
        }

        #c1 {
            position: absolute;
            top: 0px;
            left: 0px;


        }

        #b4 {
            position: absolute;
            top: 175px;
            left: 450px;
            width: 800px;

        }

        #b7 {
            width: 500px;
        }

        #left {
            position: absolute;
            left: 20px;
            top: 300px;
            width: 600px;
        }

        #right {
            position: absolute;
            top: 300px;
            left: 650px;

            width: 850px;
        }

        .l1 {
            padding-left: 60px;

        }

        #l0 {
            margin-left: 600px;
            margin-top: -30px;
        }

        #l9 {
            margin-top: -20px;
            margin-left: 440px;
        }

        #m1 {
            width: 200px;
            position: absolute;
            right: 100px;
            top: 40px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#fine").focus(function (e) {
                $("#fine").blur(function (e) {
                    console.log($("#fine").text());
                });
            });
            $("#margin").focus(function (e) {
                $("#margin").blur(function (e) {
                    console.log($("#margin").text());
                });
            });
            $("#limit").focus(function (e) {
                $("#limit").blur(function (e) {
                    console.log($("#limit").text());
                });
            });

        });
    </script>
    <title>Admin Index</title>
</head>

<script type="text/javascript">
    $(function () {
        // 方法一：
        var settings = {
            "url": "http://localhost:8080/getAllLibrarian",
            "method": "GET",
            "timeout": 0,
        };

        $.ajax(settings).done(function (response) {
            console.log(response);
        });
        console.log("end");

        // 方法二：
        // $.ajax({
        //     type: "GET",
        //     url: "http://localhost:8080/getAllLibrarian",
        //     dataType: "text",
        //     success: function(data) {
        //         console.log(data)
        //     },
        //     error: function () {
        //         console.log("error1")
        //     }
        // });

        // 方法三：
        // $.ajax({
        //     url : "http://localhost:8080/getAllLibrarian",
        //     type : "GET", // 采用post方法
        //     dataType : "text", // 请求和返回的参数格式；如果是非json格式需要使用text格式
        //     // 当接口调用成功时，执行success中的方法，result参数指的是接口返回的信息
        //     success : function(result) {
        //         console.log(result)
        //     },
        //     // 当接口调用失败时，执行error中的方法
        //     error : function() {
        //         alert("服务器忙……请稍后重试1234！");
        //     }
        // });
    })
</script>

<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand " href="index.html"><span class="glyphicon glyphicon-book" aria-hidden="true"
                                                             id="a1">
                        Index</span></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="CreateLibrarian.html">Create Librarian</a></li>

            </ul>
            <form class="navbar-form navbar-left" style="margin-left: 300px;">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">

                <li><a href="ModifyPassword.html">Modify Password</a></li>
                <li><a href="../../Public/html/login.html">Log out</a></li>
                <li><a href="index.html">Hello,<strong>${admin.username}!</strong></a></li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="jumbotron" id="b1">
    <img src="img/img2.png" alt="" id="c1">

    <h1 id="q1">Welcome to Library.CMS!</h1>
    <table class="table" id="m1">
        <tr>
            <td>Librarian Fine:</td>
            <td contenteditable="true" id="fine">#</td>
        </tr>
        <tr>
            <td>Librarian Margin:</td>
            <td contenteditable="true" id="margin">#</td>
        </tr>
        <tr>
            <td>Librarian Limit:</td>
            <td contenteditable="true" id="limit">#</td>
        </tr>
    </table>

</div>

<div class="panel panel-default" id="left">
    <!-- Default panel contents -->
    <div class="panel-heading">
        <strong>Librarian List.</strong>
        <button type="submit" class="btn btn-default" id="l9"><a href="">Delete</a></button>
    </div>

    <!-- Table -->
    <table class="table table-hover table-striped table-bordered">
        <tr>
            <th>Librarian Id</th>
            <th>Librarian Name</th>
            <th style="padding-left:45px;">Delete</th>
        </tr>
        <tr>
            <td><a href="AlterLibrarian.html">#</a></td>
            <td><a href="AlterLibrarian.html">#</a></td>
            <td>
                <span class="l1 "><input type="checkbox" aria-label="..."></span>
            </td>
        </tr>
        <tr>
            <td><a href="AlterLibrarian.html">#</a></td>
            <td><a href="AlterLibrarian.html">#</a></td>
            <td>
                <span class="l1 "><input type="checkbox" aria-label="..."></span>
            </td>
        </tr>
<%--        <c:forEach items="${Librarian}" var="admin">--%>
<%--            <tr>--%>
<%--                <td><c:out value="${admin.adminId}"></c:out></td>--%>
<%--                <td><c:out value="${admin.username}"></c:out></td>--%>
<%--                <td><c:out value="${admin.password}"></c:out></td>--%>
<%--                <td><c:out value="${admin.roles}"></c:out></td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
    </table>
</div>

<div class="panel panel-default" id="right">
    <!-- Default panel contents -->
    <div class="panel-heading">
        <strong>Librarian Retrieve Password Order List.</strong>
        <button type="submit" class="btn btn-default" id="l0"><a href="">Send</a></button>
    </div>

    <!-- Table -->
    <table class="table table-hover table-striped table-bordered">
        <tr>
            <th>Order UserId</th>
            <th>Order Name</th>
            <th>Send Email</th>
        </tr>
        <tr>
            <td>#</td>
            <td>#</td>
            <td>
                <span class="l1 "><input type="checkbox" aria-label="..."></span>
            </td>
        </tr>
        <tr>
            <td>#</td>
            <td>#</td>
            <td>
                <span class="l1 "><input type="checkbox" aria-label="..."></span>
            </td>
        </tr>
    </table>
</div>
</body>

</html>