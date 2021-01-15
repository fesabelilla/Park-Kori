set serveroutput on;
set verify off;

declare
	userName users.uname@site_link%TYPE ;
	pass users.password@site_link%TYPE ;
	email users.email@site_link%TYPE ;
	lin number;
	choice number;
	--userName users@site_link.uname%TYPE
	
begin
	
		userName := '&x';
		email := '&y';
		pass := '&z';

		myPackage.signUp(userName,email,pass);
		dbms_output.put_line('SignUp Successfull');
	
end;
/