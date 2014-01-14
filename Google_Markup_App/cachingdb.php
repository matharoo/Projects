<?php
/*
            Author: Rupinder Singh Matharoo
            Vancouver City Crime Markup Application Project Prototype
            Date: 27 October 2013
            This file is used to setup the database server on the PC where you are hosting your apache server..
            username: "root"
            password: ""
            servername: "localhost"
*/
		$con = mysqli_connect("localhost","root","");
		$database= "crimedata";
		// Check connection
		if (mysqli_connect_errno())
		  {
		  echo "Failed to connect to MySQL: " . mysqli_connect_error();
		  }
		
		// Create database
		$sql="CREATE DATABASE $database";
		if (mysqli_query($con,$sql))
		  {
		  echo "Database $database created successfully";
		  }
		else
		  {
		  echo "Error creating database: " . mysqli_error($con);
		  }
		  
		  //Create Table
		$con=mysqli_connect("localhost","root","",$database);
		// Check connection
		if (mysqli_connect_errno())
		  {
		  echo "Failed to connect to MySQL: " . mysqli_connect_error();
		  }
		  //$sql= "DROP TABLE markers";
		//  /* 
		$sql="CREATE TABLE `Markers` (
		  `id` int(11) NOT NULL auto_increment,
		  `type` varchar(40) NOT NULL,
		  `city` varchar(30) NOT NULL,
		  `address` varchar(255) NOT NULL,
		  `year` year(4) default NULL,
		  `month` TINYINT(2) default NULL,
		  `lat` float default NULL default '0',
		  `lng` float default NULL default '0',
		  PRIMARY KEY  (`id`)
		)";
//*/
		// Execute query
		if (mysqli_query($con,$sql))
		  {
		  echo "created table successfuly!";
		  }
		else
		  {
		  echo "Error creating table: " . mysqli_error($con);
		  }
		
?>