use lahman2016;

select b.playerID,m.nameFirst, m.nameLast, b.yearID, b.teamID, b.G, b.AB,  b.H, b.2B, b.3B, b.HR, b.R, b.RBI, b.SB, b.SO , 
(((b.H-b.2B-b.3B-b.HR) + b.2B*2 + b.3B*3 + b.HR*4 + (b.BB+b.IBB) + b.R + b.RBI + b.SB*0.25 - b.SO*0.25) / b.G) / 4.875 *100 as Score from batting b
join master m on m.playerID = b.playerID
 where b.yearID > 2007 and b.AB > 200 order by Score DESC;