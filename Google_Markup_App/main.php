<!DOCTYPE html>

<?php
include 'geocode.php';
include_once 'class.MySQL.php';
/*
            Author: Rupinder Singh Matharoo
            [ Vancouver City Crime Markup Application Project Prototype ]
            Date: 25 November 2013
*/
		//Reading the CSV File


		//Reading the updated table with Geocodes..
		$objMySQL = new MySQL('crimedata','root','');
		//Saving the records contents to Array for JavaScript Access
		$arraydb = $objMySQL->Select('Markers');
		$objMySQL->CloseConnection();

?>

<html lang="en">
  <head>
    <meta charset="utf-8">
   
    <title>Vancouver City Crime Markup Application by Rupinder Matharoo</title>
    <link href="CSS/styles.css" rel='stylesheet' type="text/css" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:300,400,600,700,800|Gentium+Book+Basic:400,400italic|Vollkorn:400italic,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Gravitas+One|Lato:100,900|Old+Standard+TT:400,400italic|PT+Serif:400|PT+Sans+Narrow:700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Sans:700|Merriweather:400,900|Playfair+Display:400,900,700italic|Oswald:700|PT+Mono' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Cardo:400,400italic' rel='stylesheet' type='text/css'>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<style>
form { display: block; margin: 20px auto; background: #eee; border-radius: 10px; padding: 15px }
#progress { position:relative; width:400px; border: 1px solid #ddd; padding: 1px; border-radius: 3px; float:left; }
#bar { background-color: #B4F5B4; width:0%; height:20px; border-radius: 3px; }
#percent { position:absolute; display:inline-block; top:3px; left:48%; }

</style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script type="text/javascript">
    	var markers= [];
    	markers = <?php echo json_encode($arraydb); ?>;
    	var allmarkers = [];
		function initialize() {
				
				var mylat= markers[0]['lat'];
				var mylng= markers[0]['lng'];
				var myLatlng = new google.maps.LatLng(mylat,mylng);
				var mapOptions = {
				    zoom: 13,
				    center: myLatlng,
				    mapTypeId: google.maps.MapTypeId.ROADMAP
				};
				
				var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
				var infowindow = new google.maps.InfoWindow();
				//For demo purpose displaying only 70 Markers
				for(var i=0; i<=markers.length; i++)
				{
					mylat = markers[i]['lat'];
					mylng = markers[i]['lng'];
					myLatlng = new google.maps.LatLng(mylat,mylng);
					var marker = new google.maps.Marker({
					      position: myLatlng,
					      map: map,
					      icon: "images/theft.png",
					      animation: google.maps.Animation.DROP,
					      title: markers[i]['type'] + ' in ' + markers[i]['year']+'/'+ markers[i]['month'],
					      type: markers[i]['type'],
					      visible: true
					});	
					var markerdata= 'Address: '+markers[i]['address']+'<br>Date: '+markers[i]['year']+'/'+markers[i]['month']+'<br>Crime: '+markers[i]['type'];
					makeInfoWindowEvent(map, infowindow, markerdata, marker);
					//setting markers icons
					if(markers[i]['type'] == 'Theft From Auto Under $5000')
					{
						marker.setIcon('images/theft_low.png');
					}
					else if(markers[i]['type'] == 'Theft From Auto Over $5000')
					{
						marker.setIcon('images/theft.png');
					}
					else if(markers[i]['type'] == 'Commercial BE')
					{
						marker.setIcon('images/cbe.png');
					}
					else
					{
						marker.setIcon('images/mis.png');
					}
					//end setting icons
					allmarkers.push(marker);
					console.log(allmarkers[i]);
				}

				
				function makeInfoWindowEvent(map, infowindow, contentString, marker) {
					  google.maps.event.addListener(marker, 'click', function() {
					    infowindow.setContent('<div style="line-height:1.35;overflow:hidden;white-space:nowrap; text-align:left;">'+contentString+'</div>');
					    infowindow.open(map, marker);
					  });
					}

				var removeBtn = document.getElementById("removeBtn");
		        google.maps.event.addDomListener(removeBtn, "click", onRemoveBtn_Clicked);
		}


		function onRemoveBtn_Clicked() {
	        var i;
	          console.log(markers.length);
	        for (i = 0; i < markers.length; i++) {
	            if(markers[i].visible == true)
	            {
	          markers[i].setVisible(false);
	            }
	            else{
	                markers[i].setVisible(true);
	            }
	        }
	      }
		

			//console.log("Draw map function called");
			
			//console.log("total number of markers",allmarkers);

		

		$(document).ready(function()
				{
				    var options = { 
				    beforeSend: function() 
				    {
				        $("#progress").show();
				        //clear everything
				        $("#bar").width('0%');
				        $("#message").html("");
				        $("#percent").html("0%");
				    },
				    uploadProgress: function(event, position, total, percentComplete) 
				    {
				        $("#bar").width(percentComplete+'%');
				        $("#percent").html(percentComplete+'%');
				 
				    },
				    success: function() 
				    {
				        $("#bar").width('100%');
				        $("#percent").html('100%');
				        alert("Complete success!");
				        location.reload();
				    },
				    complete: function(response) 
				    {
				        $("#message").html("<font color='green'>"+response.responseText+"</font>");
				        
				    },
				    error: function()
				    {
				        $("#message").html("<font color='red'> ERROR: unable to upload files</font>");
				    }
				}; 
				 
				     $("#myForm").ajaxForm(options);
				   console.log(options);  
				 		
				});
		google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>

  <body class="index">

    <section id="container">
      <section class="samples">
  <section class="sample" id="title" style="background: url('images/crimecover.jpg') center center no-repeat; background-attachment: fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">
    <section class="text">
      <h1>Vancouver City Crime<span class="kern"></span></h1>
      <h2><span style="color: #0d5ec3;">A Google Maps Markups Application using PHP,MySQL, Javascript and HTML5</span><br><span style="color: black"> by: Rupinder Singh Matharoo</span></h2>

      <section class="intro" style="text-align: center;" id="title">
      <form id="myForm" action="upload.php" method="post" enctype="multipart/form-data">
     <input type="file" size="60" name="myfile">
     <input type="submit" value="Upload">
 </form>
 <div id="progress">
        <div id="bar"></div>
        <div id="percent">0%</div >
        <br/>
        
<div id="message"></div>
</div>

      </section>
    </section>
  </section>

  <section class="sample" id="herzog">
    <section class="text" style="text-align: center; font-size: small; color: white" >
    <p>
<img alt="Theft" src="images/theft_low.png" align="middle">Theft From Auto Under $5000
    <img alt="Theft" src="images/theft.png" align="middle">Theft From Auto Over $5000
    <img alt="Theft" src="images/cbe.png" align="middle">Commercial BE
    <img alt="Theft" src="images/mis.png" align="middle">Mischief Under $5000</p><br><br>
		<!-- <input type="checkbox" id="removeBtn" value="Remove all markers" checked />Theft From Auto Under $5000<br> -->
    <div id="progressbar" style="width:500px;border:1px solid #ccc;"></div>
    <!-- Progress information -->
<div id="information" style="width"></div>    
      </section>
      <div id="map-canvas" style="width:80%; height: 500px; margin-top:10px; margin-left: 10%"></div>
    </section>
  </section>
      <footer style="background: #222; color: white">
        <p>Copyright Rupinder Singh Matharoo 2013</p>
        
      </footer>
    </section>

  </body>
</html>