<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-12-03
  Time: 오전 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .delete-btn {
        max-width: 50px;
        max-height: 37px;
        font-size: 5px;
    }
    .comment-row {
        padding:20px;
        margin-top: 20px;
        margin-bottom: 20px;
    }
</style>
<main>
    <div id="commentListDiv" class="container-sm">
        <c:forEach items="${commentList}" var="comment">
            <div class="col-sm-12" id="row-${comment.commentIdx}">
                <div class="comment-row row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <strong>${comment.nickname}</strong>
                        <small>${comment.writeDate}</small>
                        <c:if test="${item.userIdx == loginInfo.userIdx}">
                            <c:if test="${loginInfo.userIdx == comment.userIdx}"><input type="button" value="삭제" class="delete-btn btn btn-outline-danger" onclick="deleteComment(${comment.commentIdx})"></c:if>
                        </c:if>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <p class="card-text">${comment.content}</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="container-lg" style="margin-bottom: 50px;">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <input type="hidden" id="lastCommentIdx" value="${commentList.size() != 0 ? commentList[commentList.size()-1].commentIdx : 0}"/>
                    <input type="button" id="nextComment" class="btn btn-outline-secondary" style="min-width: 100%" value="▼"/>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
    </div>
    <div class="container-lg">
        <div name="item" class="row mb-3 text-center row-item">
            <div class="col-sm-2 text-sm-end">
                <div class="row">
                <strong>${loginInfo.nickname}</strong>
                <small><label id="commentByte">0</label></small>
                </div>
            </div>
            <div class="col-sm-8">
                <textarea class="form-control" name="commentText" id="commentText" placeholder="댓글 내용을 입력하세요." style="resize: none; width:100%"></textarea>
            </div>
            <div class="col-sm-1">
                <input type="button" id="commentSubmit" class="btn btn-outline-secondary" style="min-width: 100%; min-height: 100%" value="작성">
            </div>
        </div>
    </div>
</main>
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
            let deleteBtn = '<input type="button" value="삭제" class="delete-btn btn btn-outline-danger" onclick="deleteComment('+commentIdx+')"/>';
            let appendTag = '<div class="col-sm-12" id="row-${comment.commentIdx}">'
                +'	<div class="comment-row row">'
                +'		<div class="col-md-2"></div>'
                +'		<div class="col-md-8">'
                +'			<strong>'+nickname+'</strong>'
                +'			<small>'+writeDate+'</small>';
            appendTag += commentUserIdx == ${loginInfo.userIdx} ? deleteBtn : '';
            appendTag += '		</div>'
                +'		<div class="col-md-2"></div>'
                +'		<div class="col-md-2"></div>'
                +'		<div class="col-md-8">'
                +'			<p class="card-text">'+content+'</p>'
                +'		</div>'
                +'		<div class="col-md-2"></div>'
                +'	</div>'
                +'</div>';
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