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
                           "root", "pass");
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
            
            if($value == "Don't bother"){
                echo "<div style=\"border-radius: 50%; width: 15px;height: 15px;background: red; display: inline-block;\"></div>";
            }else if($value == "Give it a shot"){
                echo "<div style=\"border-radius: 50%; width: 15px;height: 15px;background: yellow; display: inline-block;\"></div>";
            }else if($value == "Plenty of parking"){
                echo "<div style=\"border-radius: 50%; width: 15px;height: 15px;background: green; display: inline-block;\"></div>";
            }else{
                echo "<div style=\"border-radius: 50%; width: 15px;height: 15px;background: grey; display: inline-block;\"></div>";
            }
            echo "  " . $value;
            echo " [".$timeArray['hour']. ":".$timeArray['minute']."] ";
        }            
    }   
    catch(Exception $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
?>
