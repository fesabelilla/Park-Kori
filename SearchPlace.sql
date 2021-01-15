create or replace package body SearchArea as

	function searchPlace(loc in location.area@site_link%TYPE)
	return number
	is
		sl number := 0;
		
	begin
		select lid into sl from location@site_link 
		where area = loc;
		return sl;
		
			exception
			when no_data_found then
				dbms_output.put_line('No location found !!');
	
		
	end searchPlace;
	
	--for find location and price
	--/*

	procedure ShowParkingSloat(locid in location.lid@site_link%TYPE) 			 
		IS
		
		--a number := 0 ;
		
		begin
		
		DBMS_OUTPUT.PUT_LINE('ParkingSlotId	Price	Availability	OwnerName	PhoneNo');
		
		FOR R IN (SELECT psid,lid,price,booked,oid,oname,phoneno from pjw) LOOP
			if (locid = R.lid and R.booked = 0) then
				--DBMS_OUTPUT.PUT_LINE(R.psid||'	'||R.lid||'		'||R.price||'	'||R.booked||'		'|| R.oid||'	'||R.oname||'	'|| R.phoneno);
				DBMS_OUTPUT.PUT_LINE(R.psid||'		'||R.price||'		'||R.booked||'	'||R.oname||'		'|| R.phoneno);
			end if;
			
		END LOOP;
		
		 --execute immediate 'select psid,lid,price,booked,oid,phoneno from pjw where oid = (:b1)'using locid;
		--Uses(a);
	
		end ShowParkingSloat;
	
	
	
	--*/
	
	

end SearchArea;
/