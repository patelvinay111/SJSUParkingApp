<script src="dist/sweetalert.min.js"></script> 
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">


<?php        
    $floorNum = filter_input(INPUT_GET, "floor");
    $availableSpaces = filter_input(INPUT_GET, "spaces");
    $garageName = filter_input(INPUT_GET, "garage");

    try{    
        // Connect to the database.
        $con = new PDO("mysql:host=localhost;dbname=SJSU_Parking",
                           "root", "pass");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "INSERT INTO Report (userID, garage, floor, spaces) ".
                "VALUES (1, '$garageName', :floorNum, :availableSpaces)";

        $ps = $con->prepare($query);
        $ps->bindParam(':floorNum', $floorNum);
        $ps->bindParam(':availableSpaces', $availableSpaces);
        
        if($ps->execute() === TRUE){
          
            echo "<script>setTimeout(\"location.href = 'http://localhost/SJSUParkingApp/index.html';\",0);</script>";                  

            exit();
        }else
            echo "Error: " . $sql . "<br>" . $con->error;
    }
    catch(Exception $ex) {
        print 'ERROR: '.$ex->getMessage();
    }        
?>
