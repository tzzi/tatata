<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>

<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
  <button class="w3-bar-item w3-button w3-hover-light-gray w3-large"
  onclick="w3_close()">Close &times;</button>
  <a href="#" class="w3-bar-item w3-button w3-hover-red">Link 1</a>
  <button class="w3-button w3-hover-green w3-block w3-left-align" onclick="myAccFunc()">
  Accordion <i class="fa fa-caret-down"></i>
  </button>
  <div id="demoAcc" class="w3-hide w3-white w3-card">
    <a href="#" class="w3-bar-item w3-button">Link</a>
    <a href="#" class="w3-bar-item w3-button">Link</a>
  </div>
  <a href="#" class="w3-bar-item w3-button w3-hover-red">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-hover-red">Link 3</a>
</div>

<div id="main">

<!-- <div class="w3-pale-red">
  <button id="openNav" class="w3-button w3-pale-red w3-xlarge" onclick="w3_open()">&#9776;</button>
  <div class="w3-container" style="color:white">
    <h1>My Page</h1>
  </div>
</div>
 -->
<div >
	<img src="/image/SiteMain_1.jpg">
</div>

</div>

<script>
function w3_open() {
  document.getElementById("main").style.marginLeft = "25%";
  document.getElementById("mySidebar").style.width = "25%";
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("openNav").style.display = 'none';
}
function w3_close() {
  document.getElementById("main").style.marginLeft = "0%";
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("openNav").style.display = "inline-block";
}

function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-green";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-green", "");
    }
}
</script>

</body>
</html>
