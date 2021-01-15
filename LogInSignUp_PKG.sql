--select * from users@site_link;

create or replace package body myPackage as

	function login(username in users.uname@site_link%TYPE , pass in users.password@site_link%TYPE )
		return number
		is

	a  number := 0 ;
	
	begin
	
		select id into a from users@site_link 
		where uname = username and pass = password;
		return a;
		
	exception
		when no_data_found then
			dbms_output.put_line('No data found !! Please  signUp');

		
	end login;
	

	procedure signUp(userName in users.uname@site_link%TYPE , email in users.email@site_link%TYPE, pass in users.password@site_link%TYPE) 			 
		IS
		
		s users.id@site_link%TYPE := 0 ;
		n users.id@site_link%TYPE := 1;
		
	begin
	
	FOR R IN (SELECT id from users@site_link) LOOP
		s := R.id;
	END LOOP;
		s := s + n;
	execute immediate
	'insert into users@site_link (id,uname,email,password) values(:b1, :b2, :b3, :b4)'
      using s,userName,email,pass; 
	commit; 
	dbms_output.put_line(s);
	
	end signUp;


end myPackage;
/