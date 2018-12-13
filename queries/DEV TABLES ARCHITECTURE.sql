------------------------------CREATION----------------------------------------------------------------
CREATE TABLE CUSTOMERS
(
	CUSTOMERID	 INT PRIMARY KEY,
	CUSTOMERNAME NVARCHAR(100),
	CONTACTNAME	 NVARCHAR(100),
	ADDRESS1	 NVARCHAR(100),	
	CITY		 NVARCHAR(100),
	POSTALCODE   INT,
	COUNTRY		 NVARCHAR(100)
)

DROP TABLE CUSTOMERS

CREATE TABLE EMPLOYEE
(
	EMPLOYEEID  INT PRIMARY KEY,	
	LASTNAME	NVARCHAR(100),
	FIRSTNAME	NVARCHAR(100),
	BIRTHDATE	DATE,
	PHOTO	NVARCHAR(100),
	NOTES  NVARCHAR(MAX)
)

DROP TABLE EMPLOYEE

CREATE TABLE ORDERDETAILS
(
	ORDERDETAILS INT PRIMARY KEY,
	ORDERID	INT FOREIGN KEY REFERENCES ORDERS(ORDERID),
	PRODUCTID INT FOREIGN KEY REFERENCES PRODUCTS(PRODUCTID),
	QUANTITY NVARCHAR(100)
)

DROP TABLE ORDERDETAILS

CREATE TABLE ORDERS
(
    ORDERID INT PRIMARY KEY,
	CustomerID	INT FOREIGN KEY REFERENCES CUSTOMERS(CUSTOMERID),
	EmployeeID	INT  FOREIGN KEY REFERENCES EMPLOYEE(EmployeeID),
	ORDERDATE	DATE,
	SHIPPERID INT FOREIGN KEY REFERENCES SHIPPERS(SHIPPERID)
)

DROP TABLE ORDERS

CREATE TABLE PRODUCTS 
(
	PRODUCTID INT PRIMARY KEY,
	PRODUCTNAME NVARCHAR(100),
	SUPPLIERID INT FOREIGN KEY REFERENCES SUPPLIERS(SUPPLIERID) ,
	CATEGORYID	INT,
	UNIT	NVARCHAR(100),
	PRICE MONEY
)

DROP TABLE PRODUCTS

CREATE TABLE  SHIPPERS
(
	SHIPPERID INT PRIMARY KEY,
	SHIPPERNAME NVARCHAR(100),
	PHONE INT
)

DROP TABLE SHIPPERS

CREATE TABLE SUPPLIERS
(
	SUPPLIERID	INT PRIMARY KEY,
	SUPPLIERNAME NVARCHAR(100),
	CONTACTNAME	 NVARCHAR(100),
	ADDRESS1 NVARCHAR(100),
	CITY NVARCHAR(100),
	POSTALCODE INT,
	COUNTRY NVARCHAR(100),
	PHONE INT
)

DROP TABLE SUPPLIERS

CREATE TABLE CATEGORIESDETAILS
(

    CATEGORYID INT PRIMARY KEY,
	CATEGORYNAME NVARCHAR(100),
	DESCRIPTIONS NVARCHAR(100)
)

DROP TABLE CATEGORIESDETAILS

CREATE TABLE PRODUCTS 
(
	PRODUCTID INT PRIMARY KEY,
	PRODUCTNAME NVARCHAR(100),
	SUPPLIERID INT FOREIGN KEY REFERENCES SUPPLIERS(SUPPLIERID) ,
	CATEGORYID	INT FOREIGN KEY REFERENCES CATEGORIESDETAILS(CATEGORYID),
	UNIT	NVARCHAR(100),
	PRICE MONEY
)

DROP TABLE PRODUCTS
------------------------------INSERTION----------------------------------------------------------------
--Employee Insert data

INSERT INTO Employees
SELECT '1','Davolio','Nancy','12/8/1968','EmpID1.pic','Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of Toastmasters International' UNION ALL
SELECT '2','Fuller','Andrew','2/19/1952','EmpID2.pic','Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association'UNION ALL
SELECT '3','Leverling','Janet','8/30/1963','EmpID3.pic','Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative'UNION ALL
SELECT '4','Peacock','Margaret','9/19/1958','EmpID4.pic','Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle'UNION ALL
SELECT '5','Buchanan','Steven','3/4/1955','EmpID5.pic','Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management. He is fluent in French'UNION ALL
SELECT '6','Suyama','Michael','7/2/1963','EmpID6.pic','Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional. He is fluent in Japanese and can read and write French, Portuguese, and Spanish'UNION ALL
SELECT '7','King','Robert','5/29/1960','EmpID7.pic','Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled Selling in Europe, he was transferred to the London office'UNION ALL
SELECT '8','Callahan','Laura','1/9/1958','EmpID8.pic','Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French'UNION ALL
SELECT '9','Dodsworth','Anne','7/2/1969','EmpID9.pic','Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German'UNION ALL
SELECT '10','West','Adam','9/19/1928','EmpID10.pic','An old chum'

-----------------------------------------------------------------------------------------------------------
--Customer Insert data

