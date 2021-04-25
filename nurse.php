<?php
//includes page that detects if the database is connected
include 'session.php';
$user = $_SESSION['user'];//assigns the current session as the user of the filesystem
$mysqli = mysqli_connect("localhost","root", "", "hospitall");//checks the connection of the database

 ?>

 <html>
 <head>
   <title>Nurse</title>
 </head>
   <body>
  	<h1 style= "text-align:center;background-color:purple;">Welcome Nurse,</span> <?php echo $login_session; ?>!</h1>
     <div align="center">
       <?php
       $patients = "SELECT P.patient_ID, P.Fname, P.Lname, P.Minit, P.Weight, P.Height, P.blood_type,  P.hadCovid FROM patient AS P, employee_has_patient AS EP
       where EP.patient_patient_ID = P.patient_ID AND EP.employee_Type = 2
       AND EP.employee_Employee_ID ='$user'";
       echo "<table><caption>MY PATIENTS</caption><col width='130'><col width='130'><col width='130'><col width='130'><col width='130'><col width='130'><col width='130'>";
       echo "<tr><th>Patient ID</th><th>First Name</th><th>Middle Initial</th><th>Last Name</th><th>Weight</th><th>Height</th><th>Blood Type</th><th>Had Covid</th></tr>";
       $res = $mysqli->query($patients);
       if($res->num_rows>0){
         while($row=$res->fetch_assoc()){
             echo  "<tr><td>" . $row['patient_ID'] . "</td><td> " .  $row['Fname'] . "</td><td> " . $row['Minit'] . "</td><td> " . $row['Lname'] . "</td><td>". $row['Weight']. "</td><td>" . $row['Height'] . "</td>";
             echo  "<td>" . $row['blood_type'] . "</td><td>".$row['hadCovid']."</tr> ";
         }
       }else{
           echo "<h2 style='text-align:center;color: #666;'>No patients.</h2>";
         }
         echo "</table";
        ?>
         </div>





     <a href="logout.php">Logout</a>
   </body>




   <div class = "myDiv">
    <h1> "You don't build a house without its foundation. You don't build a hospital without its Nurses." </h1>
 <style media="screen">
 body{
   color: white;

  background: -webkit-linear-gradient(to right, #ccccff, #ff9999);  /* Chrome 10-25, Safari 5.1-6 */
  background: linear-gradient(to right, #ccccff, #ff9999); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  text-align: center;
 }
 table, tr, td{
   color:black;
   text-align: center;
   border: 1px solid black;
   font-size: 20px;
 }
 .title{
   color: white;
   text-align: center;
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
