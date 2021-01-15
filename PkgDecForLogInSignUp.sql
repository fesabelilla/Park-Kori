create or replace package myPackage as
	
	function login(username in users.uname@site_link%TYPE , pass in users.password@site_link%TYPE)
		return number;

	procedure signUp(userName in users.uname@site_link%TYPE , email in users.email@site_link%TYPE, pass in users.password@site_link%TYPE );	
	
end myPackage;
/