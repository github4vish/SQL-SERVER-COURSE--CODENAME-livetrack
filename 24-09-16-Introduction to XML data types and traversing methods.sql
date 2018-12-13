
--Common XML methods that are usefull ain real time
	--.query()
	--.exists()
	--.value()
	--.modify()
	--.nodes()



--select 
--    t.x.value('FacilityID[1]','int') as FacilityID,
--    t.x.value('Category[1]','int') as CategryID
--from @yourxml.nodes('/Facilities/Facility') t(x)



--select 
--    t.x.value('FacilityID[1]','int') as FacilityID,
--    t.x.value('Category[1]','int') as CategryID
--from @yourxml.nodes('/Facilities/Facility') t(x)



DECLARE @XML XML

SET @XML
='
<rows>
<row>
  <EMPID>1</EMPID>
  <FullName>ASHWIN M</FullName>
  <DeptID>10</DeptID>
  <EmailID>ashwinprince30@gmail.com</EmailID>
</row>
<row>
  <EMPID>2</EMPID>
  <FullName>Chaitanya M</FullName>
  <DeptID>15</DeptID>
  <EmailID>chaitanyamullaguri@gmail.com</EmailID>
</row>
<row>
  <EMPID>3</EMPID>
  <FullName>Chakradhar K</FullName>
  <DeptID>113</DeptID>
  <EmailID>kpkp227@gmail.com</EmailID>
</row>
<row>
  <EMPID>4</EMPID>
  <FullName>Dileep M</FullName>
  <DeptID>113</DeptID>
  <EmailID>dileep.mungara32@gmail.com</EmailID>
</row>
<row>
  <EMPID>9</EMPID>
  <FullName>Narendra babu</FullName>
  <DeptID>15</DeptID>
  <EmailID>narendrabv225@gmail.com</EmailID>
</row>
<row>
  <EMPID>10</EMPID>
  <FullName>Nikhil B N</FullName>
  <DeptID>17</DeptID>
  <EmailID>Abc@Def.com</EmailID>
</row>
<row>
  <EMPID>13</EMPID>
  <FullName>Prabhakar K</FullName>
  <DeptID>15</DeptID>
  <EmailID>prabhakara.kalikiri@gmail.com</EmailID>
</row>
<row>
  <EMPID>14</EMPID>
  <FullName>RAFI P</FullName>
  <DeptID>17</DeptID>
  <EmailID>rafi.porala@gmail.com</EmailID>
</row>
<row>
  <EMPID>15</EMPID>
  <FullName>RAJESH.B</FullName>
  <DeptID>113</DeptID>
 </row>
<row>
  <EMPID>16</EMPID>
  <DeptID>15</DeptID>
  <EmailID>bknram@gmail.com</EmailID>
</row>
</rows>
'

--SELECT @XML


select 
    t.x.value('EMPID[1]','int') as EMPID
   ,t.x.value('FullName[1]','VARCHAR(50)') as FullName
   ,t.x.value('DeptID[1]','int') as DeptID
   ,t.x.value('EmailID[1]','VARCHAR(100)') as EmailID
from @XML.nodes('/rows/row') t(x)


