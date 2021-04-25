<?php
include 'session.php';
$user = $_SESSION['user'];
 ?>

 <html>
 <title>Hospital Database Doctor View</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">


 <body>
	<h1 style= "text-align:center;background-color:purple;">Welcome Doctor,</span> <?php echo $login_session; ?>!</h1>




   <div align="center">
        <?php
        $patients = "SELECT P.patient_ID, P.Fname, P.Lname, P.Minit, P.Weight, P.Height, P.blood_type, P.chief_complaint, P.diagnosis, P.hadCovid FROM patient AS P, employee_has_patient AS EP
        where EP.patient_patient_ID = P.patient_ID AND EP.employee_Type = 1
        AND EP.employee_Employee_ID ='$user'";
        echo "<table><caption>MY PATIENTS</caption><col width='130'><col width='130'><col width='130'><col width='130'><col width='130'><col width='130'><col width='130'><col width='130'><col width='130'>";
        echo "<tr><th>Patient ID</th><th>First Name</th><th>Middle Initial</th><th>Last Name</th><th>Weight</th><th>Height</th><th>Blood Type</th><th>Complaint</th><th>Diagnosis</th><th>Had Covid</th></tr>";
        $res = $mysqli->query($patients);
        if($res->num_rows>0){
          while($row=$res->fetch_assoc()){
              echo  "<tr><td>" . $row['patient_ID'] . "</td><td> " .  $row['Fname'] . "</td><td> " . $row['Minit'] . "</td><td> " . $row['Lname'] . "</td><td>". $row['Weight']. "</td><td>" . $row['Height'] . "</td>";
              echo  "<td>" . $row['blood_type'] . "</td><td>" . $row['chief_complaint'] . "</td><td>". $row['diagnosis'] . "</td><td>".$row['hadCovid']."</tr><br> " ;
          }
        }else{
            echo "<h2 style='text-align:center;color: purple;'>No patients.</h2>";
          }
          echo "</table";
         ?>
       </div>




   <a href="logout.php">Logout</a>
 </body>


 <div class = "myDiv">
  <h1> "Medicine cures diseases but only doctors can cure patients." </h1>
 <style>

  body{
   text-align: center;
   color: white;
   background: #B24592;
   background: -webkit-linear-gradient(to right, #ccccff, #ff9999);
   background: linear-gradient(to right, #ccccff, #ff9999);

  }
  table, tr, td{
    color: black;
    text-align: center;
    border: 1px solid black;
    font-size: 20px;

  }
  .title{
    color: white;
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