INSERT INTO Customers
SELECT '1','Alfreds Futterkiste','Maria Anders','Obere Str. 57','Berlin','12209','Germany' UNION ALL 
SELECT ' 2','Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constituci�n 2222','M�xico D.F.','5021','Mexico' UNION ALL 
SELECT ' 3','Antonio Moreno Taquer�a','Antonio Moreno','Mataderos 2312','M�xico D.F.','5023','Mexico' UNION ALL 
SELECT ' 4','Around the Horn','Thomas Hardy','120 Hanover Sq.','London','WA1 1DP','UK' UNION ALL 
SELECT ' 5','Berglunds snabbk�p','Christina Berglund','Berguvsv�gen 8','Lule�','S-958 22','Sweden' UNION ALL 
SELECT ' 6','Blauer See Delikatessen','Hanna Moos','Forsterstr. 57','Mannheim','68306','Germany' UNION ALL 
SELECT ' 7','Blondel p�re et fils','Fr�d�rique Citeaux','24, place Kl�ber','Strasbourg','67000','France' UNION ALL 
SELECT ' 8','B�lido Comidas preparadas','Mart�n Sommer','C/ Araquil, 67','Madrid','28023','Spain' UNION ALL 
SELECT ' 9','Bon app"','Laurence Lebihans','12, rue des Bouchers','Marseille','13008','France' UNION ALL 
SELECT ' 10','Bottom-Dollar Marketse','Elizabeth Lincoln','23 Tsawassen Blvd.','Tsawassen','T2F 8M4','Canada' UNION ALL 
SELECT ' 11','B"s Beverages','Victoria Ashworth','Fauntleroy Circus','London','EC2 5NT','UK' UNION ALL 
SELECT ' 12','Cactus Comidas para llevar','Patricio Simpson','Cerrito 333','Buenos Aires','1010','Argentina' UNION ALL 
SELECT ' 13','Centro comercial Moctezuma','Francisco Chang','Sierras de Granada 9993','M�xico D.F.','5022','Mexico' UNION ALL 
SELECT ' 14','Chop-suey Chinese','Yang Wang','Hauptstr. 29','Bern','3012','Switzerland' UNION ALL 
SELECT ' 15','Com�rcio Mineiro','Pedro Afonso','Av. dos Lus�adas, 23','S�o Paulo','05432-043','Brazil' UNION ALL 
SELECT ' 16','Consolidated Holdings','Elizabeth Brown','Berkeley Gardens 12 Brewery','London','WX1 6LT','UK' UNION ALL 
SELECT ' 17','Drachenblut Delikatessend','Sven Ottlieb','Walserweg 21','Aachen','52066','Germany' UNION ALL 
SELECT ' 18','Du monde entier','Janine Labrune','67, rue des Cinquante Otages','Nantes','44000','France' UNION ALL 
SELECT ' 19','Eastern Connection','Ann Devon','35 King George','London','WX3 6FW','UK' UNION ALL 
SELECT ' 20','Ernst Handel','Roland Mendel','Kirchgasse 6','Graz','8010','Austria' UNION ALL 
SELECT ' 21','Familia Arquibaldo','Aria Cruz','Rua Or�s, 92','S�o Paulo','05442-030','Brazil' UNION ALL 
SELECT ' 22','FISSA Fabrica Inter. Salchichas S.A.','Diego Roel','C/ Moralzarzal, 86','Madrid','28034','Spain' UNION ALL 
SELECT ' 23','Folies gourmandes','Martine Ranc�','184, chauss�e de Tournai','Lille','59000','France' UNION ALL 
SELECT ' 24','Folk och f� HB','Maria Larsson','�kergatan 24','Br�cke','S-844 67','Sweden' UNION ALL 
SELECT ' 25','Frankenversand','Peter Franken','Berliner Platz 43','M�nchen','80805','Germany' UNION ALL 
SELECT ' 26','France restauration','Carine Schmitt','54, rue Royale','Nantes','44000','France' UNION ALL 
SELECT ' 27','Franchi S.p.A.','Paolo Accorti','Via Monte Bianco 34','Torino','10100','Italy' UNION ALL 
SELECT ' 28','Furia Bacalhau e Frutos do Mar','Lino Rodriguez','Jardim das rosas n. 32','Lisboa','1675','Portugal' UNION ALL 
SELECT ' 29','Galer�a del gastr�nomo','Eduardo Saavedra','Rambla de Catalu�a, 23','Barcelona','8022','Spain' UNION ALL 
SELECT ' 30','Godos Cocina T�pica','Jos� Pedro Freyre','C/ Romero, 33','Sevilla','41101','Spain' UNION ALL 
SELECT ' 31','Gourmet Lanchonetes','Andr� Fonseca','Av. Brasil, 442','Campinas','04876-786','Brazil' UNION ALL 
SELECT ' 32','Great Lakes Food Market','Howard Snyder','2732 Baker Blvd.','Eugene','97403','USA' UNION ALL 
SELECT ' 33','GROSELLA-Restaurante','Manuel Pereira','5� Ave. Los Palos Grandes','Caracas','1081','Venezuela' UNION ALL 
SELECT ' 34','Hanari Carnes','Mario Pontes','Rua do Pa�o, 67','Rio de Janeiro','05454-876','Brazil' UNION ALL 
SELECT ' 35','HILARI�N-Abastos','Carlos Hern�ndez','Carrera 22 con Ave. Carlos Soublette #8-35','San Crist�bal','5022','Venezuela' UNION ALL 
SELECT ' 36','Hungry Coyote Import Store','Yoshi Latimer','City Center Plaza 516 Main St.','Elgin','97827','USA' UNION ALL 
SELECT ' 37','Hungry Owl All-Night Grocers','Patricia McKenna','8 Johnstown Road','Cork',' ','Ireland' UNION ALL 
SELECT ' 38','Island Trading','Helen Bennett','Garden House Crowther Way','Cowes','PO31 7PJ','UK' UNION ALL 
SELECT ' 39','K�niglich Essen','Philip Cramer','Maubelstr. 90','Brandenburg','14776','Germany' UNION ALL 
SELECT ' 40','La corne d"abondance','Daniel Tonini','67, avenue de l"Europe','Versailles','78000','France' UNION ALL 
SELECT ' 41','La maison d"Asie','Annette Roulet','1 rue Alsace-Lorraine','Toulouse','31000','France' UNION ALL 
SELECT ' 42','Laughing Bacchus Wine Cellars','Yoshi Tannamuri','1900 Oak St.','Vancouver','V3F 2K1','Canada' UNION ALL 
SELECT ' 43','Lazy K Kountry Store','John Steel','12 Orchestra Terrace','Walla Walla','99362','USA' UNION ALL 
SELECT ' 44','Lehmanns Marktstand','Renate Messner','Magazinweg 7','Frankfurt a.M.','60528','Germany' UNION ALL 
SELECT ' 45','Let"s Stop N Shop','Jaime Yorres','87 Polk St. Suite 5','San Francisco','94117','USA' UNION ALL 
SELECT ' 46','LILA-Supermercado','Carlos Gonz�lez','Carrera 52 con Ave. Bol�var #65-98 Llano Largo','Barquisimeto','3508','Venezuela' UNION ALL 
SELECT ' 47','LINO-Delicateses','Felipe Izquierdo','Ave. 5 de Mayo Porlamar','I. de Margarita','4980','Venezuela' UNION ALL 
SELECT ' 48','Lonesome Pine Restaurant','Fran Wilson','89 Chiaroscuro Rd.','Portland','97219','USA' UNION ALL 
SELECT ' 49','Magazzini Alimentari Riuniti','Giovanni Rovelli','Via Ludovico il Moro 22','Bergamo','24100','Italy' UNION ALL 
SELECT ' 50','Maison Dewey','Catherine Dewey','Rue Joseph-Bens 532','Bruxelles','B-1180','Belgium' UNION ALL 
SELECT ' 51','M�re Paillarde','Jean Fresni�re','43 rue St. Laurent','Montr�al','H1J 1C3','Canada' UNION ALL 
SELECT ' 52','Morgenstern Gesundkost','Alexander Feuer','Heerstr. 22','Leipzig','4179','Germany' UNION ALL 
SELECT ' 53','North/South','Simon Crowther','South House 300 Queensbridge','London','SW7 1RZ','UK' UNION ALL 
SELECT ' 54','Oc�ano Atl�ntico Ltda.','Yvonne Moncada','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires','1010','Argentina' UNION ALL 
SELECT ' 55','Old World Delicatessen','Rene Phillips','2743 Bering St.','Anchorage','99508','USA' UNION ALL 
SELECT ' 56','Ottilies K�seladen','Henriette Pfalzheim','Mehrheimerstr. 369','K�ln','50739','Germany' UNION ALL 
SELECT ' 57','Paris sp�cialit�s','Marie Bertrand','265, boulevard Charonne','Paris','75012','France' UNION ALL 
SELECT ' 58','Pericles Comidas cl�sicas','Guillermo Fern�ndez','Calle Dr. Jorge Cash 321','M�xico D.F.','5033','Mexico' UNION ALL 
SELECT ' 59','Piccolo und mehr','Georg Pipps','Geislweg 14','Salzburg','5020','Austria' UNION ALL 
SELECT ' 60','Princesa Isabel Vinhoss','Isabel de Castro','Estrada da sa�de n. 58','Lisboa','1756','Portugal' UNION ALL 
SELECT ' 61','Que Del�cia','Bernardo Batista','Rua da Panificadora, 12','Rio de Janeiro','02389-673','Brazil' UNION ALL 
SELECT ' 62','Queen Cozinha','L�cia Carvalho','Alameda dos Can�rios, 891','S�o Paulo','05487-020','Brazil' UNION ALL 
SELECT ' 63','QUICK-Stop','Horst Kloss','Taucherstra�e 10','Cunewalde','1307','Germany' UNION ALL 
SELECT ' 64','Rancho grande','Sergio Guti�rrez','Av. del Libertador 900','Buenos Aires','1010','Argentina' UNION ALL 
SELECT ' 65','Rattlesnake Canyon Grocery','Paula Wilson','2817 Milton Dr.','Albuquerque','87110','USA' UNION ALL 
SELECT ' 66','Reggiani Caseifici','Maurizio Moroni','Strada Provinciale 124','Reggio Emilia','42100','Italy' UNION ALL 
SELECT ' 67','Ricardo Adocicados','Janete Limeira','Av. Copacabana, 267','Rio de Janeiro','02389-890','Brazil' UNION ALL 
SELECT ' 68','Richter Supermarkt','Michael Holz','Grenzacherweg 237','Gen�ve','1203','Switzerland' UNION ALL 
SELECT ' 69','Romero y tomillo','Alejandra Camino','Gran V�a, 1','Madrid','28001','Spain' UNION ALL 
SELECT ' 70','Sant� Gourmet','Jonas Bergulfsen','Erling Skakkes gate 78','Stavern','4110','Norway' UNION ALL 
SELECT ' 71','Save-a-lot Markets','Jose Pavarotti','187 Suffolk Ln.','Boise','83720','USA' UNION ALL 
SELECT ' 72','Seven Seas Imports','Hari Kumar','90 Wadhurst Rd.','London','OX15 4NB','UK' UNION ALL 
SELECT ' 73','Simons bistro','Jytte Petersen','Vinb�ltet 34','K�benhavn','1734','Denmark' UNION ALL 
SELECT ' 74','Sp�cialit�s du monde','Dominique Perrier','25, rue Lauriston','Paris','75016','France' UNION ALL 
SELECT ' 75','Split Rail Beer & Ale','Art Braunschweiger','P.O. Box 555','Lander','82520','USA' UNION ALL 
SELECT ' 76','Supr�mes d�lices','Pascale Cartrain','Boulevard Tirou, 255','Charleroi','B-6000','Belgium' UNION ALL 
SELECT ' 77','The Big Cheese','Liz Nixon','89 Jefferson Way Suite 2','Portland','97201','USA' UNION ALL 
SELECT ' 78','The Cracker Box','Liu Wong','55 Grizzly Peak Rd.','Butte','59801','USA' UNION ALL 
SELECT ' 79','Toms Spezialit�ten','Karin Josephs','Luisenstr. 48','M�nster','44087','Germany' UNION ALL 
SELECT ' 80','Tortuga Restaurante','Miguel Angel Paolino','Avda. Azteca 123','M�xico D.F.','5033','Mexico' UNION ALL 
SELECT ' 81','Tradi��o Hipermercados','Anabela Domingues','Av. In�s de Castro, 414','S�o Paulo','05634-030','Brazil' UNION ALL 
SELECT ' 82','Trail"s Head Gourmet Provisioners','Helvetius Nagy','722 DaVinci Blvd.','Kirkland','98034','USA' UNION ALL 
SELECT ' 83','Vaffeljernet','Palle Ibsen','Smagsl�get 45','�rhus','8200','Denmark' UNION ALL 
SELECT ' 84','Victuailles en stock','Mary Saveley','2, rue du Commerce','Lyon','69004','France' UNION ALL 
SELECT ' 85','Vins et alcools Chevalier','Paul Henriot','59 rue de l"Abbaye','Reims','51100','France' UNION ALL 
SELECT ' 86','Die Wandernde Kuh','Rita M�ller','Adenauerallee 900','Stuttgart','70563','Germany' UNION ALL 
SELECT ' 87','Wartian Herkku','Pirkko Koskitalo','Torikatu 38','Oulu','90110','Finland' UNION ALL 
SELECT ' 88','Wellington Importadora','Paula Parente','Rua do Mercado, 12','Resende','08737-363','Brazil' UNION ALL 
SELECT ' 89','White Clover Markets','Karl Jablonski','305 - 14th Ave. S. Suite 3B','Seattle','98128','USA' UNION ALL 
SELECT ' 90','Wilman Kala','Matti Karttunen','Keskuskatu 45','Helsinki','21240','Finland' UNION ALL 
SELECT ' 91','Wolski','Zbyszek','ul. Filtrowa 68','Walla','01-012','Poland' 
 
