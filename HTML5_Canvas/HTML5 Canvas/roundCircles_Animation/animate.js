$(document).ready(function() {	
    
    /*
            Mod-Author: Rupinder Singh Matharoo
            Description: Assign Random colors to the asteroids when asteroids collide..when same color asteroids collide their color is randomly changed to starting random colors like red,blue,green, white & black.This brings more randomness and more activity in asteroids. Also acceleration is added to one of the asteroids.
    */
	var canvas = $("#myCanvas");
	var context = canvas.get(0).getContext("2d");
	
	var canvasWidth = canvas.width();
	var canvasHeight = canvas.height();
	
	$(window).resize(resizeCanvas);
	
	function resizeCanvas() {
		canvas.attr("width", $(window).get(0).innerWidth);
		canvas.attr("height", $(window).get(0).innerHeight);
		
		canvasWidth = canvas.width();
		canvasHeight = canvas.height();
	};
	
	resizeCanvas();
	
	var playAnimation = true;
	
	var startButton = $("#startAnimation");
	var stopButton = $("#stopAnimation");
    
    //Color Vaiables
    
	//variable for storing color fillstyle during collission
    var tmpcolor ="";
    var redplusgreen = "rgb(255,255,0)";
    var redplusblue =  "rgb(255,0,255)";
    var greenplusblue = "rgb(0,255,255)";
    var orange = "rgb(255,127,0)";
    //End of Color Vaiables
    
	startButton.hide();
	startButton.click(function() {
		$(this).hide();
		stopButton.show();
		
		playAnimation = true;
		animate();
	});
	
	stopButton.click(function() {
		$(this).hide();
		startButton.show();
		
		playAnimation = false;
	});
    
	// Class that defines new asteroids to draw
	var Asteroid = function(x, y, radius, mass, vX, vY, aX, aY,color) {
		this.x = x;
		this.y = y;
		this.radius = radius;
		this.mass = mass;
		this.vX = vX;
		this.vY = vY;
		this.aX = aX;
		this.aY = aY;
        this.fillStyle = color;
       
	};
	
	// Array that holds all the asteroids to draw
	var asteroids = new Array();
	
    //Calling function setAsteroids(number of asteroids to create)
    setAsteroids(50);
	
	
    function setAsteroids(number)
    {
            // Setting up some asteroids
        for (var i = 0; i < number; i++) {
            var x = 20+(Math.random()*(canvasWidth-40));
            var y = 20+(Math.random()*(canvasHeight-40));
            
            var radius = 5+Math.random()*10;
            var mass = radius/2;
            
            var vX = Math.random()*4-2;
            var vY = Math.random()*4-2;
    
            var aX = 0;
            var aY = 0;
            
            var color = randomcolor();
    
            asteroids.push(new Asteroid(x, y, radius, mass, vX, vY, aX, aY,color));
        };
    }
    
    function randomcolor()
    {
        var colors = Math.floor((Math.random()*5)+1);
        var color = "rgb(255, 255, 255)";
        switch(colors)
        {
            //red
            case 1:
                //console.log("color code is red :",color);
                color = "rgb(255, 0, 0)";
                break;
            //black
            case 2:
                //console.log("color code is black :",color);
                color = "rgb(0, 0, 0)";
                break;
            //white
            case 3:
                //console.log("color code is white :",color);
                color = "rgb(255, 255, 255)";
                break;
            //blue
            case 4:
                //console.log("color code is blue :",color);
                color = "rgb(0, 0, 255)";
                break;
            //green
            case 5:
               //console.log("color code is green:",color);
                color = "rgb(0, 255, 0)";
                break;
        }   
        return color;
    }
    
	// Animation loop that does all the fun stuff
	function animate() {					
		// Clear
		context.clearRect(0, 0, canvasWidth, canvasHeight);
		
		// Loop through every asteroid
		var asteroidsLength = asteroids.length;
		for (var i = 0; i < asteroidsLength; i++) {
            
			var tmpAsteroid = asteroids[i];
			
			for (var j = i+1; j < asteroidsLength; j++) {
                context.fillStyle = asteroids[i].fillStyle;
				var tmpAsteroidB = asteroids[j];
				
				var dX = tmpAsteroidB.x - tmpAsteroid.x;
				var dY = tmpAsteroidB.y - tmpAsteroid.y;
				var distance = Math.sqrt((dX*dX)+(dY*dY));
				
				if (distance < tmpAsteroid.radius + tmpAsteroidB.radius) {
					var angle = Math.atan2(dY, dX);
					var sine = Math.sin(angle);
					var cosine = Math.cos(angle);
					
					// Rotate asteroid position
					var x = 0;
					var y = 0;
					
					// Rotate asteroidB position
					var xB = dX * cosine + dY * sine;
					var yB = dY * cosine - dX * sine;
						
					// Rotate asteroid velocity
					var vX = tmpAsteroid.vX * cosine + tmpAsteroid.vY * sine;
					var vY = tmpAsteroid.vY * cosine - tmpAsteroid.vX * sine;
					
					// Rotate asteroidB velocity
					var vXb = tmpAsteroidB.vX * cosine + tmpAsteroidB.vY * sine;
					var vYb = tmpAsteroidB.vY * cosine - tmpAsteroidB.vX * sine;
					
					var vTotal = vX - vXb;
					vX = ((tmpAsteroid.mass - tmpAsteroidB.mass) * vX + 2 * tmpAsteroidB.mass * vXb) / (tmpAsteroid.mass + tmpAsteroidB.mass);
					vXb = vTotal + vX;
					
                    //detecting black and white collissions and exchanging their colors
                    if((tmpAsteroid.fillStyle == "rgb(0, 0, 0)" && tmpAsteroidB.fillStyle == "rgb(255, 255, 255)") || 
                       (tmpAsteroid.fillStyle =="rgb(255, 255, 255)" && tmpAsteroidB.fillStyle =="rgb(0, 0, 0)" ))
                     {
                         //console.log("black white collision! detected..");
                         tmpcolor = tmpAsteroid.fillStyle;
                         tmpAsteroid.fillStyle = tmpAsteroidB.fillStyle;
                         tmpAsteroidB.fillStyle = tmpcolor;
                     }
                                                                          
                     //red + green= yellow
                     else if((tmpAsteroid.fillStyle == "rgb(255, 0, 0)" && tmpAsteroidB.fillStyle == "rgb(0, 255, 0)" )|| 
                             (tmpAsteroid.fillStyle =="rgb(0, 255, 0)" && tmpAsteroidB.fillStyle =="rgb(255, 0, 0)" ))
                     {
                         //console.log("red and green collision! detected..");
                         tmpAsteroidB.fillStyle = redplusgreen;
                         tmpAsteroid.fillStyle = tmpAsteroidB.fillStyle;
                     }
                    
                     //red + blue = magenta 
                    else if((tmpAsteroid.fillStyle == "rgb(255, 0, 0)" && tmpAsteroidB.fillStyle == "rgb(0, 0, 255)") || 
                            (tmpAsteroid.fillStyle =="rgb(0, 0, 255)" && tmpAsteroidB.fillStyle =="rgb(255, 0, 0)" ))
                     {
                         //console.log("red and blue collision! detected..");
                         tmpAsteroidB.fillStyle = redplusblue;
                         tmpAsteroid.fillStyle = tmpAsteroidB.fillStyle;
                     } 
                    
                    //green + blue = cyan 
                    else if((tmpAsteroid.fillStyle == "rgb(0, 255, 0)" && tmpAsteroidB.fillStyle == "rgb(0, 0, 255)") || 
                            (tmpAsteroid.fillStyle =="rgb(0, 0, 255)" && tmpAsteroidB.fillStyle =="rgb(0, 255, 0)" ))
                     {
                         //console.log("green and blue collision! detected..");
                         tmpAsteroidB.fillStyle = greenplusblue;
                         tmpAsteroid.fillStyle = tmpAsteroidB.fillStyle;
                     }
                    
                    //red + yellow gives out orange...
                    else if((tmpAsteroid.fillStyle == "rgb(255, 0, 0)" && tmpAsteroidB.fillStyle == redplusgreen) || 
                            (tmpAsteroid.fillStyle ==redplusgreen && tmpAsteroidB.fillStyle =="rgb(255, 0, 0)" ))
                     {
                         //console.log("red and yellow collision! detected..");
                         tmpAsteroidB.fillStyle = orange;
                         tmpAsteroid.fillStyle = tmpAsteroidB.fillStyle;
                     }
                    
                    //yellow + blue multiply by 0.5= grey
                    else if((tmpAsteroid.fillStyle == "rgb(255,255,0)" && tmpAsteroidB.fillStyle == "rgb(0, 0, 255)") || 
                            (tmpAsteroid.fillStyle =="rgb(0, 0, 255)" && tmpAsteroidB.fillStyle =="rgb(255,255,0)" ))
                     {
                         //console.log("yellow and blue collision! detected..");
                         tmpAsteroidB.fillStyle = "rgb(127,127,127)";
                         tmpAsteroid.fillStyle = tmpAsteroidB.fillStyle;
                     }
                    
                    //if colliding colors are same it selects colors out of randomcolor() function which are green,white,black,blue and red...
                    else if(tmpAsteroid.fillStyle ==  tmpAsteroidB.fillStyle)
                     {
                         console.log("same color collision! detected..");
                         tmpAsteroidB.fillStyle = randomcolor();
                         tmpAsteroid.fillStyle = randomcolor();
                         // Then add some acceleration to one of the asteroids...
                         tmpAsteroid.vX += tmpAsteroid.aX;
                         tmpAsteroid.vY += tmpAsteroid.aY;
                         
                     } 
                                                                          
					// Move asteroids apart
					xB = x + (tmpAsteroid.radius + tmpAsteroidB.radius);
					
					// Rotate asteroid positions back
					tmpAsteroid.x = tmpAsteroid.x + (x * cosine - y * sine);
					tmpAsteroid.y = tmpAsteroid.y + (y * cosine + x * sine);
					
					tmpAsteroidB.x = tmpAsteroid.x + (xB * cosine - yB * sine);
					tmpAsteroidB.y = tmpAsteroid.y + (yB * cosine + xB * sine);
					
					// Rotate asteroid velocities back
					tmpAsteroid.vX = vX * cosine - vY * sine;
					tmpAsteroid.vY = vY * cosine + vX * sine;
					
					tmpAsteroidB.vX = vXb * cosine - vYb * sine;
					tmpAsteroidB.vY = vYb * cosine + vXb * sine;
                                                                          
                     
				};
			};
			
			// Calculate velocity based on pixels-per-frame
			tmpAsteroid.x += tmpAsteroid.vX;
			tmpAsteroid.y += tmpAsteroid.vY;
			
			// Add acceleration to velocity
			if (Math.abs(tmpAsteroid.vX) < 10) {
				tmpAsteroid.vX += tmpAsteroid.aX;
			};
			
			if (Math.abs(tmpAsteroid.vY) < 10) {
				tmpAsteroid.vY += tmpAsteroid.aY;
			};
			
			// Boundary collision checks
			if (tmpAsteroid.x-tmpAsteroid.radius < 0) {
                
				tmpAsteroid.x = tmpAsteroid.radius; // Move away from the edge
				tmpAsteroid.vX *= -1;
				tmpAsteroid.aX *= -1;
			} else if (tmpAsteroid.x+tmpAsteroid.radius > canvasWidth) {
				tmpAsteroid.x = canvasWidth-tmpAsteroid.radius; // Move away from the edge
				tmpAsteroid.vX *= -1;
				tmpAsteroid.aX *= -1;
			};
			
			if (tmpAsteroid.y-tmpAsteroid.radius < 0) {
				tmpAsteroid.y = tmpAsteroid.radius; // Move away from the edge
				tmpAsteroid.vY *= -1;
				tmpAsteroid.aY *= -1;
			} else if (tmpAsteroid.y+tmpAsteroid.radius > canvasHeight) {
				tmpAsteroid.y = canvasHeight-tmpAsteroid.radius; // Move away from the edge
				tmpAsteroid.vY *= -1;
				tmpAsteroid.aY *= -1;
			};
			
			context.beginPath();
                    
        
			context.arc(tmpAsteroid.x, tmpAsteroid.y, tmpAsteroid.radius, 0, Math.PI*2);
			context.closePath();
			context.fill();
            
		};
		
		if (playAnimation) {
			// Run the animation loop again in 33 milliseconds
			setTimeout(animate, 33);
		};
	};
    
	   
	// Start the animation loop
	animate();
});
