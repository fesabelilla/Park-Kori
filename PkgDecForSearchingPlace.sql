create or replace package SearchArea as
	
	function searchPlace(loc in location.area@site_link%TYPE)
	return number;
	procedure ShowParkingSloat(locid in location.lid@site_link%TYPE);	

	
end SearchArea;
/