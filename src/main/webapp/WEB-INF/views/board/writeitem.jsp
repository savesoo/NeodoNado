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
                    <input type="file" id="selectFile" multiple name ="selectFile"/>
                </div>
            </div>
        </form>
        <form>
            <div>
                <select name="fileList" id="fileList" readonly multiple size="min-width:317px"></select>
                <div><label id="fileCnt">0</label> / 5</div>
            </div>
            <input type="text" name="title" id="title">
            <input type="text" name="price" id="price">
            <select name="category">
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
            <input type="submit" value="작성">
        </form>
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            let bytes = 0;
            const contentArea = document.querySelector('#content');

            contentArea.addEventListener('keyup', event => { // textArea 글자수 처리
                bytes = ~-encodeURI(contentArea.value).split(/%..|./).length;
                document.querySelector('#contentByte').innerText = bytes;
            });

            document.querySelector('#dropFileZone').addEventListener('drop', (event) => {
                event.preventDefault();
                ajax_file_upload(event.dataTransfer.files);
            });

            document.querySelector('#fileExplorer').addEventListener('click', (event) =>{
                document.querySelector('#selectFile').click();
                document.querySelector('#selectFile').onchange = function () {
                    ajax_file_upload(document.querySelector('#selectFile').files);
                };
            })

        });

        let fileCnt = 0;
        let fileList = [];
        function ajax_file_upload(files_obj) {
            if (files_obj != undefined) {
                if(files_obj.length + fileCnt > 5) {
                    alert("파일은 최대 5개 까지 업로드 가능합니다.");
                    return;
                }
                var form_data = new FormData();
                for (i = 0; i < files_obj.length; i++) {
                    form_data.append('file' + i, files_obj[i]);
                }
                var xhttp = new XMLHttpRequest();
                xhttp.open("POST", "/board/write/upload", true);
                xhttp.onload = function (event) {
                    if (xhttp.status == 200) {
                        let opt = '';
                        JSON.parse(xhttp.response).forEach(e => fileList.push(e));
                        fileList.forEach(e => {opt += '<option value="' + e + '">' + e + '</option>';});

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
