<?php
  include 'login.php';
 ?>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="style.css"><!--access to the style.css file-->
    <title>Hospital Database</title>
  </head>


  <body>

    <div id="main" align="center">
    <h1 style="background-color:purple;">Hospital Database</h1>
      <div id="login" align="center">
        <form action="" method="POST">
          <p>

            <label for="employeeid"><h1 style="color:purple;font-family:Courier New;">Enter Employee ID: </h1></label><br>
            <input id="employeeid" name="EMPID" placeholder="Employee ID" style="font-family:Courier New;" type="text"><br>

          </p>

          <p>
            <input type="submit" name="SUBMIT" value="    LOGIN    " >
          </p>

          <span style="color:purple;"><?php echo $errorMessage; ?></span>
        </form>
      </div>

  </body>

  <div class = "myDiv">
   <h1> "The only way to do great work is to love what you do." </h1>

  <style>
body {color: white;background: #B24592;  background: -webkit-linear-gradient(to right, #ccccff, #ff9999);  background: linear-gradient(to right, #ccccff, #ff9999); }

  #main{
    text-align: center;
  }
  #login{
    background-color: pink;
    padding:100px;
    border-radius: 8px;
    width:50%;
  margin-left: 20%;

  }
  label{

    font-weight: bolder;
  }
  p{
    border-radius: 7px;
    padding:10px;
  }
  input[type=text], input[type=password]{
    text-align: center;
    padding:5px;
    border-radius: 3px;
  }
  .myDiv {
    position: fixed;
     bottom: 0;
     width: 100%;
    border: 5px outset black;
    background-color: purple;
    text-align: center;
  }
  </style>
</html>
