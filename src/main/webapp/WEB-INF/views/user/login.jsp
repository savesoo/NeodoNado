<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-12-01
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.104.2">
        <title>로그인 페이지</title>

        <!-- Bootstrap core CSS -->
        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="/resources/css/signin.css" rel="stylesheet">

    </head>
    <body class="text-center">

    <main class="form-signin w-100 m-auto">
        <form method="post">
            <img class="mb-4" src="/resources/img/ps.png" alt="" width="80" height="57">
            <h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>

            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInput" name="userId" placeholder="ID 입력">
                <label for="floatingInput">아이디</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" name="userPw" placeholder="Password">
                <label for="floatingPassword">비밀번호</label>
            </div>

            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" name="rememberMe"> 다음부터 자동로그인
                </label>
            </div>

            <button class="w-100 btn btn-lg btn-outline-success p-1" style="margin: 2px" type="submit">로그인</button>
            <a href="/register" class="w-100 btn btn-lg btn-outline-secondary p-1" style="margin: 2px">회원 가입</a>


            <p class="mt-5 mb-3 text-muted">&copy; 2022~</p>
        </form>
    </main>


<%--        <form method="post">--%>

<%--            <table>--%>
<%--                <tr>--%>
<%--                    <td>아이디 </td>--%>
<%--                    <td> <input type="text" name="userId"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>비밀번호 </td>--%>
<%--                    <td><input type="password" name="userPw"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td></td>--%>
<%--                    <td>--%>
<%--                        <input type="submit" value="로그인">--%>
<%--                        <button><a href="/user/register">회원 가입</a></button>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td></td>--%>
<%--                    <td><input type="checkbox" name="rememberMe"> 다음부터 자동로그인</td>--%>
<%--                </tr>--%>
<%--            </table>--%>

<%--        </form>--%>

        <c:if test="${loginFailMsg ne null}">
            <script>
                alert('${loginFailMsg}');
            </script>
        </c:if>

        <c:if test="${regMsg ne null}">
            <script>
                alert('${regMsg}');
            </script>
        </c:if>

    </body>
</html>
