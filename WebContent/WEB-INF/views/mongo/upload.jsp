<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>게시물 등록-연결</title>
</head>
<body>
	<div align="center">
		<h2>게시물 등록</h2>
		<small>사진을 선택한 후, 멘트를 달아주세요.</small>
	</div>
	<div style="margin-top: 20px" align="center">
		<form action="/mongo/uploadp.do" method="post" enctype="multipart/form-data">
			<div>
				<img src="/image/insta.jpg" style="width: 300px; height: 300px; border-radius:30px" id="preview">
			</div>
			<input type="file" name="photo" id="photo" accept="image/*" style="display:none"/>
			 <textarea name="comment" style="resize: none; width: 294; height: 70; padding: 2px; font-family: 맑은고딕;"></textarea>		
			 <p style="margin-top: 20px">
			<button type="submit">게시물 등록</button>
			<button type="submit" formaction="/mongo/list.do">게시물 리스트</button>
			</p>
		</form>
	</div>
	<script> 
		document.getElementById("photo").onchange=function(){
			console.log(this.files[0]);
			if(!this.files[0].type.startsWith("image")){
				window.alert("이미지 파일만 선택 가능합니다.")
				return ;
			}
			// 미리보기를 구현할려면, XMLHttpRequest 객체같이
			var reader=new FileReader();
			reader.readAsDataURL(this.files[0]);
			console.log(reader);
			reader.onload=function(){// readAsDataURL이 끝나면 발생하는 이벤트
			
				document.getElementById("preview").src=this.result;
				
			}
		
		}
		document.getElementById("preview").onclick=function(){
			document.getElementById("photo").click();
		}	
	</script>
</body>
</html>