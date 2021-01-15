set serveroutput on;
set verify off;

declare
	slotId number;
	userId number;
	userName users.uname@site_link%TYPE := '&x';
	sprice number;
	hours number := &y;
	calPrice number := 0;
begin
	
	select id into userId from users@site_link where uname = userName;
	select psid into slotId from uses@site_link where id = userId; -- find slotid
	select price into sprice from pjw where psid = slotId; --find price
	DELETE FROM uses@site_link WHERE psid = slotId;
	calPrice := sprice * hours;

	dbms_output.put_line('Total Price : '||calPrice ||' Taka');
	UPDATE pjw SET booked = 0 WHERE psid = slotId;
	commit;
 
end;
/