-----------------------------------------------------------------------------------------------------------
--Products Insert data

 INSERT INTO PRODUCTS
 SELECT '1','Chais','1','1','10 boxes x 20 bags','18' UNION ALL 
 SELECT '2','Chang','1','1','24 - 12 oz bottles','19' UNION ALL 
 SELECT '3','Aniseed Syrup','1','2','12 - 550 ml bottles','10' UNION ALL 
 SELECT '4','Chef Anton''s Cajun Seasoning','2','2','48 - 6 oz jars','22' UNION ALL 
 SELECT '5','Chef Anton''s Gumbo Mix','2','2','36 boxes','21.35' UNION ALL 
 SELECT '6','Grandma''s Boysenberry Spread','3','2','12 - 8 oz jars','25' UNION ALL 
 SELECT '7','Uncle Bob''s Organic Dried Pears','3','7','12 - 1 lb pkgs.','30' UNION ALL 
 SELECT '8','Northwoods Cranberry Sauce','3','2','12 - 12 oz jars','40' UNION ALL 
 SELECT '9','Mishi Kobe Niku','4','6','18 - 500 g pkgs.','97' UNION ALL 
 SELECT '10','Ikura','4','8','12 - 200 ml jars','31' UNION ALL 
 SELECT '11','Queso Cabrales','5','4','1 kg pkg.','21' UNION ALL 
 SELECT '12','Queso Manchego La Pastora','5','4','10 - 500 g pkgs.','38' UNION ALL 
 SELECT '13','Konbu','6','8','2 kg box','6' UNION ALL 
 SELECT '14','Tofu','6','7','40 - 100 g pkgs.','23.25' UNION ALL 
 SELECT '15','Genen Shouyu','6','2','24 - 250 ml bottles','15.5' UNION ALL 
 SELECT '16','Pavlova','7','3','32 - 500 g boxes','17.45' UNION ALL 
 SELECT '17','Alice Mutton','7','6','20 - 1 kg tins','39' UNION ALL 
 SELECT '18','Carnarvon Tigers','7','8','16 kg pkg.','62.5' UNION ALL 
 SELECT '19','Teatime Chocolate Biscuits','8','3','10 boxes x 12 pieces','9.2' UNION ALL 
 SELECT '20','Sir Rodney''s Marmalade','8','3','30 gift boxes','81' UNION ALL 
 SELECT '21','Sir Rodney''s Scones','8','3','24 pkgs. x 4 pieces','10' UNION ALL 
 SELECT '22','Gustaf''s Kn�ckebr�d','9','5','24 - 500 g pkgs.','21' UNION ALL 
 SELECT '23','Tunnbr�d','9','5','12 - 250 g pkgs.','9' UNION ALL 
 SELECT '24','Guaran� Fant�stica','10','1','12 - 355 ml cans','4.5' UNION ALL 
 SELECT '25','NuNuCa Nu�-Nougat-Creme','11','3','20 - 450 g glasses','14' UNION ALL 
 SELECT '26','Gumb�r Gummib�rchen','11','3','100 - 250 g bags','31.23' UNION ALL 
 SELECT '27','Schoggi Schokolade','11','3','100 - 100 g pieces','43.9' UNION ALL 
 SELECT '28','R�ssle Sauerkraut','12','7','25 - 825 g cans','45.6' UNION ALL 
 SELECT '29','Th�ringer Rostbratwurst','12','6','50 bags x 30 sausgs.','123.79' UNION ALL 
 SELECT '30','Nord-Ost Matjeshering','13','8','10 - 200 g glasses','25.89' UNION ALL 
 SELECT '31','Gorgonzola Telino','14','4','12 - 100 g pkgs','12.5' UNION ALL 
 SELECT '32','Mascarpone Fabioli','14','4','24 - 200 g pkgs.','32' UNION ALL 
 SELECT '33','Geitost','15','4','500 g','2.5' UNION ALL 
 SELECT '34','Sasquatch Ale','16','1','24 - 12 oz bottles','14' UNION ALL 
 SELECT '35','Steeleye Stout','16','1','24 - 12 oz bottles','18' UNION ALL 
 SELECT '36','Inlagd Sill','17','8','24 - 250 g jars','19' UNION ALL 
 SELECT '37','Gravad lax','17','8','12 - 500 g pkgs.','26' UNION ALL 
 SELECT '38','C�te de Blaye','18','1','12 - 75 cl bottles','263.5' UNION ALL 
 SELECT '39','Chartreuse verte','18','1','750 cc per bottle','18' UNION ALL 
 SELECT '40','Boston Crab Meat','19','8','24 - 4 oz tins','18.4' UNION ALL 
 SELECT '41','Jack''s New England Clam Chowder','19','8','12 - 12 oz cans','9.65' UNION ALL 
 SELECT '42','Singaporean Hokkien Fried Mee','20','5','32 - 1 kg pkgs.','14' UNION ALL 
 SELECT '43','Ipoh Coffee','20','1','16 - 500 g tins','46' UNION ALL 
 SELECT '44','Gula Malacca','20','2','20 - 2 kg bags','19.45' UNION ALL 
 SELECT '45','R�gede sild','21','8','1k pkg.','9.5' UNION ALL 
 SELECT '46','Spegesild','21','8','4 - 450 g glasses','12' UNION ALL 
 SELECT '47','Zaanse koeken','22','3','10 - 4 oz boxes','9.5' UNION ALL 
 SELECT '48','Chocolade','22','3','10 pkgs.','12.75' UNION ALL 
 SELECT '49','Maxilaku','23','3','24 - 50 g pkgs.','20' UNION ALL 
 SELECT '50','Valkoinen suklaa','23','3','12 - 100 g bars','16.25' UNION ALL 
 SELECT '51','Manjimup Dried Apples','24','7','50 - 300 g pkgs.','53' UNION ALL 
 SELECT '52','Filo Mix','24','5','16 - 2 kg boxes','7' UNION ALL 
 SELECT '53','Perth Pasties','24','6','48 pieces','32.8' UNION ALL 
 SELECT '54','Tourti�re','25','6','16 pies','7.45' UNION ALL 
 SELECT '55','P�t� chinois','25','6','24 boxes x 2 pies','24' UNION ALL 
 SELECT '56','Gnocchi di nonna Alice','26','5','24 - 250 g pkgs.','38' UNION ALL 
 SELECT '57','Ravioli Angelo','26','5','24 - 250 g pkgs.','19.5' UNION ALL 
 SELECT '58','Escargots de Bourgogne','27','8','24 pieces','13.25' UNION ALL 
 SELECT '59','Raclette Courdavault','28','4','5 kg pkg.','55' UNION ALL 
 SELECT '60','Camembert Pierrot','28','4','15 - 300 g rounds','34' UNION ALL 
 SELECT '61','Sirop d''�rable','29','2','24 - 500 ml bottles','28.5' UNION ALL 
 SELECT '62','Tarte au sucre','29','3','48 pies','49.3' UNION ALL 
 SELECT '63','Vegie-spread','7','2','15 - 625 g jars','43.9' UNION ALL 
 SELECT '64','Wimmers gute Semmelkn�del','12','5','20 bags x 4 pieces','33.25' UNION ALL 
 SELECT '65','Louisiana Fiery Hot Pepper Sauce','2','2','32 - 8 oz bottles','21.05' UNION ALL 
 SELECT '66','Louisiana Hot Spiced Okra','2','2','24 - 8 oz jars','17' UNION ALL 
 SELECT '67','Laughing Lumberjack Lager','16','1','24 - 12 oz bottles','14' UNION ALL 
 SELECT '68','Scottish Longbreads','8','3','10 boxes x 8 pieces','12.5' UNION ALL 
 SELECT '69','Gudbrandsdalsost','15','4','10 kg pkg.','36' UNION ALL 
 SELECT '70','Outback Lager','7','1','24 - 355 ml bottles','15' UNION ALL 
 SELECT '71','Fl�temysost','15','4','10 - 500 g pkgs.','21.5' UNION ALL 
 SELECT '72','Mozzarella di Giovanni','14','4','24 - 200 g pkgs.','34.8' UNION ALL 
 SELECT '73','R�d Kaviar','17','8','24 - 150 g jars','15' UNION ALL 
 SELECT '74','Longlife Tofu','4','7','5 kg pkg.','10' UNION ALL 
 SELECT '75','Rh�nbr�u Klosterbier','12','1','24 - 0.5 l bottles','7.75' UNION ALL 
 SELECT '76','Lakkalik��ri','23','1','500 ml','18' UNION ALL 
 SELECT '77','Original Frankfurter gr�ne So�e','12','2','12 boxes','13'
 
