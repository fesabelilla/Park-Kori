clear screen;
set serveroutput on;
set verify off;

declare
	userName users.uname@site_link%TYPE ;
	pass users.password@site_link%TYPE ;
	lin number := 0 ;
	--s users.id@site_link%TYPE := 0 ;
	loc location.area@site_link%TYPE;
	locid number;
	
	
begin	
	userName := '&x';
	pass := '&y';
	lin := myPackage.login(userName,pass);
	
	
	dbms_output.put_line('login successful . User Id :   '||lin);
	
	--for searching area
	loc := '&z';
	locid := SearchArea.searchPlace(loc);
	--dbms_output.put_line(locid);
	SearchArea.ShowParkingSloat(locid);
		
end;
/