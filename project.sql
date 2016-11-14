Select a.name
From Athletes a inner join Medal m on a.name = m.name AND a.DOB = m.DOB
where m.gold + m.silver + m.bronze >= ALL ( select m2.gold + m2.silver + m2.bronze
					from Medal m2)

sqlplus 'cis550poke32@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP) (HOST=cis550poke32.cguwhx0yelq2.us-west-2.rds.amazonaws.com)(PORT=1521)) (CONNECT_DATA=(SID=CIS550DB)))'
