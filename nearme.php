<?php
  header("Access-Control-Allow-Origin: *");  // allow loading from other domains

  include 'config.php';

  /* Insert SQL to extract appropriate fields from Routes table where
     the term  matches an id parameter value of term */
  $lat = $_GET['lat']; // 43.78646; /* $_GET['lat']; */
  $lon = $_GET['lon']; // -79.1884399; /* $_GET['lon']; */
  //echo $lat;
  //echo "__________________"; 
  //echo $lon;
  //$sql = "SELECT *, acos(sin(radians($lat)) * sin(radians(latitude)) + cos(radians($lat)) * cos(radians(latitude)) * cos(radians(longitude) - (radians($lon)))) * 6371 AS dist FROM Stops as S, Runs as R WHERE S.routeid=R.route_id AND  dist <= 1;";
  $sql = "SELECT *, S.id as id, R.display_name as run_display_name, S.display_name as display_name, acos(sin(radians($lat)) * sin(radians(latitude)) + cos(radians($lat)) * cos(radians(latitude)) * cos(radians(longitude) - (radians($lon)))) * 6371 as distance FROM Stops as S, Runs as R WHERE R.route_id = S.routeid AND acos(sin(radians($lat)) * sin(radians(latitude)) + cos(radians($lat)) * cos(radians(latitude)) * cos(radians(longitude) - (radians($lon)))) * 6371 <= 1;";
  //$sql = "SELECT *, 3956 * 2 * ASIN(SQRT( POWER(SIN(($lat -abs(latitude)) * pi()/180 / 2),2) + COS($lat * pi()/180 ) * COS(abs(latitude) *  pi()/180) * POWER(SIN(($lon – longitude) *  pi()/180 / 2), 2) )) as distance FROM Stops having distance <= 1;";
  
 try {
  /* Initialize a data-access abstraction-layer object
     (a PHP Data Object: PDO) for a mysql database with
        values taken from the config.sql file */
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	// throw an exception if something goes wrong (see catch block below)
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	// create a SQL statement
	$stmt = $dbh->query($sql);  
	/* execute the statement against the database and assign the
	   resulting array to variable runs */
	   $runs = $stmt->fetchAll(PDO::FETCH_OBJ);
	   // close database connection by destroying the object that ref's it
	   $dbh = null;
	   /* return results to client, encoded as JSON and wrapped in a
	      dictionary with key "items" */
	      echo '{"items":'. json_encode($runs) .'}'; 
  } catch(PDOException $e) {
  /* return exceptions as a dictionary with key "error".  If an 
     exception is thrown when creating a DB connection, and not
        caught, a full "backtrace" log may be shown -- not good */
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
  }

?>
