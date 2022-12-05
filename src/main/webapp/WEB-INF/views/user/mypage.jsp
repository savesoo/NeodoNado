<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-11-30
  Time: 오후 6:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Page</title>

        <!-- Bootstrap core CSS -->
        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="/resources/css/mypage.css" rel="stylesheet">

    </head>
    <body>

        <div class="container">

            <div class="main-div mb-2 col-md-12 mx-auto p-5">
                <h1>내 정보 보기</h1>
                <div>
                    <c:if test="${loginInfo != null}">
                        <div class="mydiv mb-3">
                            <label class="form-label mt-3">내 가입날짜</label>
                            <input type="text" id="joinDate" name="joinDate" value="${user.joinDate}" readonly>
                        </div>
                        <div class="mydiv mb-3">
                            <label for="userId" class="form-label mt-3">아이디</label>
                            <input type="text"id="userId" name="userId"  value="${user.userId}" readonly>
                        </div>
                        <div class="mydiv mb-3">
                            <label for="nickname" class="form-label mt-3">닉네임</label>
                            <input type="text" id="nickname" name="nickname"  value="${user.nickname}" readonly>
                        </div>
                        <div class="mydiv mb-3">
                            <label for="location" class="form-label mt-3">지역</label>
                            <input type="text" id="location" name="location"  value="${user.location}" readonly>
                        </div>
                    </c:if>
                </div>

                <div class="button-wrap text-align: center m-auto mb-2 p-3">
                    <div class="p-3">
                        <div class="w-100 d-grid gap-2 mb-3">
                            <a href="/user/edit" class="btn btn-primary col-md-6 btn-block" type="button">내 정보 수정</a>
                        </div>
                        <div class="w-100 d-grid gap-2 mb-3">
                            <a href="/login" class="btn btn-primary col-md-6 btn-secondary p-1">이전 화면으로</a>
                        </div>
                    </div>

                    <div class="w-100 mb-3 p-3">
                        <div class="d-grid gap-2 mb-3">
                            <a href="/logout" class="btn btn-primary col-md-6 btn-danger" type="button">로그아웃</a>
                        </div>
                        <div class="w-100 d-grid gap-2 mb-3">
                            <a class="btn btn-primary col-md-6 btn-dark p-1">내가 작성한 글</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>



<%--        <h1>마이페이지</h1>--%>

<%--            <table>--%>
<%--                <c:if test="${loginInfo != null}">--%>
<%--                <tr>--%>
<%--                    <td>내 가입날짜 </td>--%>
<%--                    <td>${user.joinDate}</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>아이디 </td>--%>
<%--                    <td><input type="text" name="userId" value="${user.userId}" readonly></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>닉네임 </td>--%>
<%--                    <td><input type="text" name="nickname" value="${user.nickname}" readonly></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>지역 </td>--%>
<%--                    <td><input type="text" name="location" value="${user.location}" readonly></td>--%>
<%--                </tr>--%>
<%--                </c:if>--%>
<%--            </table>--%>

<%--        <form action="/user/edit">--%>
<%--            <input type="submit" value="내 정보 수정">--%>
<%--        </form>--%>

<%--        <button><a href="#">내가 작성한 글</a></button>--%>
<%--        <button><a href="/board/saleList">이전 화면으로</a></button>--%>
<%--        <br>--%>

<%--        <form>--%>
<%--            <input type="submit" value="회원 탈퇴">--%>
<%--        </form>--%>
<%--        <form action="/user/logout">--%>
<%--            <input type="submit" value="로그아웃">--%>
<%--        </form>--%>



    </body>
</html>
