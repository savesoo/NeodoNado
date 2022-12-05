<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-12-03
  Time: 오전 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <div id="commentListDiv">
        <c:forEach items="${commentList}" var="comment">
            <div class="row" id="row-${comment.commentIdx}">
                <div>${comment.nickname} / ${comment.writeDate} <c:if test="${loginInfo.userIdx == comment.userIdx}"><input
                        type="button" value="삭제" onclick="deleteComment(${comment.commentIdx})"></c:if> </div>
                <div>${comment.content}</div>
            </div>
        </c:forEach>
    </div>
    <div>
        <input type="hidden" id="lastCommentIdx" value="${commentList.size() != 0 ? commentList[commentList.size()-1].commentIdx : 0}"/>
        <input type="button" id="nextComment" class="btn" value="▼"/>
    </div>
    <div>
            <table>
                <tr>
                    <td>닉네임</td>
                    <td><input type="text" name="nickname" value="${loginInfo.nickname}"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="commentText" id="commentText" placeholder="댓글 내용을 입력하세요." cols="30" rows="10" style="resize: none;"></textarea>
                        <label id="commentByte"></label>
                    </td>
                </tr>
            </table>
            <input type="button" id="commentSubmit" class="btn" value="작성">
    </div>
    <script src="/resources/js/textLenCheck.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", ()=> {
            const commentText = document.querySelector('#commentText');

            //글자수 처리하는 이벤트
            commentText.addEventListener('keyup', event => { // textArea 글자수 처리
                bytes = getTextByte(commentText.value);
                document.querySelector('#commentByte').innerText = bytes;
            });

            document.querySelector('#commentSubmit').addEventListener('click', (event) => {
                if(!checkTextLenAndAlert(commentText, '댓글 내용', 100)){
                    return;
                }

                let data = {
                    boardIdx : ${item.boardIdx},
                    content: commentText.value
                };
                axios.post('/app/v1/comment/'+document.querySelector('#lastCommentIdx').value, data)
                    .then(function (response){
                        let obj = response.data;
                        appendCommentRow(obj);
                    });
            });

            document.querySelector('#nextComment').addEventListener('click', (e) => {
                let lastIdx = document.querySelector('#lastCommentIdx').value;
                axios('/app/v1/comment/${item.boardIdx}/'+lastIdx)
                    .then(function(response){
                        let obj = response.data;
                        appendCommentRow(obj);
                    });
            });
        });

        function deleteComment(idx){
            if(!confirm('댓글을 삭제하시겠습니까?\r\n삭제한 댓글은 복구할 수 없습니다.')) return;
            axios.delete('/app/v1/comment/'+idx)
                .then(function(response) {
                    if(response.data > 0) document.querySelector('#row-'+idx).remove();
                });
        }

        function makeCommentRow(nickname, content, writeDate, commentUserIdx, commentIdx) {
            let deleteBtn = '<input type="button" value="삭제" onclick="deleteComment('+commentIdx+')"/>';
            let appendTag = '<div>'+nickname+' / '+writeDate + ' ';
            appendTag += commentUserIdx == ${loginInfo.userIdx} ? deleteBtn : '';
            appendTag += '</div>';
            appendTag += '<div>'+content+'</div>';
            return appendTag;
        }

        function appendCommentRow(obj) {
            if(obj.length == 0) {
                // 안보이게 처리
                document.querySelector('#nextComment').style.visibility = 'hidden';
            } else {
                // 여기서 append 시켜줘야 함
                document.querySelector('#nextComment').style.visibility = 'visible';
                obj.forEach((e) => {
                    let appendHtml = '';
                    let div = document.createElement('div');
                    div.setAttribute('class', 'row');
                    div.setAttribute('id', 'row-'+e.commentIdx);
                    appendHtml += makeCommentRow(e.nickname, e.content, e.writeDate, e.userIdx, e.commentIdx);
                    div.innerHTML = appendHtml;
                    document.querySelector('#commentListDiv').appendChild(div);
                });
                document.querySelector('#lastCommentIdx').value = obj[obj.length-1].commentIdx;
            }
        }

    </script>