-----------------------------------------------------------------------------------------------------------
--Orders Insert data

 INSERT INTO ORDERS
 SELECT '10248','90','5','7/4/1996','3' UNION ALL 
 SELECT '10249','81','6','7/5/1996','1' UNION ALL 
 SELECT '10250','34','4','7/8/1996','2' UNION ALL 
 SELECT '10251','84','3','7/8/1996','1' UNION ALL 
 SELECT '10252','76','4','7/9/1996','2' UNION ALL 
 SELECT '10253','34','3','7/10/1996','2' UNION ALL 
 SELECT '10254','14','5','7/11/1996','2' UNION ALL 
 SELECT '10255','68','9','7/12/1996','3' UNION ALL 
 SELECT '10256','88','3','7/15/1996','2' UNION ALL 
 SELECT '10257','35','4','7/16/1996','3' UNION ALL 
 SELECT '10258','20','1','7/17/1996','1' UNION ALL 
 SELECT '10259','13','4','7/18/1996','3' UNION ALL 
 SELECT '10260','55','4','7/19/1996','1' UNION ALL 
 SELECT '10261','61','4','7/19/1996','2' UNION ALL 
 SELECT '10262','65','8','7/22/1996','3' UNION ALL 
 SELECT '10263','20','9','7/23/1996','3' UNION ALL 
 SELECT '10264','24','6','7/24/1996','3' UNION ALL 
 SELECT '10265','7','2','7/25/1996','1' UNION ALL 
 SELECT '10266','87','3','7/26/1996','3' UNION ALL 
 SELECT '10267','25','4','7/29/1996','1' UNION ALL 
 SELECT '10268','33','8','7/30/1996','3' UNION ALL 
 SELECT '10269','89','5','7/31/1996','1' UNION ALL 
 SELECT '10270','87','1','8/1/1996','1' UNION ALL 
 SELECT '10271','75','6','8/1/1996','2' UNION ALL 
 SELECT '10272','65','6','8/2/1996','2' UNION ALL 
 SELECT '10273','63','3','8/5/1996','3' UNION ALL 
 SELECT '10274','85','6','8/6/1996','1' UNION ALL 
 SELECT '10275','49','1','8/7/1996','1' UNION ALL 
 SELECT '10276','80','8','8/8/1996','3' UNION ALL 
 SELECT '10277','52','2','8/9/1996','3' UNION ALL 
 SELECT '10278','5','8','8/12/1996','2' UNION ALL 
 SELECT '10279','44','8','8/13/1996','2' UNION ALL 
 SELECT '10280','5','2','8/14/1996','1' UNION ALL 
 SELECT '10281','69','4','8/14/1996','1' UNION ALL 
 SELECT '10282','69','4','8/15/1996','1' UNION ALL 
 SELECT '10283','46','3','8/16/1996','3' UNION ALL 
 SELECT '10284','44','4','8/19/1996','1' UNION ALL 
 SELECT '10285','63','1','8/20/1996','2' UNION ALL 
 SELECT '10286','63','8','8/21/1996','3' UNION ALL 
 SELECT '10287','67','8','8/22/1996','3' UNION ALL 
 SELECT '10288','66','4','8/23/1996','1' UNION ALL 
 SELECT '10289','11','7','8/26/1996','3' UNION ALL 
 SELECT '10290','15','8','8/27/1996','1' UNION ALL 
 SELECT '10291','61','6','8/27/1996','2' UNION ALL 
 SELECT '10292','81','1','8/28/1996','2' UNION ALL 
 SELECT '10293','80','1','8/29/1996','3' UNION ALL 
 SELECT '10294','65','4','8/30/1996','2' UNION ALL 
 SELECT '10295','85','2','9/2/1996','2' UNION ALL 
 SELECT '10296','46','6','9/3/1996','1' UNION ALL 
 SELECT '10297','7','5','9/4/1996','2' UNION ALL 
 SELECT '10298','37','6','9/5/1996','2' UNION ALL 
 SELECT '10299','67','4','9/6/1996','2' UNION ALL 
 SELECT '10300','49','2','9/9/1996','2' UNION ALL 
 SELECT '10301','86','8','9/9/1996','2' UNION ALL 
 SELECT '10302','76','4','9/10/1996','2' UNION ALL 
 SELECT '10303','30','7','9/11/1996','2' UNION ALL 
 SELECT '10304','80','1','9/12/1996','2' UNION ALL 
 SELECT '10305','55','8','9/13/1996','3' UNION ALL 
 SELECT '10306','69','1','9/16/1996','3' UNION ALL 
 SELECT '10307','48','2','9/17/1996','2' UNION ALL 
 SELECT '10308','2','7','9/18/1996','3' UNION ALL 
 SELECT '10309','37','3','9/19/1996','1' UNION ALL 
 SELECT '10310','77','8','9/20/1996','2' UNION ALL 
 SELECT '10311','18','1','9/20/1996','3' UNION ALL 
 SELECT '10312','86','2','9/23/1996','2' UNION ALL 
 SELECT '10313','63','2','9/24/1996','2' UNION ALL 
 SELECT '10314','65','1','9/25/1996','2' UNION ALL 
 SELECT '10315','38','4','9/26/1996','2' UNION ALL 
 SELECT '10316','65','1','9/27/1996','3' UNION ALL 
 SELECT '10317','48','6','9/30/1996','1' UNION ALL 
 SELECT '10318','38','8','10/1/1996','2' UNION ALL 
 SELECT '10319','80','7','10/2/1996','3' UNION ALL 
 SELECT '10320','87','5','10/3/1996','3' UNION ALL 
 SELECT '10321','38','3','10/3/1996','2' UNION ALL 
 SELECT '10322','58','7','10/4/1996','3' UNION ALL 
 SELECT '10323','39','4','10/7/1996','1' UNION ALL 
 SELECT '10324','71','9','10/8/1996','1' UNION ALL 
 SELECT '10325','39','1','10/9/1996','3' UNION ALL 
 SELECT '10326','8','4','10/10/1996','2' UNION ALL 
 SELECT '10327','24','2','10/11/1996','1' UNION ALL 
 SELECT '10328','28','4','10/14/1996','3' UNION ALL 
 SELECT '10329','75','4','10/15/1996','2' UNION ALL 
 SELECT '10330','46','3','10/16/1996','1' UNION ALL 
 SELECT '10331','9','9','10/16/1996','1' UNION ALL 
 SELECT '10332','51','3','10/17/1996','2' UNION ALL 
 SELECT '10333','87','5','10/18/1996','3' UNION ALL 
 SELECT '10334','84','8','10/21/1996','2' UNION ALL 
 SELECT '10335','37','7','10/22/1996','2' UNION ALL 
 SELECT '10336','60','7','10/23/1996','2' UNION ALL 
 SELECT '10337','25','4','10/24/1996','3' UNION ALL 
 SELECT '10338','55','4','10/25/1996','3' UNION ALL 
 SELECT '10339','51','2','10/28/1996','2' UNION ALL 
 SELECT '10340','9','1','10/29/1996','3' UNION ALL 
 SELECT '10341','73','7','10/29/1996','3' UNION ALL 
 SELECT '10342','25','4','10/30/1996','2' UNION ALL 
 SELECT '10343','44','4','10/31/1996','1' UNION ALL 
 SELECT '10344','89','4','11/1/1996','2' UNION ALL 
 SELECT '10345','63','2','11/4/1996','2' UNION ALL 
 SELECT '10346','65','3','11/5/1996','3' UNION ALL 
 SELECT '10347','21','4','11/6/1996','3' UNION ALL 
 SELECT '10348','86','4','11/7/1996','2' UNION ALL 
 SELECT '10349','75','7','11/8/1996','1' UNION ALL 
 SELECT '10350','41','6','11/11/1996','2' UNION ALL 
 SELECT '10351','20','1','11/11/1996','1' UNION ALL 
 SELECT '10352','28','3','11/12/1996','3' UNION ALL 
 SELECT '10353','59','7','11/13/1996','3' UNION ALL 
 SELECT '10354','58','8','11/14/1996','3' UNION ALL 
 SELECT '10355','4','6','11/15/1996','1' UNION ALL 
 SELECT '10356','86','6','11/18/1996','2' UNION ALL 
 SELECT '10357','46','1','11/19/1996','3' UNION ALL 
 SELECT '10358','41','5','11/20/1996','1' UNION ALL 
 SELECT '10359','72','5','11/21/1996','3' UNION ALL 
 SELECT '10360','7','4','11/22/1996','3' UNION ALL 
 SELECT '10361','63','1','11/22/1996','2' UNION ALL 
 SELECT '10362','9','3','11/25/1996','1' UNION ALL 
 SELECT '10363','17','4','11/26/1996','3' UNION ALL 
 SELECT '10364','19','1','11/26/1996','1' UNION ALL 
 SELECT '10365','3','3','11/27/1996','2' UNION ALL 
 SELECT '10366','29','8','11/28/1996','2' UNION ALL 
 SELECT '10367','83','7','11/28/1996','3' UNION ALL 
 SELECT '10368','20','2','11/29/1996','2' UNION ALL 
 SELECT '10369','75','8','12/2/1996','2' UNION ALL 
 SELECT '10370','14','6','12/3/1996','2' UNION ALL 
 SELECT '10371','41','1','12/3/1996','1' UNION ALL 
 SELECT '10372','62','5','12/4/1996','2' UNION ALL 
 SELECT '10373','37','4','12/5/1996','3' UNION ALL 
 SELECT '10374','91','1','12/5/1996','3' UNION ALL 
 SELECT '10375','36','3','12/6/1996','2' UNION ALL 
 SELECT '10376','51','1','12/9/1996','2' UNION ALL 
 SELECT '10377','72','1','12/9/1996','3' UNION ALL 
 SELECT '10378','24','5','12/10/1996','3' UNION ALL 
 SELECT '10379','61','2','12/11/1996','1' UNION ALL 
 SELECT '10380','37','8','12/12/1996','3' UNION ALL 
 SELECT '10381','46','3','12/12/1996','3' UNION ALL 
 SELECT '10382','20','4','12/13/1996','1' UNION ALL 
 SELECT '10383','4','8','12/16/1996','3' UNION ALL 
 SELECT '10384','5','3','12/16/1996','3' UNION ALL 
 SELECT '10385','75','1','12/17/1996','2' UNION ALL 
 SELECT '10386','21','9','12/18/1996','3' UNION ALL 
 SELECT '10387','70','1','12/18/1996','2' UNION ALL 
 SELECT '10388','72','2','12/19/1996','1' UNION ALL 
 SELECT '10389','10','4','12/20/1996','2' UNION ALL 
 SELECT '10390','20','6','12/23/1996','1' UNION ALL 
 SELECT '10391','17','3','12/23/1996','3' UNION ALL 
 SELECT '10392','59','2','12/24/1996','3' UNION ALL 
 SELECT '10393','71','1','12/25/1996','3' UNION ALL 
 SELECT '10394','36','1','12/25/1996','3' UNION ALL 
 SELECT '10395','35','6','12/26/1996','1' UNION ALL 
 SELECT '10396','25','1','12/27/1996','3' UNION ALL 
 SELECT '10397','60','5','12/27/1996','1' UNION ALL 
 SELECT '10398','71','2','12/30/1996','3' UNION ALL 
 SELECT '10399','83','8','12/31/1996','3' UNION ALL 
 SELECT '10400','19','1','1/1/1997','3' UNION ALL 
 SELECT '10401','65','1','1/1/1997','1' UNION ALL 
 SELECT '10402','20','8','1/2/1997','2' UNION ALL 
 SELECT '10403','20','4','1/3/1997','3' UNION ALL 
 SELECT '10404','49','2','1/3/1997','1' UNION ALL 
 SELECT '10405','47','1','1/6/1997','1' UNION ALL 
 SELECT '10406','62','7','1/7/1997','1' UNION ALL 
 SELECT '10407','56','2','1/7/1997','2' UNION ALL 
 SELECT '10408','23','8','1/8/1997','1' UNION ALL 
 SELECT '10409','54','3','1/9/1997','1' UNION ALL 
 SELECT '10410','10','3','1/10/1997','3' UNION ALL 
 SELECT '10411','10','9','1/10/1997','3' UNION ALL 
 SELECT '10412','87','8','1/13/1997','2' UNION ALL 
 SELECT '10413','41','3','1/14/1997','2' UNION ALL 
 SELECT '10414','21','2','1/14/1997','3' UNION ALL 
 SELECT '10415','36','3','1/15/1997','1' UNION ALL 
 SELECT '10416','87','8','1/16/1997','3' UNION ALL 
 SELECT '10417','73','4','1/16/1997','3' UNION ALL 
 SELECT '10418','63','4','1/17/1997','1' UNION ALL 
 SELECT '10419','68','4','1/20/1997','2' UNION ALL 
 SELECT '10420','88','3','1/21/1997','1' UNION ALL 
 SELECT '10421','61','8','1/21/1997','1' UNION ALL 
 SELECT '10422','27','2','1/22/1997','1' UNION ALL 
 SELECT '10423','31','6','1/23/1997','3' UNION ALL 
 SELECT '10424','51','7','1/23/1997','2' UNION ALL 
 SELECT '10425','41','6','1/24/1997','2' UNION ALL 
 SELECT '10426','29','4','1/27/1997','1' UNION ALL 
 SELECT '10427','59','4','1/27/1997','2' UNION ALL 
 SELECT '10428','66','7','1/28/1997','1' UNION ALL 
 SELECT '10429','37','3','1/29/1997','2' UNION ALL 
 SELECT '10430','20','4','1/30/1997','1' UNION ALL 
 SELECT '10431','10','4','1/30/1997','2' UNION ALL 
 SELECT '10432','75','3','1/31/1997','2' UNION ALL 
 SELECT '10433','60','3','2/3/1997','3' UNION ALL 
 SELECT '10434','24','3','2/3/1997','2' UNION ALL 
 SELECT '10435','16','8','2/4/1997','2' UNION ALL 
 SELECT '10436','7','3','2/5/1997','2' UNION ALL 
 SELECT '10437','87','8','2/5/1997','1' UNION ALL 
 SELECT '10438','79','3','2/6/1997','2' UNION ALL 
 SELECT '10439','51','6','2/7/1997','3' UNION ALL 
 SELECT '10440','71','4','2/10/1997','2' UNION ALL 
 SELECT '10441','55','3','2/10/1997','2' UNION ALL 
 SELECT '10442','20','3','2/11/1997','2' UNION ALL 
 SELECT '10443','66','8','2/12/1997','1'

