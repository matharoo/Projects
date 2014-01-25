//Author: Rupinder Singh Matharoo 
//Dated: January 20,2014
// This small Application uses jQuery, JSON, and Google GeoCode API to get the Address Coordinates. The query if valid returns number of results with link and coordinates. App also allows you to reverse geocode the longitude and latitude values to give you the address suggestions returned by the Google geocode API.
$(document).ready(function(){
        //hide the menu when app starts..
        $("#geocoding").hide();
        $("#reverse").hide();
        //Geocoding the addresses
        $("#getgeo").click(function(){
            $("#geo").find("tbody").remove();
            var add= $("#add").val();
            if(add==""){
                $('#geo').append('<tr><td>No string entered!!<br></td></tr>');
            }
            else{   
             $.getJSON('http://maps.google.com/maps/api/geocode/json?sensor=false&address='+add, function(jd) {
                 $("#geo").append('<tr><th>Address</th> <th>Latitude</th><th>Longitude</th></tr>'); 
                if(jd.status=="OK"){
                    for(var i=0; i<jd.results.length; i++){
                    var lat= jd.results[i].geometry.location.lat;
                    var lng= jd.results[i].geometry.location.lng;
                    var link = "http://maps.google.com/?q="+lat+","+lng;
                    $('#geo').append('<tr><td><a target="_blank" href='+link+'>' + jd.results[i].formatted_address +'</a></td>'+ 
                                     '<td>' + lat + '</td>' + 
                                     '<td>' + lng +'</td>' + 
                                     '</tr>');
                     }
                 }
                 if(jd.status=="ZERO_RESULTS"){
                        $('#geo').append('<tr><td>'+add+' not found! <br></td></tr>');
                         }
              });
            }
        });
        //Reverse Geocoding
        $("#getadd").click(function(){
            $("#geo").find("tbody").remove();
            var latlng= $("#lat").val()+","+$("#lng").val();
            //console.log(latlng);
            if($("#lat").val()=="" || $("#lng").val()==""){
                $('#geo').append('<tr><td>Please enter both Latitude and Longitude values<br></td></tr>');
            }
            if($("#lat").val()!="" && $("#lng").val()!=""){
             $.getJSON('http://maps.googleapis.com/maps/api/geocode/json?sensor=false&latlng='+latlng, function(jd) {
                 $("#geo").append('<tr><th>Approx. Address</th> <th>Country</th><th>ISO Code</th></tr>'); 
                if(jd.status=="OK"){
                   // console.log(jd.results.length);
                    for(var i=0; i<jd.results.length; i++){
                    var addr= new String;
                    addr= jd.results[i].formatted_address;
                    //encoding the address value to concatenate into the link...
                    var links = "http://maps.google.com/?q="+encodeURIComponent(addr);
                    var country = "";
                    var ctrcode = "";
                        for(var j=0; j<jd.results[i].address_components.length; j++){
                            if(jd.results[i].address_components[j].types[0] =="country")
                            {
                                country = jd.results[i].address_components[j].long_name;
                                ctrcode = jd.results[i].address_components[j].short_name;
                            }   
                        }
                    $('#geo').append('<tr><td><a target="_blank" href='+links+'>' + jd.results[i].formatted_address +'</a></td>'+
                                     '<td>' + country + '</td>' +
                                     '<td>'+ ctrcode + '</td>' +
                                     '</tr>');
                     }
                 }
                 if(jd.status=="ZERO_RESULTS"){
                        $('#geo').append('<tr><td>Address not found! <br></td></tr>');
                         }
              });
            }
        });
        $("#clear1").click(function(){
            $("#geo").find("tbody").remove();
        });
        
        $("#clear2").click(function(){
            $("#geo").find("tbody").remove();
        });
        
        $("#radgeo").click(function(){
            if($("#radgeo").is(":checked")){
                $("#geo").find("tbody").remove();
                $("#geocoding").show(500).fadeIn;
                $("#reverse").hide(500).fadeIn;
            }
        });
        
        $("#radrev").click(function(){
            if($("#radrev").is(":checked")){
                $("#geo").find("tbody").remove();
                $("#geocoding").hide(500).fadeIn;
                $("#reverse").show(500).fadeIn;
            }
        });
        
    });//End of main document ready function