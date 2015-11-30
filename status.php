<?php
    class Parking{
        private $garage;
        private $floor;
        private $spaces;
        private $updateOn;
            
        public function getGarage()     { return $this->garage; }
        public function getFloor()      { return $this->floor; }
        public function getSpaces()     { return $this->spaces; }   
        public function getUpdateOn()   { return $this->updateOn; }
          
    }//Parking

    try {       
        $garage = $_GET['garage'];
        $floor = $_GET['floor'];
        
        
        
        // Connect to the database.
        $con = new PDO("mysql:host=localhost;dbname=SJSU_Parking",
                           "root", "malik");
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
            $time = $user->getUpdateOn();
            $timeArray = date_parse($time);
            echo $value." at ";
            echo $timeArray['hour']. ":".$timeArray['minute'];
        }            
    }   
    catch(Exception $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
?>
