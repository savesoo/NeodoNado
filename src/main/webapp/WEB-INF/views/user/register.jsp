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
        <title>회원 가입</title>

        <!-- Bootstrap core CSS -->
<%--        <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">

    </head>
    <body >

        <div class="container">
            <div class="input-form-backgroud row">
                <div class="input-form col-md-12 mx-auto p-4">
                    <h4 class="mb-3 p-4">회원가입</h4>
                    <form method="post" class="validation-form" novalidate>
                        <div class="form-group col-md-6 mb-2">
                            <label for="userId" class="form-label mt-4">아이디</label>
                            <input type="text" class="form-control" id="userId" name="userId" aria-describedby="emailHelp" required>
                            <div class="invalid-feedback"> 아이디를 입력해주세요. </div>
                        </div>
                        <div class="form-group col-md-6 mb-2">
                            <label class="form-label mt-4" for="userPw">비밀번호</label>
                            <input type="password" class="form-control" id="userPw" name="userPw" required>
                            <div class="valid-feedback"></div>
                        </div>

                        <div class="form-group col-md-6 mb-2">
                            <label class="form-label mt-4" for="inputInvalid">비밀번호 재확인</label>
                            <input type="password" class="form-control" id="inputInvalid">
                            <div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
                        </div>
                        <div class="form-group col-md-6 mb-2">
                            <label for="nickname" class="form-label mt-4">닉네임</label>
                            <input type="text" class="form-control" id="nickname" name="nickname" aria-describedby="emailHelp" required>
                            <div class="invalid-feedback"> 닉네임을 입력해주세요. </div>
                        </div>
                        <div class="form-group col-md-6 mb-2">
                            <label for="location" class="form-label mt-4">거주 지역</label>
                            <input type="text" class="form-control" id="location" name="location" placeholder="ex) 노원구, 서초구 " maxlength="5" required>
                            <div class="invalid-feedback"> 거주 지역을 입력해주세요. </div>
                        </div>
                        <div class="form-group col-md-6 mb-2">
                            <label for="phone" class="form-label mt-4">연락처 </label>
                            <input type="text" class="form-control" id="phone">
                        </div>

                        <div class ="bir_wrap col-md-6 mb-3">
                            <label class="form-label mt-4 mb-3">생년월일</label>
                            <div class="bir_yy mb-3">
                                <span class="ps_box">
                                    <input type="text" class="form-control" id="byear" name="byear" placeholder="태어난 년도(4자리)" maxlength="4">
                                </span>
                            </div>
                            <div class="bir_mm mb-3">
                                <span class="ps_box focus">
                                    <select class="form-select form-control" id="bmonth" name="bmonth" >
                                        <option>태어난 달(월)</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                        <option>10</option>
                                        <option>11</option>
                                        <option>12</option>
                                     </select>
                                </span>
                            </div>
                            <div class="bir_dd mb-3">
                                <span class="ps_box">
                                    <input type ="text" class="form-control" id ="bday" name="bday" placeholder="태어난 날짜" maxlength="2">
                                </span>
                            </div>
                        </div>
                        <div class="d-grid gap-2 col-md-6 mb-3">
                            <button class="btn btn-primary btn-lg btn-block" type="submit">가입하기</button>
                        </div>

                    </form>
                </div>
                <footer class="my-3 text-center text-small">
                    <p class="mb-1">&copy; 2022 PM</p>
                </footer>
            </div>
        </div>


        <script>
            window.addEventListener('load', () => {
                const forms = document.getElementsByClassName('validation-form');

                Array.prototype.filter.call(forms, (form) => {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }

                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        </script>



<%--        <main class="form-signin w-100 m-auto">--%>
<%--        <form method="post">--%>
<%--            <h1 class="h3 mb-3 fw-normal">회원 가입</h1>--%>

<%--            <table>--%>
<%--                <tr>--%>
<%--                    <td>아이디 </td>--%>
<%--                    <td><input type="text" name="userId" placeholder="아이디 입력"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>비밀번호 </td>--%>
<%--                    <td><input type="password" name="userPw" placeholder="비밀번호 입력"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>닉네임 </td>--%>
<%--                    <td><input type="text" name="nickname"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>거주 지역 </td>--%>
<%--                    <td><input type="text" name="location"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>연락처 </td>--%>
<%--                    <td><input type="text" name="phone"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>생일 </td>--%>
<%--                    <td>--%>
<%--                        <input type="number" name="byear" placeholder="년도">--%>
<%--                        <input type="number" name="bmonth" placeholder="월">--%>
<%--                        <input type="number" name="bday" placeholder="날짜">--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td></td>--%>
<%--                    <td>--%>
<%--                        <input type="reset">--%>
<%--                        <input type="submit" value="회원 가입">--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </table>--%>

<%--        </form>--%>

    </body>
</html>
