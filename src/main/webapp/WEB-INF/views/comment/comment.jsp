<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-12-03
  Time: 오전 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Comment</title>
</head>
<body>
    <table class="" id="commentListDiv">
        <c:forEach items="${commentList!=null}" var="comments">
            <tr>
                <td>닉네임 </td>
                <td></td>
            </tr>
            <tr>
                <td>내용 </td>
                <td></td>
            </tr>
            <tr>
                <td>작성 시간</td>
                <td></td>
            </tr>
        </c:forEach>
    </table>
    <div>
        <c:if test="${commentList != null}">
            <input type="hidden" id="lastCommentIdx" value="${commentList[commentList.size()-1].commentIdx}"/>
        </c:if>
        <input type="button" id="nextItems" class="btn" value="▼"/>
    </div>
    <div>
        <form method="post">
            <table>
                <tr>
                    <td>닉네임</td>
                    <td><input type="text" name="nickname" value="${loginInfo.nickname}"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <input type="text" name="commentText" id="commentText" placeholder="댓글 내용을 입력하세요."><br>
                        <div id="textMsg"></div>
                    </td>
                </tr>
            </table>

            <input type="submit" id="newComment" class="btn" value="작성">
        </form>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", ()=> {

            const submit = document.querySelector("#newComment");
            submit.addEventListener('click', (event) => {
                let comment = document.querySelector('#commentText');
                if(comment.value == '' || comment.value.trim() == '') {
                    alert('');
                    comment.focus();
                    return;
                }

                let data = {
                    boardIdx : ${boardIdx},
                    text: comment,
                    lastCommentIdx: document.querySelector('#lastCommentIdx').value
                };

                axios.post('/comment/write', data)
                    .then(function (response){
                        let obj = response.data;
                        let appendHtml = '';
                        let tr = document.createElement('tr');
                        tr.setAttribute('id', commentIdx);

                        tr.innerHTML = appendHtml;

                    })
            })

        })

    </script>

</body>
</html>
