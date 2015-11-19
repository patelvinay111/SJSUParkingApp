<!DOCTYPE html>
<html lang "en-US">
<head>
        <title>SJSU Parking app</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="js/jquery-ui-1.11.4.custom/jquery-ui.css">

        <style>
        	.header{
        		float: left;
        	}
        	.logo{
        		padding-top: 10px;
        	}
        	.spinners{
        		padding-left: 20%;
        	}
        </style>
    
    </head>

    <body>
        <a class="btn btn-primary" 
           type="button" 
           href="index.html" 
           style="font-size: 20px; width: 100px; margin: 20px 20px;">Back</a>
         
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
            $message = "Thank you!";
            echo "  <script type='text/javascript'>
                        alert('$message');
                    </script>";
        }else
            echo "Error: " . $sql . "<br>" . $con->error;
            
        }
        catch(Exception $ex) {
            print 'ERROR: '.$ex->getMessage();
        }        
        ?>
        
    </body>


</html>