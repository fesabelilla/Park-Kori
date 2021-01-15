create or replace view pjw(psid,lid,price,booked,oid,oname,phoneno) as
			select p.psid,p.lid,p.price,p.booked,w.oid,w.oname,w.phoneno
			from parkingsloat@site_link p, owner@site_link w
			where p.oid = w.oid;