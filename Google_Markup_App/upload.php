<?php
include 'geocode.php';
include_once 'class.MySQL.php';
/*
            Author: Rupinder Singh Matharoo
            Vancouver City Crime Markup Application Project Prototype
            Date: 25 November 2013
*/
		$output_dir = "uploads/";
		 
		$db = mysql_connect('localhost', 'root', '');
				
		if (!$db) {
		    die("Sorry, database error!");
		}
		
				
		mysql_select_db('crimedata',$db);
		
		if(isset($_FILES["myfile"]))
		{
		    //Filter the file types , if you want.
		    if ($_FILES["myfile"]["type"] == "text/csv")
		    {
		    	//move the uploaded file to uploads folder;
		        move_uploaded_file($_FILES["myfile"]["tmp_name"],$output_dir. $_FILES["myfile"]["name"]);
		     	echo "Uploaded File :".$_FILES["myfile"]["name"];
		     	$csvFile = "uploads/".$_FILES["myfile"]["name"];
		     	echo "<br>upload files is:".$csvFile;
		     	$csv = readCSV($csvFile);
				$recordcount = count($csv);
				
				echo "<br>records found: ".$recordcount;
				addrecords($csv);
				echo "<br>Adding records completed...";
				geocode_addresses();
				echo "<br>Geocode Success!...";
				
		    }
		    elseif ($_FILES["myfile"]["error"] > 0)
		    {
		      echo "Error: " . $_FILES["file"]["error"] . "<br>";
		    }
		    else
		    {
		    	echo "Only upload CSV files!<br>";
		    }
		}

		function readCSV($csvFile){
			$file_handle = fopen($csvFile, 'r');
			while (!feof($file_handle) ) {
				$line_of_text[] = fgetcsv($file_handle, 1024);
			}
			fclose($file_handle);
			return $line_of_text;
		}
		
		function addrecords($csv){
			$count_adds=0;
			for($i=1;$i<40;$i++)
			{
				//MySQL DB connection and adding the csv records to SQL..
				$objMySQL = new MySQL('crimedata','root','');
				$newrecord = array('type' => $csv[$i][0], 'city' => 'Vancouver' ,'address' => $csv[$i][3], 'year' => $csv[$i][1], 'month' => $csv[$i][2] ,'lat' => '', 'lng' => '');
			//	print_r("<br>$i: ".$csv[$i][0]." ".$csv[$i][1]." ".$csv[$i][2]." ".$csv[$i][3]."\n");
				$check = $csv[$i][3];
				//echo "checking for : $check";
				$sql = "SELECT address FROM Markers WHERE address='$check'";
				//echo "checking for $check";
				$result = mysql_query($sql);
				if(mysql_num_rows($result) > 0)
				{
				    //echo"yes exists!!";// row exists. do whatever you would like to do.
				    continue;
				}
				else {
					//echo"Inserting Record"; // do other stuff...
					$objMySQL->Insert($newrecord, 'Markers');
					$count_adds = $count_adds + 1;
				}
				//--END MySQL
			}
			echo "<br>Number of records added : $count_adds";
			$objMySQL->CloseConnection();
		}
		
		function geocode_addresses()
		{
			//Generate Geocodes to do the caching, so that we don't overrun the limit of 2500 requests per day
			//Once the record has been Geocoded, it will not be processed again.	
			//Reading records from MySQL
			$db = mysql_connect('localhost', 'root', '');
			
			if (!$db) {
			    die("Sorry, database error!");
			}
			
			mysql_select_db('crimedata',$db);
			$sql = "SELECT * FROM  `Markers`";
			$result = mysql_query($sql);
			
			//Initialize the delay in geocode..
			$delay = 0;
			while($row = @mysql_fetch_assoc($result))
			{
			  $geocode_pending = true;
			  while ($geocode_pending) {
				    $address = $row["address"];
				    $id = $row["id"];
				    if($row["lat"]==0 && $row["lng"]==0)
				    {
					    $reqaddress=urlencode($address);
						$loc = geocoder::getLocation($reqaddress.", Vancouver, BC");
				    	$status = $loc['status'];
					    if (strcmp($status, "OK") == 0 && $loc['results'][0]['geometry']['location']['lat'] !=0 && $loc['results'][0]['geometry']['location']['lng'] !=0) {
					      // successful geocode
					      $geocode_pending = false;
					      $lat = $loc['results'][0]['geometry']['location']['lat'];
					      $lng = $loc['results'][0]['geometry']['location']['lng'];
					
					      $query = sprintf("UPDATE Markers " .
					             " SET lat = '%s', lng = '%s' " .
					             " WHERE id = '%s' LIMIT 1;",
					             mysql_real_escape_string($lat),
					             mysql_real_escape_string($lng),
					             mysql_real_escape_string($id));
					      $update_result = mysql_query($query);
					      if (!$update_result) {
					        die("Invalid query: " . mysql_error());
					      }
					      $delay += 700;
					    } else if (strcmp($status, "620") == 0) {
					    	$geocode_pending = false;
					      // sent geocodes too fast
					      $delay += 100000;
					    } else {
					      // failure to geocode
					      $geocode_pending = false;
					      echo "Address " . $address . " failed to geocoded. ";
					      echo "Received status " . $status . "\n";
					      $delay += 100000;
					    }
					    usleep($delay);
					}
					else{
				  		$geocode_pending =false;
				  	}
			  }
			}
			mysql_close($db);
			//-- END OF GEOCODING AND UPDATING TABLE...	
		}
?>