-----------------------------------------------------------------------------------------------------------
--Orderdetails Insert data
 INSERT INTO Orderdetails
 SELECT '1','10248','11','12' UNION ALL 
 SELECT '2','10248','42','10' UNION ALL 
 SELECT '3','10248','72','5' UNION ALL 
 SELECT '4','10249','14','9' UNION ALL 
 SELECT '5','10249','51','40' UNION ALL 
 SELECT '6','10250','41','10' UNION ALL 
 SELECT '7','10250','51','35' UNION ALL 
 SELECT '8','10250','65','15' UNION ALL 
 SELECT '9','10251','22','6' UNION ALL 
 SELECT '10','10251','57','15' UNION ALL 
 SELECT '11','10251','65','20' UNION ALL 
 SELECT '12','10252','20','40' UNION ALL 
 SELECT '13','10252','33','25' UNION ALL 
 SELECT '14','10252','60','40' UNION ALL 
 SELECT '15','10253','31','20' UNION ALL 
 SELECT '16','10253','39','42' UNION ALL 
 SELECT '17','10253','49','40' UNION ALL 
 SELECT '18','10254','24','15' UNION ALL 
 SELECT '19','10254','55','21' UNION ALL 
 SELECT '20','10254','74','21' UNION ALL 
 SELECT '21','10255','2','20' UNION ALL 
 SELECT '22','10255','16','35' UNION ALL 
 SELECT '23','10255','36','25' UNION ALL 
 SELECT '24','10255','59','30' UNION ALL 
 SELECT '25','10256','53','15' UNION ALL 
 SELECT '26','10256','77','12' UNION ALL 
 SELECT '27','10257','27','25' UNION ALL 
 SELECT '28','10257','39','6' UNION ALL 
 SELECT '29','10257','77','15' UNION ALL 
 SELECT '30','10258','2','50' UNION ALL 
 SELECT '31','10258','5','65' UNION ALL 
 SELECT '32','10258','32','6' UNION ALL 
 SELECT '33','10259','21','10' UNION ALL 
 SELECT '34','10259','37','1' UNION ALL 
 SELECT '35','10260','41','16' UNION ALL 
 SELECT '36','10260','57','50' UNION ALL 
 SELECT '37','10260','62','15' UNION ALL 
 SELECT '38','10260','70','21' UNION ALL 
 SELECT '39','10261','21','20' UNION ALL 
 SELECT '40','10261','35','20' UNION ALL 
 SELECT '41','10262','5','12' UNION ALL 
 SELECT '42','10262','7','15' UNION ALL 
 SELECT '43','10262','56','2' UNION ALL 
 SELECT '44','10263','16','60' UNION ALL 
 SELECT '45','10263','24','28' UNION ALL 
 SELECT '46','10263','30','60' UNION ALL 
 SELECT '47','10263','74','36' UNION ALL 
 SELECT '48','10264','2','35' UNION ALL 
 SELECT '49','10264','41','25' UNION ALL 
 SELECT '50','10265','17','30' UNION ALL 
 SELECT '51','10265','70','20' UNION ALL 
 SELECT '52','10266','12','12' UNION ALL 
 SELECT '53','10267','40','50' UNION ALL 
 SELECT '54','10267','59','70' UNION ALL 
 SELECT '55','10267','76','15' UNION ALL 
 SELECT '56','10268','29','10' UNION ALL 
 SELECT '57','10268','72','4' UNION ALL 
 SELECT '58','10269','33','60' UNION ALL 
 SELECT '59','10269','72','20' UNION ALL 
 SELECT '60','10270','36','30' UNION ALL 
 SELECT '61','10270','43','25' UNION ALL 
 SELECT '62','10271','33','24' UNION ALL 
 SELECT '63','10272','20','6' UNION ALL 
 SELECT '64','10272','31','40' UNION ALL 
 SELECT '65','10272','72','24' UNION ALL 
 SELECT '66','10273','10','24' UNION ALL 
 SELECT '67','10273','31','15' UNION ALL 
 SELECT '68','10273','33','20' UNION ALL 
 SELECT '69','10273','40','60' UNION ALL 
 SELECT '70','10273','76','33' UNION ALL 
 SELECT '71','10274','71','20' UNION ALL 
 SELECT '72','10274','72','7' UNION ALL 
 SELECT '73','10275','24','12' UNION ALL 
 SELECT '74','10275','59','6' UNION ALL 
 SELECT '75','10276','10','15' UNION ALL 
 SELECT '76','10276','13','10' UNION ALL 
 SELECT '77','10277','28','20' UNION ALL 
 SELECT '78','10277','62','12' UNION ALL 
 SELECT '79','10278','44','16' UNION ALL 
 SELECT '80','10278','59','15' UNION ALL 
 SELECT '81','10278','63','8' UNION ALL 
 SELECT '82','10278','73','25' UNION ALL 
 SELECT '83','10279','17','15' UNION ALL 
 SELECT '84','10280','24','12' UNION ALL 
 SELECT '85','10280','55','20' UNION ALL 
 SELECT '86','10280','75','30' UNION ALL 
 SELECT '87','10281','19','1' UNION ALL 
 SELECT '88','10281','24','6' UNION ALL 
 SELECT '89','10281','35','4' UNION ALL 
 SELECT '90','10282','30','6' UNION ALL 
 SELECT '91','10282','57','2' UNION ALL 
 SELECT '92','10283','15','20' UNION ALL 
 SELECT '93','10283','19','18' UNION ALL 
 SELECT '94','10283','60','35' UNION ALL 
 SELECT '95','10283','72','3' UNION ALL 
 SELECT '96','10284','27','15' UNION ALL 
 SELECT '97','10284','44','21' UNION ALL 
 SELECT '98','10284','60','20' UNION ALL 
 SELECT '99','10284','67','5' UNION ALL 
 SELECT '100','10285','1','45' UNION ALL 
 SELECT '101','10285','40','40' UNION ALL 
 SELECT '102','10285','53','36' UNION ALL 
 SELECT '103','10286','35','100' UNION ALL 
 SELECT '104','10286','62','40' UNION ALL 
 SELECT '105','10287','16','40' UNION ALL 
 SELECT '106','10287','34','20' UNION ALL 
 SELECT '107','10287','46','15' UNION ALL 
 SELECT '108','10288','54','10' UNION ALL 
 SELECT '109','10288','68','3' UNION ALL 
 SELECT '110','10289','3','30' UNION ALL 
 SELECT '111','10289','64','9' UNION ALL 
 SELECT '112','10290','5','20' UNION ALL 
 SELECT '113','10290','29','15' UNION ALL 
 SELECT '114','10290','49','15' UNION ALL 
 SELECT '115','10290','77','10' UNION ALL 
 SELECT '116','10291','13','20' UNION ALL 
 SELECT '117','10291','44','24' UNION ALL 
 SELECT '118','10291','51','2' UNION ALL 
 SELECT '119','10292','20','20' UNION ALL 
 SELECT '120','10293','18','12' UNION ALL 
 SELECT '121','10293','24','10' UNION ALL 
 SELECT '122','10293','63','5' UNION ALL 
 SELECT '123','10293','75','6' UNION ALL 
 SELECT '124','10294','1','18' UNION ALL 
 SELECT '125','10294','17','15' UNION ALL 
 SELECT '126','10294','43','15' UNION ALL 
 SELECT '127','10294','60','21' UNION ALL 
 SELECT '128','10294','75','6' UNION ALL 
 SELECT '129','10295','56','4' UNION ALL 
 SELECT '130','10296','11','12' UNION ALL 
 SELECT '131','10296','16','30' UNION ALL 
 SELECT '132','10296','69','15' UNION ALL 
 SELECT '133','10297','39','60' UNION ALL 
 SELECT '134','10297','72','20' UNION ALL 
 SELECT '135','10298','2','40' UNION ALL 
 SELECT '136','10298','36','40' UNION ALL 
 SELECT '137','10298','59','30' UNION ALL 
 SELECT '138','10298','62','15' UNION ALL 
 SELECT '139','10299','19','15' UNION ALL 
 SELECT '140','10299','70','20' UNION ALL 
 SELECT '141','10300','66','30' UNION ALL 
 SELECT '142','10300','68','20' UNION ALL 
 SELECT '143','10301','40','10' UNION ALL 
 SELECT '144','10301','56','20' UNION ALL 
 SELECT '145','10302','17','40' UNION ALL 
 SELECT '146','10302','28','28' UNION ALL 
 SELECT '147','10302','43','12' UNION ALL 
 SELECT '148','10303','40','40' UNION ALL 
 SELECT '149','10303','65','30' UNION ALL 
 SELECT '150','10303','68','15' UNION ALL 
 SELECT '151','10304','49','30' UNION ALL 
 SELECT '152','10304','59','10' UNION ALL 
 SELECT '153','10304','71','2' UNION ALL 
 SELECT '154','10305','18','25' UNION ALL 
 SELECT '155','10305','29','25' UNION ALL 
 SELECT '156','10305','39','30' UNION ALL 
 SELECT '157','10306','30','10' UNION ALL 
 SELECT '158','10306','53','10' UNION ALL 
 SELECT '159','10306','54','5' UNION ALL 
 SELECT '160','10307','62','10' UNION ALL 
 SELECT '161','10307','68','3' UNION ALL 
 SELECT '162','10308','69','1' UNION ALL 
 SELECT '163','10308','70','5' UNION ALL 
 SELECT '164','10309','4','20' UNION ALL 
 SELECT '165','10309','6','30' UNION ALL 
 SELECT '166','10309','42','2' UNION ALL 
 SELECT '167','10309','43','20' UNION ALL 
 SELECT '168','10309','71','3' UNION ALL 
 SELECT '169','10310','16','10' UNION ALL 
 SELECT '170','10310','62','5' UNION ALL 
 SELECT '171','10311','42','6' UNION ALL 
 SELECT '172','10311','69','7' UNION ALL 
 SELECT '173','10312','28','4' UNION ALL 
 SELECT '174','10312','43','24' UNION ALL 
 SELECT '175','10312','53','20' UNION ALL 
 SELECT '176','10312','75','10' UNION ALL 
 SELECT '177','10313','36','12' UNION ALL 
 SELECT '178','10314','32','40' UNION ALL 
 SELECT '179','10314','58','30' UNION ALL 
 SELECT '180','10314','62','25' UNION ALL 
 SELECT '181','10315','34','14' UNION ALL 
 SELECT '182','10315','70','30' UNION ALL 
 SELECT '183','10316','41','10' UNION ALL 
 SELECT '184','10316','62','70' UNION ALL 
 SELECT '185','10317','1','20' UNION ALL 
 SELECT '186','10318','41','20' UNION ALL 
 SELECT '187','10318','76','6' UNION ALL 
 SELECT '188','10319','17','8' UNION ALL 
 SELECT '189','10319','28','14' UNION ALL 
 SELECT '190','10319','76','30' UNION ALL 
 SELECT '191','10320','71','30' UNION ALL 
 SELECT '192','10321','35','10' UNION ALL 
 SELECT '193','10322','52','20' UNION ALL 
 SELECT '194','10323','15','5' UNION ALL 
 SELECT '195','10323','25','4' UNION ALL 
 SELECT '196','10323','39','4' UNION ALL 
 SELECT '197','10324','16','21' UNION ALL 
 SELECT '198','10324','35','70' UNION ALL 
 SELECT '199','10324','46','30' UNION ALL 
 SELECT '200','10324','59','40' UNION ALL 
 SELECT '201','10324','63','80' UNION ALL 
 SELECT '202','10325','6','6' UNION ALL 
 SELECT '203','10325','13','12' UNION ALL 
 SELECT '204','10325','14','9' UNION ALL 
 SELECT '205','10325','31','4' UNION ALL 
 SELECT '206','10325','72','40' UNION ALL 
 SELECT '207','10326','4','24' UNION ALL 
 SELECT '208','10326','57','16' UNION ALL 
 SELECT '209','10326','75','50' UNION ALL 
 SELECT '210','10327','2','25' UNION ALL 
 SELECT '211','10327','11','50' UNION ALL 
 SELECT '212','10327','30','35' UNION ALL 
 SELECT '213','10327','58','30' UNION ALL 
 SELECT '214','10328','59','9' UNION ALL 
 SELECT '215','10328','65','40' UNION ALL 
 SELECT '216','10328','68','10' UNION ALL 
 SELECT '217','10329','19','10' UNION ALL 
 SELECT '218','10329','30','8' UNION ALL 
 SELECT '219','10329','38','20' UNION ALL 
 SELECT '220','10329','56','12' UNION ALL 
 SELECT '221','10330','26','50' UNION ALL 
 SELECT '222','10330','72','25' UNION ALL 
 SELECT '223','10331','54','15' UNION ALL 
 SELECT '224','10332','18','40' UNION ALL 
 SELECT '225','10332','42','10' UNION ALL 
 SELECT '226','10332','47','16' UNION ALL 
 SELECT '227','10333','14','10' UNION ALL 
 SELECT '228','10333','21','10' UNION ALL
 SELECT '229','10333','71','40' UNION ALL 
 SELECT '230','10334','52','8' UNION ALL 
 SELECT '231','10334','68','10' UNION ALL 
 SELECT '232','10335','2','7' UNION ALL 
 SELECT '233','10335','31','25' UNION ALL 
 SELECT '234','10335','32','6' UNION ALL 
 SELECT '235','10335','51','48' UNION ALL 
 SELECT '236','10336','4','18' UNION ALL 
 SELECT '237','10337','23','40' UNION ALL 
 SELECT '238','10337','26','24' UNION ALL 
 SELECT '239','10337','36','20' UNION ALL 
 SELECT '240','10337','37','28' UNION ALL 
 SELECT '241','10337','72','25' UNION ALL 
 SELECT '242','10338','17','20' UNION ALL 
 SELECT '243','10338','30','15' UNION ALL 
 SELECT '244','10339','4','10' UNION ALL 
 SELECT '245','10339','17','70' UNION ALL 
 SELECT '246','10339','62','28' UNION ALL 
 SELECT '247','10340','18','20' UNION ALL 
 SELECT '248','10340','41','12' UNION ALL 
 SELECT '249','10340','43','40' UNION ALL 
 SELECT '250','10341','33','8' UNION ALL 
 SELECT '251','10341','59','9' UNION ALL 
 SELECT '252','10342','2','24' UNION ALL 
 SELECT '253','10342','31','56' UNION ALL 
 SELECT '254','10342','36','40' UNION ALL 
 SELECT '255','10342','55','40' UNION ALL 
 SELECT '256','10343','64','50' UNION ALL 
 SELECT '257','10343','68','4' UNION ALL 
 SELECT '258','10343','76','15' UNION ALL 
 SELECT '259','10344','4','35' UNION ALL 
 SELECT '260','10344','8','70' UNION ALL 
 SELECT '261','10345','8','70' UNION ALL 
 SELECT '262','10345','19','80' UNION ALL 
 SELECT '263','10345','42','9' UNION ALL 
 SELECT '264','10346','17','36' UNION ALL 
 SELECT '265','10346','56','20' UNION ALL 
 SELECT '266','10347','25','10' UNION ALL 
 SELECT '267','10347','39','50' UNION ALL 
 SELECT '268','10347','40','4' UNION ALL 
 SELECT '269','10347','75','6' UNION ALL 
 SELECT '270','10348','1','15' UNION ALL 
 SELECT '271','10348','23','25' UNION ALL 
 SELECT '272','10349','54','24' UNION ALL 
 SELECT '273','10350','50','15' UNION ALL 
 SELECT '274','10350','69','18' UNION ALL 
 SELECT '275','10351','38','20' UNION ALL 
 SELECT '276','10351','41','13' UNION ALL 
 SELECT '277','10351','44','77' UNION ALL 
 SELECT '278','10351','65','10' UNION ALL 
 SELECT '279','10352','24','10' UNION ALL 
 SELECT '280','10352','54','20' UNION ALL 
 SELECT '281','10353','11','12' UNION ALL 
 SELECT '282','10353','38','50' UNION ALL 
 SELECT '283','10354','1','12' UNION ALL 
 SELECT '284','10354','29','4' UNION ALL 
 SELECT '285','10355','24','25' UNION ALL 
 SELECT '286','10355','57','25' UNION ALL 
 SELECT '287','10356','31','30' UNION ALL 
 SELECT '288','10356','55','12' UNION ALL 
 SELECT '289','10356','69','20' UNION ALL 
 SELECT '290','10357','10','30' UNION ALL 
 SELECT '291','10357','26','16' UNION ALL 
 SELECT '292','10357','60','8' UNION ALL 
 SELECT '293','10358','24','10' UNION ALL 
 SELECT '294','10358','34','10' UNION ALL 
 SELECT '295','10358','36','20' UNION ALL 
 SELECT '296','10359','16','56' UNION ALL 
 SELECT '297','10359','31','70' UNION ALL 
 SELECT '298','10359','60','80' UNION ALL 
 SELECT '299','10360','28','30' UNION ALL 
 SELECT '300','10360','29','35' UNION ALL 
 SELECT '301','10360','38','10' UNION ALL 
 SELECT '302','10360','49','35' UNION ALL 
 SELECT '303','10360','54','28' UNION ALL 
 SELECT '304','10361','39','54' UNION ALL 
 SELECT '305','10361','60','55' UNION ALL 
 SELECT '306','10362','25','50' UNION ALL 
 SELECT '307','10362','51','20' UNION ALL 
 SELECT '308','10362','54','24' UNION ALL 
 SELECT '309','10363','31','20' UNION ALL 
 SELECT '310','10363','75','12' UNION ALL 
 SELECT '311','10363','76','12' UNION ALL 
 SELECT '312','10364','69','30' UNION ALL 
 SELECT '313','10364','71','5' UNION ALL 
 SELECT '314','10365','11','24' UNION ALL 
 SELECT '315','10366','65','5' UNION ALL 
 SELECT '316','10366','77','5' UNION ALL 
 SELECT '317','10367','34','36' UNION ALL 
 SELECT '318','10367','54','18' UNION ALL 
 SELECT '319','10367','65','15' UNION ALL 
 SELECT '320','10367','77','7' UNION ALL 
 SELECT '321','10368','21','5' UNION ALL 
 SELECT '322','10368','28','13' UNION ALL 
 SELECT '323','10368','57','25' UNION ALL 
 SELECT '324','10368','64','35' UNION ALL 
 SELECT '325','10369','29','20' UNION ALL 
 SELECT '326','10369','56','18' UNION ALL 
 SELECT '327','10370','1','15' UNION ALL 
 SELECT '328','10370','64','30' UNION ALL 
 SELECT '329','10370','74','20' UNION ALL 
 SELECT '330','10371','36','6' UNION ALL 
 SELECT '331','10372','20','12' UNION ALL 
 SELECT '332','10372','38','40' UNION ALL 
 SELECT '333','10372','60','70' UNION ALL 
 SELECT '334','10372','72','42' UNION ALL 
 SELECT '335','10373','58','80' UNION ALL 
 SELECT '336','10373','71','50' UNION ALL 
 SELECT '337','10374','31','30' UNION ALL 
 SELECT '338','10374','58','15' UNION ALL 
 SELECT '339','10375','14','15' UNION ALL 
 SELECT '340','10375','54','10' UNION ALL 
 SELECT '341','10376','31','42' UNION ALL 
 SELECT '342','10377','28','20' UNION ALL 
 SELECT '343','10377','39','20' UNION ALL 
 SELECT '344','10378','71','6' UNION ALL 
 SELECT '345','10379','41','8' UNION ALL 
 SELECT '346','10379','63','16' UNION ALL 
 SELECT '347','10379','65','20' UNION ALL 
 SELECT '348','10380','30','18' UNION ALL 
 SELECT '349','10380','53','20' UNION ALL 
 SELECT '350','10380','60','6' UNION ALL 
 SELECT '351','10380','70','30' UNION ALL 
 SELECT '352','10381','74','14' UNION ALL 
 SELECT '353','10382','5','32' UNION ALL 
 SELECT '354','10382','18','9' UNION ALL 
 SELECT '355','10382','29','14' UNION ALL 
 SELECT '356','10382','33','60' UNION ALL 
 SELECT '357','10382','74','50' UNION ALL 
 SELECT '358','10383','13','20' UNION ALL 
 SELECT '359','10383','50','15' UNION ALL 
 SELECT '360','10383','56','20' UNION ALL 
 SELECT '361','10384','20','28' UNION ALL 
 SELECT '362','10384','60','15' UNION ALL 
 SELECT '363','10385','7','10' UNION ALL 
 SELECT '364','10385','60','20' UNION ALL 
 SELECT '365','10385','68','8' UNION ALL 
 SELECT '366','10386','24','15' UNION ALL 
 SELECT '367','10386','34','10' UNION ALL 
 SELECT '368','10387','24','15' UNION ALL 
 SELECT '369','10387','28','6' UNION ALL 
 SELECT '370','10387','59','12' UNION ALL 
 SELECT '371','10387','71','15' UNION ALL 
 SELECT '372','10388','45','15' UNION ALL 
 SELECT '373','10388','52','20' UNION ALL 
 SELECT '374','10388','53','40' UNION ALL 
 SELECT '375','10389','10','16' UNION ALL 
 SELECT '376','10389','55','15' UNION ALL 
 SELECT '377','10389','62','20' UNION ALL 
 SELECT '378','10389','70','30' UNION ALL 
 SELECT '379','10390','31','60' UNION ALL 
 SELECT '380','10390','35','40' UNION ALL 
 SELECT '381','10390','46','45' UNION ALL 
 SELECT '382','10390','72','24' UNION ALL 
 SELECT '383','10391','13','18' UNION ALL 
 SELECT '384','10392','69','50' UNION ALL 
 SELECT '385','10393','2','25' UNION ALL 
 SELECT '386','10393','14','42' UNION ALL 
 SELECT '387','10393','25','7' UNION ALL 
 SELECT '388','10393','26','70' UNION ALL 
 SELECT '389','10393','31','32' UNION ALL 
 SELECT '390','10394','13','10' UNION ALL 
 SELECT '391','10394','62','10' UNION ALL 
 SELECT '392','10395','46','28' UNION ALL 
 SELECT '393','10395','53','70' UNION ALL 
 SELECT '394','10395','69','8' UNION ALL 
 SELECT '395','10396','23','40' UNION ALL 
 SELECT '396','10396','71','60' UNION ALL 
 SELECT '397','10396','72','21' UNION ALL 
 SELECT '398','10397','21','10' UNION ALL 
 SELECT '399','10397','51','18' UNION ALL 
 SELECT '400','10398','35','30' UNION ALL 
 SELECT '401','10398','55','120' UNION ALL 
 SELECT '402','10399','68','60' UNION ALL 
 SELECT '403','10399','71','30' UNION ALL 
 SELECT '404','10399','76','35' UNION ALL 
 SELECT '405','10399','77','14' UNION ALL 
 SELECT '406','10400','29','21' UNION ALL 
 SELECT '407','10400','35','35' UNION ALL 
 SELECT '408','10400','49','30' UNION ALL 
 SELECT '409','10401','30','18' UNION ALL 
 SELECT '410','10401','56','70' UNION ALL 
 SELECT '411','10401','65','20' UNION ALL 
 SELECT '412','10401','71','60' UNION ALL 
 SELECT '413','10402','23','60' UNION ALL 
 SELECT '414','10402','63','65' UNION ALL 
 SELECT '415','10403','16','21' UNION ALL 
 SELECT '416','10403','48','70' UNION ALL 
 SELECT '417','10404','26','30' UNION ALL 
 SELECT '418','10404','42','40' UNION ALL 
 SELECT '419','10404','49','30' UNION ALL 
 SELECT '420','10405','3','50' UNION ALL 
 SELECT '421','10406','1','10' UNION ALL 
 SELECT '422','10406','21','30' UNION ALL 
 SELECT '423','10406','28','42' UNION ALL 
 SELECT '424','10406','36','5' UNION ALL 
 SELECT '425','10406','40','2' UNION ALL 
 SELECT '426','10407','11','30' UNION ALL 
 SELECT '427','10407','69','15' UNION ALL 
 SELECT '428','10407','71','15' UNION ALL 
 SELECT '429','10408','37','10' UNION ALL 
 SELECT '430','10408','54','6' UNION ALL 
 SELECT '431','10408','62','35' UNION ALL 
 SELECT '432','10409','14','12' UNION ALL 
 SELECT '433','10409','21','12' UNION ALL 
 SELECT '434','10410','33','49' UNION ALL 
 SELECT '435','10410','59','16' UNION ALL 
 SELECT '436','10411','41','25' UNION ALL 
 SELECT '437','10411','44','40' UNION ALL 
 SELECT '438','10411','59','9' UNION ALL 
 SELECT '439','10412','14','20' UNION ALL 
 SELECT '440','10413','1','24' UNION ALL 
 SELECT '441','10413','62','40' UNION ALL 
 SELECT '442','10413','76','14' UNION ALL 
 SELECT '443','10414','19','18' UNION ALL 
 SELECT '444','10414','33','50' UNION ALL 
 SELECT '445','10415','17','2' UNION ALL 
 SELECT '446','10415','33','20' UNION ALL 
 SELECT '447','10416','19','20' UNION ALL 
 SELECT '448','10416','53','10' UNION ALL 
 SELECT '449','10416','57','20' UNION ALL 
 SELECT '450','10417','38','50' UNION ALL 
 SELECT '451','10417','46','2' UNION ALL 
 SELECT '452','10417','68','36' UNION ALL 
 SELECT '453','10417','77','35' UNION ALL 
 SELECT '454','10418','2','60' UNION ALL 
 SELECT '455','10418','47','55' UNION ALL 
 SELECT '456','10418','61','16' UNION ALL 
 SELECT '457','10418','74','15' UNION ALL 
 SELECT '458','10419','60','60' UNION ALL 
 SELECT '459','10419','69','20' UNION ALL 
 SELECT '460','10420','9','20' UNION ALL 
 SELECT '461','10420','13','2' UNION ALL 
 SELECT '462','10420','70','8' UNION ALL 
 SELECT '463','10420','73','20' UNION ALL 
 SELECT '464','10421','19','4' UNION ALL 
 SELECT '465','10421','26','30' UNION ALL 
 SELECT '466','10421','53','15' UNION ALL 
 SELECT '467','10421','77','10' UNION ALL 
 SELECT '468','10422','26','2' UNION ALL 
 SELECT '469','10423','31','14' UNION ALL 
 SELECT '470','10423','59','20' UNION ALL 
 SELECT '471','10424','35','60' UNION ALL 
 SELECT '472','10424','38','49' UNION ALL 
 SELECT '473','10424','68','30' UNION ALL 
 SELECT '474','10425','55','10' UNION ALL 
 SELECT '475','10425','76','20' UNION ALL 
 SELECT '476','10426','56','5' UNION ALL 
 SELECT '477','10426','64','7' UNION ALL 
 SELECT '478','10427','14','35' UNION ALL 
 SELECT '479','10428','46','20' UNION ALL 
 SELECT '480','10429','50','40' UNION ALL 
 SELECT '481','10429','63','35' UNION ALL 
 SELECT '482','10430','17','45' UNION ALL 
 SELECT '483','10430','21','50' UNION ALL 
 SELECT '484','10430','56','30' UNION ALL 
 SELECT '485','10430','59','70' UNION ALL 
 SELECT '486','10431','17','50' UNION ALL 
 SELECT '487','10431','40','50' UNION ALL 
 SELECT '488','10431','47','30' UNION ALL 
 SELECT '489','10432','26','10' UNION ALL 
 SELECT '490','10432','54','40' UNION ALL 
 SELECT '491','10433','56','28' UNION ALL 
 SELECT '492','10434','11','6' UNION ALL 
 SELECT '493','10434','76','18' UNION ALL 
 SELECT '494','10435','2','10' UNION ALL 
 SELECT '495','10435','22','12' UNION ALL 
 SELECT '496','10435','72','10' UNION ALL 
 SELECT '497','10436','46','5' UNION ALL 
 SELECT '498','10436','56','40' UNION ALL 
 SELECT '499','10436','64','30' UNION ALL 
 SELECT '500','10436','75','24' UNION ALL 
 SELECT '501','10437','53','15' UNION ALL 
 SELECT '502','10438','19','15' UNION ALL 
 SELECT '503','10438','34','20' UNION ALL 
 SELECT '504','10438','57','15' UNION ALL 
 SELECT '505','10439','12','15' UNION ALL 
 SELECT '506','10439','16','16' UNION ALL 
 SELECT '507','10439','64','6' UNION ALL 
 SELECT '508','10439','74','30' UNION ALL 
 SELECT '509','10440','2','45' UNION ALL 
 SELECT '510','10440','16','49' UNION ALL 
 SELECT '511','10440','29','24' UNION ALL 
 SELECT '512','10440','61','90' UNION ALL 
 SELECT '513','10441','27','50' UNION ALL 
 SELECT '514','10442','11','30' UNION ALL 
 SELECT '515','10442','54','80' UNION ALL 
 SELECT '516','10442','66','60' UNION ALL 
 SELECT '517','10443','11','6' UNION ALL 
 SELECT '518','10443','28','12'

