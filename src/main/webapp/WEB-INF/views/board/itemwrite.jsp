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
        <style>
            #dropFileZone {
                background-color: #EEE;
                border: #999 5px dashed;
                width: 290px;
                height: 200px;
                padding: 8px;
                font-size: 18px;
            }
            #dragUploadFile {
                width:50%;
                margin:0 auto;
            }
            #dragUploadFile p {
                text-align: center;
            }
            #dragUploadFile #selectFile {
                display: none;
            }
        </style>
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
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            let bytes = 0;
            const contentArea = document.querySelector('#content');

            //글자수 처리하는 이벤트
            contentArea.addEventListener('keyup', event => { // textArea 글자수 처리
                bytes = getTextByte(contentArea.value);
                document.querySelector('#contentByte').innerText = bytes;
            });

            //이미지 파일 드래그 & 드롭 시키는 영역
            document.querySelector('#dropFileZone').addEventListener('drop', (event) => {
                event.preventDefault();
                ajaxFileUpload(event.dataTransfer.files);
            });

            // 탐색 창 포출하는 영역
            document.querySelector('#fileExplorer').addEventListener('click', (event) =>{
                document.querySelector('#selectFile').click();
                document.querySelector('#selectFile').onchange = function () {
                    ajaxFileUpload(document.querySelector('#selectFile').files);
                };
            });

            // submit(글작성)
            document.querySelector('#itemSubmit').addEventListener('click', (event) => {
                const title = document.querySelector('#title');
                const content = document.querySelector('#content');
                const price = document.querySelector('#price');

                if(title.value == '' || title.value.trim() == '' || getTextByte(title.value) > 100) {
                    alert('게시글 제목을 다시 확인 해주세요.\r\n' +
                        '현재 작성한 글자 수('+getTextByte(title.value)+'/100)');
                    title.focus();
                    return;
                }
                if(content.value == '' || content.value.trim() == '' || getTextByte(content.value) > 300) {
                    alert('본문 내용을 다시 확인 해주세요.\r\n' +
                        '현재 작성한 글자 수('+getTextByte(content.value)+'/300)');
                    content.focus();
                    return;
                }
                if(price.value == '' || price.value.trim() == '' ||
                    parseInt(price.value) <= 0) {
                    alert('판매 금액은 필수입니다.');
                    price.focus();
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
                let xhttp = new XMLHttpRequest();
                xhttp.open('POST', '/board/write', true);
                xhttp.setRequestHeader('Content-type', 'application/json');
                xhttp.onload = function (event) {
                    if (xhttp.status == 200) {
                        location.href=xhttp.responseText;
                    } else {
                        alert("Error " + xhttp.status + " occurred when trying to upload your file.");
                    }
                }

                xhttp.send(JSON.stringify(itemEntity));
            });

        });

        // 글자수 확인
        function getTextByte(str) {
            return ~-encodeURI(str).split(/%..|./).length;
        }

        let fileCnt = 0;
        let fileList = [];
        // 파일 업로드 작업
        function ajaxFileUpload(files_obj) {
            if (files_obj != undefined) {
                if(files_obj.length + fileCnt > 5) {
                    alert("파일은 최대 5개 까지 업로드 가능합니다.");
                    return;
                }
                let form_data = new FormData();
                for (i = 0; i < files_obj.length; i++) {
                    let fileNames = files_obj[i].name.split('.');
                    if(fileNames[fileNames.length - 1].toUpperCase() != 'PNG'
                        && fileNames[fileNames.length - 1].toUpperCase() != 'JPG'
                        && fileNames[fileNames.length - 1].toUpperCase() != 'GIF' ) {
                        alert('이미지 파일만 업로드 가능합니다. 다시 확인해주세요.')
                        return;
                    }
                    form_data.append('file' + i, files_obj[i]);
                }
                let xhttp = new XMLHttpRequest();
                xhttp.open("POST", "/board/write/upload", true);
                xhttp.onload = function (event) {
                    if (xhttp.status == 200) {
                        let opt = '';
                        let obj = JSON.parse(xhttp.response);
                        console.log(obj.fileList)
                        obj.fileList.forEach(e => fileList.push(e));
                        fileList.forEach(e => {opt += '<option value="' + e + '">' + e + '</option>';});
                        document.querySelector('#thumbnail').value = obj.thumbnail[0];

                        if(opt != '') {
                            fileCnt += files_obj.length;
                            document.querySelector('#fileList').innerHTML = opt;
                            document.querySelector('#fileCnt').innerText = fileCnt;
                        }
                    } else {
                        alert("Error " + xhttp.status + " occurred when trying to upload your file.");
                    }
                }

                xhttp.send(form_data);
            }
        }
    </script>
</html>
