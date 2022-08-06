<%--
  Created by IntelliJ IDEA.
  User: warrior245
  Date: 8/6/22
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>

    .header {
      background-color: #f1f1f1;
      padding: 30px;
      text-align: center;
    }

    #bar {
      overflow: hidden;
      background-color: #333;
    }

    #bar button {
      float: left;
      display: block;
      color: #f2f2f2;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
      font-size: 17px;
    }

    #bar button:hover {
      background-color: #ddd;
      color: black;
    }

    /* #navbar a.active {
      background-color: #04AA6D;
      color: white;
    } */

    .content {
      padding: 16px;
    }

    .sticky {
      position: fixed;
      top: 0;
      width: 100%;
    }

    .sticky + .content {
      padding-top: 60px;
    }
  </style>

</head>
<body>
<div class="header">
  <img src="./download.jpeg">
</div>

<div id="bar" class="w3-bar w3-indigo">
  <button onclick="window.location='./index.html'" class="w3-bar-item w3-button"><i class="fa fa-home w3-large"></i></button>
  <button class="w3-bar-item w3-button w3-right tablink w3-red" onclick="openCity(event,'Status')">Status</button>
  <button class="w3-bar-item w3-button w3-right tablink" onclick="openCity(event,'Photos')">Photos</button>
  <button class="w3-bar-item w3-button w3-right tablink" onclick="openCity(event,'Info')">Info</button>
</div>


<!-- <div id="Status"></div>
<div id="Photos"></div>
<div id="Info"></div> -->


<div id="Status" class="w3-container city" style="width: 35%;margin-left:30%">
  <h2>Status</h2>
  <div class="w3-card w3-round w3-white" >
    <div class="w3-container w3-padding" >
      <h6 class="w3-opacity">How was your day</h6>
      <input placeholder="Status: Feeling Blue" class="w3-border w3-padding w3-input"></input><br>

      <button type="button" class="w3-button w3-green"><i class="fa fa-pencil"></i> &nbsp;Post</button>
    </div>
  </div>

  <div class="w3-container w3-card w3-white w3-round "    style="margin-top: 3%;"><br>
    <img src="./wp3092250.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:30px">
    <span class="w3-right w3-opacity">1 min</span>
    <h4>John Doe</h4><br>
    <hr class="w3-clear">
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-half">
        <img src="./download.jpeg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
      </div>
      <div class="w3-half">
        <img src="./download.jpeg" style="width:100%" alt="Nature" class="w3-margin-bottom">
      </div>
    </div>
    <button type="button" class="w3-button w3-blue w3-margin-bottom"><i class="fa fa-thumbs-up"></i> &nbsp;Like</button>
    <button type="button" class="w3-button w3-red w3-margin-bottom"><i class="fa fa-comment"></i> &nbsp;Comment</button>
  </div>
  <div class="w3-container w3-card w3-white w3-round "    style="margin-top: 3%;"><br>
    <img src="./wp3092250.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:30px">
    <span class="w3-right w3-opacity">11 min</span>
    <h4>John Doe</h4><br>
    <hr class="w3-clear">
    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-half">
        <img src="./download.jpeg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
      </div>
      <div class="w3-half">
        <img src="./download.jpeg" style="width:100%" alt="Nature" class="w3-margin-bottom">
      </div>
    </div>
    <button type="button" class="w3-button w3-blue w3-margin-bottom"><i class="fa fa-thumbs-up"></i> &nbsp;Like</button>
    <button type="button" class="w3-button w3-red w3-margin-bottom"><i class="fa fa-comment"></i> &nbsp;Comment</button>
  </div>
</div>

<div id="Photos" class="w3-container city" style="width: 35%;margin-left:30%;display:none">
  <h2>Photos</h2>
  <div class="w3-container w3-teal">
    <h1>Summer 2015</h1>
  </div>

  <div class="w3-row-padding w3-margin-top">
    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>5 Terre</h5>
        </div>
      </div>
    </div>

    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>Monterosso</h5>
        </div>
      </div>
    </div>

    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>Vernazza</h5>
        </div>
      </div>
    </div>
  </div>

  <div class="w3-row-padding w3-margin-top">
    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>Manarola</h5>
        </div>
      </div>
    </div>

    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>Corniglia</h5>
        </div>
      </div>
    </div>

    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>Riomaggiore</h5>
        </div>
      </div>
    </div>
    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>Riomaggiore</h5>
        </div>
      </div>
    </div>
    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>Riomaggiore</h5>
        </div>
      </div>
    </div>
    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>Riomaggiore</h5>
        </div>
      </div>
    </div>
    <div class="w3-third">
      <div class="w3-card">
        <img src="./download.jpeg" style="width:100%">
        <div class="w3-container">
          <h5>Riomaggiore</h5>
        </div>
      </div>
    </div>
  </div>
</div>

<div id="Info" class="w3-container city" style="width: 35%;margin-left:30%;display:none" >
  <h2>Info</h2>
  <p>This Page will show all the infos</p>
</div>
<!--
        <script>
          function openCity(evt, cityName) {
            var i, x, tablinks;
            x = document.getElementsByClassName("city");
            for (i = 0; i < x.length; i++) {
              x[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < x.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " w3-red";
          }
          </script> -->

<script>
  function openCity(evt,cityName) {
    var i;
    var x = document.getElementsByClassName("city");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " w3-red";
  }
</script>

<script>
  window.onscroll = function() {myFunction()};

  var navbar = document.getElementById("bar");
  var sticky = navbar.offsetTop;

  function myFunction() {
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky")
    } else {
      navbar.classList.remove("sticky");
    }
  }
</script>

<script>
  $(function(){
    $("#Status").load("status.html");
  });
</script>

<script>
  $(function(){
    $("#Photos").load("photos.html");
  });
</script>

<script>
  $(function(){
    $("#Info").load("info.html");
  });
</script>

<!-- <script>
  function loadDoc() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("demo").innerHTML = this.responseText;
      }
    };
    xhttp.open("GET", "ajax_info.txt", true);
    xhttp.send();
  }
  </script> -->
<!-- <script>
    function myFunction() {
      location.replace("./index.html")
    }
    </script> -->

</body>
</html>