-----------------------------------------------------------------------------------------------------------
--Categories Insert data

 INSERT INTO CATEGORIES
 SELECT '1','Beverages','Soft drinks, coffees, teas, beers, and ales' UNION ALL 
 SELECT '2','Condiments','Sweet and savory sauces, relishes, spreads, and seasonings' UNION ALL 
 SELECT '3','Confections','Desserts, candies, and sweet breads' UNION ALL 
 SELECT '4','Dairy Products','Cheeses' UNION ALL 
 SELECT '5','Grains/Cereals','Breads, crackers, pasta, and cereal' UNION ALL 
 SELECT '6','Meat/Poultry','Prepared meats' UNION ALL 
 SELECT '7','Produce','Dried fruit and bean curd' UNION ALL 
 SELECT '8','Seafood','Seaweed and fish' 

 
-----------------------------------------------------------------------------------------------------------
--Suppliers Insert data

 INSERT INTO Suppliers
 SELECT '1','Exotic Liquid','Charlotte Cooper','49 Gilbert St.','Londona','EC1 4SD','UK','(171) 555-2222' UNION ALL 
 SELECT '2','New Orleans Cajun Delights','Shelley Burke','P.O. Box 78934','New Orleans','70117','USA','(100) 555-4822' UNION ALL 
 SELECT '3','Grandma Kelly"s Homestead','Regina Murphy','707 Oxford Rd.','Ann Arbor','48104','USA','(313) 555-5735' UNION ALL 
 SELECT '4','Tokyo Traders','Yoshi Nagase','9-8 Sekimai Musashino-shi','Tokyo','100','Japan','(03) 3555-5011' UNION ALL 
 SELECT '5','Cooperativa de Quesos "Las Cabras"','Antonio del Valle Saavedra','Calle del Rosal 4','Oviedo','33007','Spain','(98) 598 76 54' UNION ALL 
 SELECT '6','Mayumi"s','Mayumi Ohno','92 Setsuko Chuo-ku','Osaka','545','Japan','(06) 431-7877' UNION ALL 
 SELECT '7','Pavlova, Ltd.','Ian Devling','74 Rose St. Moonie Ponds','Melbourne','3058','Australia','(03) 444-2343' UNION ALL 
 SELECT '8','Specialty Biscuits, Ltd.','Peter Wilson','29 King"s Way','Manchester','M14 GSD','UK','(161) 555-4448' UNION ALL 
 SELECT '9','PB Kn�ckebr�d AB','Lars Peterson','Kaloadagatan 13','G�teborg','S-345 67','Sweden','031-987 65 43' UNION ALL 
 SELECT '10','Refrescos Americanas LTDA','Carlos Diaz','Av. das Americanas 12.890','S�o Paulo','5442','Brazil','(11) 555 4640' UNION ALL 
 SELECT '11','Heli S��waren GmbH & Co. KG','Petra Winkler','Tiergartenstra�e 5','Berlin','10785','Germany','(010) 9984510' UNION ALL 
 SELECT '12','Plutzer Lebensmittelgro�m�rkte AG','Martin Bein','Bogenallee 51','Frankfurt','60439','Germany','(069) 992755' UNION ALL 
 SELECT '13','Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Frahmredder 112a','Cuxhaven','27478','Germany','(04721) 8713' UNION ALL 
 SELECT '14','Formaggi Fortini s.r.l.','Elio Rossi','Viale Dante, 75','Ravenna','48100','Italy','(0544) 60323' UNION ALL 
 SELECT '15','Norske Meierier','Beate Vileid','Hatlevegen 5','Sandvika','1320','Norway','(0)2-953010' UNION ALL 
 SELECT '16','Bigfoot Breweries','Cheryl Saylor','3400 - 8th Avenue Suite 210','Bend','97101','USA','(503) 555-9931' UNION ALL 
 SELECT '17','Svensk Sj�f�da AB','Michael Bj�rn','Brovallav�gen 231','Stockholm','S-123 45','Sweden','08-123 45 67' UNION ALL 
 SELECT '18','Aux joyeux eccl�siastiques','Guyl�ne Nodier','203, Rue des Francs-Bourgeois','Paris','75004','France','(1) 03.83.00.68' UNION ALL 
 SELECT '19','New England Seafood Cannery','Robb Merchant','Order Processing Dept. 2100 Paul Revere Blvd.','Boston','2134','USA','(617) 555-3267' UNION ALL 
 SELECT '20','Leka Trading','Chandra Leka','471 Serangoon Loop, Suite #402','Singapore','512','Singapore','555-8787' UNION ALL 
 SELECT '21','Lyngbysild','Niels Petersen','Lyngbysild Fiskebakken 10','Lyngby','2800','Denmark','43844108' UNION ALL 
 SELECT '22','Zaanse Snoepfabriek','Dirk Luchte','Verkoop Rijnweg 22','Zaandam','9999 ZZ','Netherlands','(12345) 1212' UNION ALL 
 SELECT '23','Karkki Oy','Anne Heikkonen','Valtakatu 12','Lappeenranta','53120','Finland','(953) 10956' UNION ALL 
 SELECT '24','G"day, Mate','Wendy Mackenzie','170 Prince Edward Parade Hunter"s Hill','Sydney','2042','Australia','(02) 555-5914' UNION ALL 
 SELECT '25','Ma Maison','Jean-Guy Lauzon','2960 Rue St. Laurent','Montr�al','H1J 1C3','Canada','(514) 555-9022' UNION ALL 
 SELECT '26','Pasta Buttini s.r.l.','Giovanni Giudici','Via dei Gelsomini, 153','Salerno','84100','Italy','(089) 6547665' UNION ALL 
 SELECT '27','Escargots Nouveaux','Marie Delamare','22, rue H. Voiron','Montceau','71300','France','85.57.00.07' UNION ALL 
 SELECT '28','Gai p�turage','Eliane Noz','Bat. B 3, rue des Alpes','Annecy','74000','France','38.76.98.06' UNION ALL 
 SELECT '29','For�ts d"�rables','Chantal Goulet','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada','(514) 555-2955'

 
-----------------------------------------------------------------------------------------------------------
--Shippers Insert data
 INSERT INTO Shippers
 SELECT '1','Speedy Express','(503)555-9831' UNION ALL 
 SELECT '2','United Package','(503)555-3199' UNION ALL 
 SELECT '3','Federal Shipping','(503)555-9931'
 ----------------------------------------------------------------------------------------------------------

