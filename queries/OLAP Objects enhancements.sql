--OLAP Objects enhancements
--SELECT * FROM INFORMATION_SCHEMA.TABLES


ALTER TABLE CalenderDim ADD LoadedDate DATETIME
ALTER TABLE CalenderDim ADD UpdatedDate DATETIME

ALTER TABLE CalenderDim ADD  UpdatedBy VARCHAR(100)

ALTER TABLE LocationDim ADD LoadedDate DATETIME
ALTER TABLE LocationDim ADD UpdatedDate DATETIME
ALTER TABLE LocationDim ADD  UpdatedBy VARCHAR(100)


ALTER TABLE CustomerDim ADD LoadedDate DATETIME
ALTER TABLE CustomerDim ADD UpdatedDate DATETIME
ALTER TABLE CustomerDim ADD  UpdatedBy VARCHAR(100)


ALTER TABLE EmployeeDim ADD LoadedDate DATETIME
ALTER TABLE EmployeeDim ADD UpdatedDate DATETIME
ALTER TABLE EmployeeDim ADD UpdatedBy VARCHAR(100)

ALTER TABLE OrderDim ADD LoadedDate DATETIME
ALTER TABLE OrderDim ADD UpdatedDate DATETIME
ALTER TABLE OrderDim ADD  UpdatedBy VARCHAR(100)

ALTER TABLE CategoryDim ADD LoadedDate DATETIME
ALTER TABLE CategoryDim ADD UpdatedDate DATETIME
ALTER TABLE CategoryDim ADD UpdatedBy VARCHAR(100)

ALTER TABLE ProductDim ADD LoadedDate DATETIME
ALTER TABLE ProductDim ADD UpdatedDate DATETIME
ALTER TABLE ProductDim ADD UpdatedBy VARCHAR(100)

ALTER TABLE OrderHistoryFact ADD LoadedDate DATETIME
ALTER TABLE OrderHistoryFact ADD UpdatedDate DATETIME
ALTER TABLE OrderHistoryFact ADD UpdatedBy VARCHAR(100)










