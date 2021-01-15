set serveroutput on;
set verify off;

declare
	slotId number := &x;
	userId number ;
	ownerId number;
begin
	 select oid into ownerId from pjw where psid = slotId;
	 userId  := &y;
	 
	 insert into uses@site_link values(userId,slotId,ownerId);
	 
	 UPDATE pjw SET booked = 1 WHERE psid = slotId;
	 commit;
	 
	 
end;
/
select *from uses@site_link;
commit;