<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2022-12-01
  Time: 오후 5:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
        <link rel="stylesheet" type="text/css" href="/resources/css/drop.css"/>
    </head>
    <body>
        <form method="post" enctype="multipart/form-data">
            <div id="dropFileZone" draggable="true" ondragover="return false" >
                <div id="dragUploadFile">
                    <p>Drop file(s) here</p>
                    <p>or</p>
                    <p><input type="button" value="Select File(s)" id="fileExplorer" /></p>
                    <input type="file" id="selectFile" multiple name ="selectFile" accept=".gif, .png, .jpg"/>
                </div>
            </div>
        </form>
        <form>
            <div>
                <select name="fileList" id="fileList" disabled readonly multiple size="min-width:317px"></select>
                <div><label id="fileCnt">0</label> / 5</div>
            </div>
            <input type="hidden" name="thumbnail" id="thumbnail">
            <input type="text" name="title" id="title">
            <input type="text" name="price" id="price">
            <select name="category" id="category">
                <c:forEach items="${itemCategory}" var="category">
                    <option value="${category.key}">${category.value}</option>
                </c:forEach>
            </select>
            <div>
                <textarea name="content" id="content" cols="30" rows="10" style="resize: none;"></textarea>
                <div>
                    <label id="contentByte">0</label> / 300
                </div>
            </div>
            <input type="button" value="작성" id="itemSubmit">
        </form>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="/resources/js/drop.js"></script>
    <script src="/resources/js/textLenCheck.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            let bytes = 0;
            const contentArea = document.querySelector('#content');

            //글자수 처리하는 이벤트
            contentArea.addEventListener('keyup', event => { // textArea 글자수 처리
                bytes = getTextByte(contentArea.value);
                document.querySelector('#contentByte').innerText = bytes;
            });

            // submit(글작성)
            document.querySelector('#itemSubmit').addEventListener('click', (event) => {
                const title = document.querySelector('#title');
                const content = document.querySelector('#content');
                const price = document.querySelector('#price');

                if(!checkTextLenAndAlert(title, '게시글 제목', 100)
                || !checkTextLenAndAlert(content, '본문 내용', 300)
                || !checkPriceAndAlert(price)){
                    return;
                }

                let itemEntity = {
                    title: title.value,
                    content: content.value,
                    price: price.value,
                    category: category.options[category.selectedIndex].value,
                    imgURL: fileList.toString(),
                    thumbnail: document.querySelector('#thumbnail').value
                };

                axios.post('/board/write', itemEntity)
                    .then(function (response) {
                        console.log(response);
                        location.href= response.data;
                    }).catch(function (error){
                        console.log(error);
                });
            });

        });
    </script>
</html>
