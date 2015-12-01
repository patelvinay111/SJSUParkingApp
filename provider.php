<script src="dist/sweetalert.min.js"></script> 
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">


<?php        
    $floorNum = filter_input(INPUT_GET, "floor");
    $availableSpaces = filter_input(INPUT_GET, "spaces");
    $garageName = filter_input(INPUT_GET, "garage");

    try{    
        // Connect to the database.
        $con = new PDO("mysql:host=localhost;dbname=SJSU_Parking",
                           "root", "myfirstDB");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $query = "INSERT INTO Report (userID, garage, floor, spaces) ".
                "VALUES (1, '$garageName', :floorNum, :availableSpaces)";

        $ps = $con->prepare($query);
        $ps->bindParam(':floorNum', $floorNum);
        $ps->bindParam(':availableSpaces', $availableSpaces);
        
        if($ps->execute() === TRUE){
            $message = "Thank you for your report!";            
            echo "<script>setTimeout(\"location.href = 'http://localhost/cs174/SJSUParkingApp/index.html';\",0);</script>";                  
            echo "<script  type='text/javascript' > 
                        alert('$message');
                </script>";
            exit();
            //header("Location: http://localhost/cs174/SJSUParkingApp/index.html");
            //exit();
        }else
            echo "Error: " . $sql . "<br>" . $con->error;
    }
    catch(Exception $ex) {
        print 'ERROR: '.$ex->getMessage();
    }        
?>
