<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
<style>
* {
    box-sizing: border-box;
}
.header {
    border: 1px solid red;
    padding: 15px;
}
.row::after {
    content: "";
    clear: both;
    display: table;
}
[class*="col-"] {
    float: left;
    padding: 15px;

}
.col-1 {width: 15%;}
.col-2 {width: 35%;}
.col-3 {width: 33.33%;}
.col-4 {width: 33.33%;}
.col-5 {width: 41.66%;}
.col-6 {width: 50%;}
.col-7 {width: 58.33%;}
.col-8 {width: 66.66%;}
.col-9 {width: 75%;}
.col-10 {width: 83.33%;}
.col-11 {width: 91.66%;}
.col-12 {width: 100%;}
</style>
</style>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${rideboard.RIEDE_NAME }</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="w3-container w3-pale-red w3-card-4 w3-center">
		<h1 style="color: white">
			<b>${rideboard.RIDE_NAME }</b>
		</h1>
</div>
<div class="w3-container row w3-center w3-card-4" style=" background: url(/start/detail02.jpg) no-repeat center center fixed; 
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;">
<br/>
<div class="col-1 ">
</div>
<div class="col-2 w3-border w3-card-4 w3-light-gray">
<img src="${rideboard.IMAGE }" style="width: 100%;height: 450px">
</div>
<div class="col-2 w3-border">
<h1 class="w3-pale-red w3-round-large w3-margin-topmidle">${rideboard.RIDE_NAME }</h1>
<div class="w3-container w3-round-large w3-pale-red">
<h3>내 용</h3>
<div class="w3-container w3-light-gray">${rideboard.CONTENT }</div>
</div>
</div>
<div class="col-1"></div>
</div>
</body>
<script>
//star rating
var starRating = function(){
  var $star = $(".star-input"),
      $result = $star.find("output>b");
  $(document)
    .on("focusin", ".star-input>.input", function(){
    $(this).addClass("focus");
  })
    .on("focusout", ".star-input>.input", function(){
    var $this = $(this);
    setTimeout(function(){
      if($this.find(":focus").length === 0){
        $this.removeClass("focus");
      }
    }, 100);
  })
    .on("change", ".star-input :radio", function(){
    $result.text($(this).next().text());
  })
    .on("mouseover", ".star-input label", function(){
    $result.text($(this).text());
  })
    .on("mouseleave", ".star-input>.input", function(){
    var $checked = $star.find(":checked");
    if($checked.length === 0){
      $result.text("0");
    } else {
      $result.text($checked.next().text());
    }
  });
};
starRating();
// 놀이기구 리뷰 
$("#sbt").click(function(){
	$.ajax("/rideboard/detailwrite.do",{
		"method" : "post",
		"async" : false,
		"data" :{
			"ride_name" : "${rideboard.RIDE_NAME}",
			"no" : "${rideboard.NO}",
			"score" : $(".score:checked").val(),
			"ment" : $("#ment").val()
			

		}
	}).done(function(obj){
		if(obj[0].result==1){
			window.alert("글등록 성공")
		}else{
			window.alert("글등록 실패")
		}
	});
	$(".score").val("");
	$("#ment").val("");
	location.reload()
});
// 장바구니 버튼 ajax
$("#cart").click(function(){
	window.alert("장바구니 버튼 눌림")
	$.ajax("/rideboard/cart.do",{
		"method" : "post",
		"async" : false,
		"data" :{
			"nick"  : "${sessionScope.userNick}",
			"basket" : "${rideboard.RIDE_NAME}",
			"type"  : "${rideboard.TYPE}"
		}
	}).done(function(obj){
		window.alert("rst값"+obj[0].result)
		if(obj[0].result==1){
			window.alert("장바구니에 담겼습니다.");
		}else if(obj[0].result==5){
			window.alert("이미 장바구니에 담겨있는 놀이기구입니다.");
		}else if(obj[0].result==3){
			window.alert(obj[0].result)
			window.alert("장바구니가 가득찼습니다.");
		}else{
			window.alert("이건 뭐지...")
		}
	});
});

</script>

</html>
