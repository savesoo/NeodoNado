<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-12-01
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>회원 정보 수정</title>

        <!-- Bootstrap core CSS -->
        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="/resources/css/edit.css" rel="stylesheet">

    </head>
    <body>

        <div class="container">
            <div class="main-div mb-2 col-md-12 mx-auto p-5">
                <h1 class="mb-3">내 정보 수정</h1>

                <form method="post">
                    <div class="mydiv mb-3">
                        <label class="form-label mt-3">아이디</label>
                        <input type="text" class="form-control" name="userId" value="${user.userId}" readonly>
                    </div>

                    <div class="mydiv mb-3">
                        <label class="form-label mt-2">닉네임</label>
                        <input type="text" class="form-control" name="nickname"  value="${user.nickname}">
                    </div>
                    <div class="mydiv mb-3">
                        <label class="form-label mt-2">거주 지역</label>
                        <input type="text" class="form-control" name="location"  value="${user.location}">
                    </div>
                    <div class="mydiv mb-3">
                        <label class="form-label mt-2">연락처 </label>
                        <input type="text" class="form-control" name="phone" value="${user.phone}">
                    </div>

                    <div class ="bir_wrap mb-3">
                        <label class="form-label mt-2 mt-3">생년월일</label>
                        <div class="bir_yy">
                            <span class="ps_box">
                                <input type="text" class="form-control" id="byear" name="byear" value="${user.byear!=0 ? user.byear : 0}">
                            </span>
                        </div>
                        <div class="bir_mm">
                            <span class="ps_box focus">
                            <select class="form-select form-control" id="bmonth" name="bmonth">
                                <c:forEach begin="1" end="12" var="bmonth">
                                    <option ${user.bmonth==bmonth ? 'selected' : ''}>${bmonth}</option>
                                </c:forEach>
                            </select>
                            </span>
                        </div>
                        <div class="bir_dd">
                            <span class="ps_box">
                                <input type ="text" class="form-control" id ="bday" name="bday" value="${user.bday!=0 ? user.bday : 0}">
                            </span>
                        </div>
                    </div>

                    <div class="d-grid gap-2 mb-3 mt-5">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">수정 완료</button>
                    </div>
                    <div class="d-grid gap-2 mb-3">
                        <a class="btn btn-secondary btn-lg btn-block" href="/user/mypage" >마이페이지로 돌아가기</a>
                    </div>
                </form>
            </div>

            <footer class="my-3 text-center text-small">
                <p class="mb-1">&copy; 2022 NDND</p>
            </footer>

        </div>


    <%--<h1>내 정보 수정</h1>--%>
    <%--    <form method="post">--%>
    <%--    <table>--%>
    <%--      <tr>--%>
    <%--        <td>아이디 </td>--%>
    <%--        <td>${user.userId}</td>--%>
    <%--      </tr>--%>
    <%--      <tr>--%>
    <%--        <td>닉네임 </td>--%>
    <%--        <td><input type="text" name="nickname" value="${user.nickname}"></td>--%>
    <%--      </tr>--%>
    <%--      <tr>--%>
    <%--        <td>지역 </td>--%>
    <%--        <td><input type="text" name="location" value="${user.location}"></td>--%>
    <%--      </tr>--%>
    <%--      <tr>--%>
    <%--        <td>핸드폰 </td>--%>
    <%--        <td><input type="text" name="phone" value="${user.phone}"></td>--%>
    <%--      </tr>--%>
    <%--      <tr>--%>
    <%--        <td>생년월일 </td>--%>
    <%--        <td>--%>
    <%--          <input type="number" name="byear" value="${user.byear!=0 ? user.byear : 0}">--%>
    <%--          <input type="number" name="bmonth" value="${user.bmonth!=0 ? user.bmonth : 0}">--%>
    <%--          <input type="number" name="bday" value="${user.bday!=0 ? user.bday : 0}">--%>
    <%--        </td>--%>
    <%--      </tr>--%>
    <%--      <tr>--%>
    <%--        <td></td>--%>
    <%--        <td><input type="submit" value="수정 완료"></td>--%>
    <%--      </tr>--%>

    <%--    </table>--%>

    <%--  </form>--%>

    <%--  <button><a href="/user/mypage">마이페이지로 돌아가기</a></button>--%>

    </body>
</html>
