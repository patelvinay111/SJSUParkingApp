
   <?php        
    $floorNum = filter_input(INPUT_GET, "floor");
    $availableSpaces = filter_input(INPUT_GET, "spaces");
    $garageName = filter_input(INPUT_GET, "garage");
    //$floorNum = $_POST['floor'];
    //$availableSpaces = $_POST['spaces'];
    //$garageName = $_POST['garage'];

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
            //$message = "Thank you!";            
            //echo "<script>setTimeout(\"location.href = 'http://localhost/SJSUParkingApp/index.html';\",0);</script>";                  
            //echo "<script  type='text/javascript'> alert('$message'); </script>";
            //exit();
            
            header("Location:http://localhost/SJSUParkingApp/index.html");
            exit();
        }else
            echo "Error: " . $sql . "<br>" . $con->error;
    }
    catch(Exception $ex) {
        print 'ERROR: '.$ex->getMessage();
    }        
?>
