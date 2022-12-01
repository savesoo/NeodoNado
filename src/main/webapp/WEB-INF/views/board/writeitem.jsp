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
            #drop_file_zone {
                background-color: #EEE;
                border: #999 5px dashed;
                width: 290px;
                height: 200px;
                padding: 8px;
                font-size: 18px;
            }
            #drag_upload_file {
                width:50%;
                margin:0 auto;
            }
            #drag_upload_file p {
                text-align: center;
            }
            #drag_upload_file #selectfile {
                display: none;
            }
        </style>
    </head>
    <body>
        <form method="post" enctype="multipart/form-data">
            <div id="drop_file_zone" ondrop="upload_file(event)" ondragover="return false">
                <div id="drag_upload_file">
                    <p>Drop file(s) here</p>
                    <p>or</p>
                    <p><input type="button" value="Select File(s)" onclick="file_explorer();" /></p>
                    <input type="file" id="selectfile" multiple name ="selectFiles"/>
                </div>
            </div>
        </form>
        <form>
            <input type="text" name="title" id="title">
            <input type="text" name="price" id="price">
            <select name="category">
                <c:forEach items="${itemCategory}" var="category">
                    <option value="${category.key}">${category.value}</option>
                </c:forEach>
            </select>
            <textarea name="content" id="content" cols="30" rows="10" style="resize: none;"></textarea>
            <input type="submit" value="작성">
        </form>
    </body>
    <script>
        function upload_file(e) {
            e.preventDefault();
            ajax_file_upload(e.dataTransfer.files);
        }

        function file_explorer() {
            document.getElementById('selectfile').click();
            document.getElementById('selectfile').onchange = function() {
                files = document.getElementById('selectfile').files;
                ajax_file_upload(files);
            };
        }

        function ajax_file_upload(files_obj) {
            if(files_obj != undefined) {
                var form_data = new FormData();
                for(i=0; i<files_obj.length; i++) {
                    form_data.append('file'+i, files_obj[i]);
                    console.log(files_obj[i]);
                }
                var xhttp = new XMLHttpRequest();
                xhttp.open("POST", "/file/upload/v1", true);
                xhttp.onload = function(event) {
                    if (xhttp.status == 200) {
                        alert(this.responseText);
                    } else {
                        alert("Error " + xhttp.status + " occurred when trying to upload your file.");
                    }
                }

                xhttp.send(form_data);
            }
        }
    </script>
</html>
