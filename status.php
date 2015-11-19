<?php
    class Parking{
        private $garage;
        private $floor;
        private $spaces;
            
        public function getGarage()     { return $this->garage; }
        public function getFloor()      { return $this->floor; }
        public function getSpaces()     { return $this->spaces; }           
    }//Parking

    try {       
        $garage = $_GET['garage'];
        $floor = $_GET['floor'];
        
        
        
        // Connect to the database.
        $con = new PDO("mysql:host=localhost;dbname=SJSU_Parking",
                           "root", "myfirstDB");
        $con->setAttribute(PDO::ATTR_ERRMODE,
                               PDO::ERRMODE_EXCEPTION);
            
        $query = "SELECT * FROM Parking WHERE garage = '$garage' AND floor=$floor";        
        $ps = $con->prepare($query);
            
        // Fetch the matching database table rows.
        $ps->execute();
        $ps->setFetchMode(PDO::FETCH_CLASS, "Parking");
            
        // Construct the HTML table row by row.
        while ($user = $ps->fetch()) {
            $value = $user->getSpaces();
            echo $value;             
        }            
    }   
    catch(Exception $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
?>
