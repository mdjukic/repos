SET NOCOUNT ON;

IF OBJECT_ID('tempdb..##hierarchies') IS NOT NULL
	DROP TABLE ##hierarchies
CREATE TABLE ##hierarchies ([ProductId] INT NOT NULL, [HierarchyId] INT NOT NULL)

INSERT INTO ##hierarchies (ProductId, [HierarchyId])
SELECT 
	ProductId, 
	MAX(HierarchyId) AS [HierarchyId] 
FROM
(
	SELECT DISTINCT      
		A.ProductID,
		CAST(REPLACE(A.[HierarchyID],'L2-','2') AS INT) AS [HierarchyId]
	FROM (
		SELECT DISTINCT
			ProductId,
			[ClassId] AS [HierarchyID]
		FROM [history].[MeijerProductHierarchy_Client] 
		WHERE ClassId NOT LIKE '"%'
	) AS A
) AS R
WHERE ProductId IN (SELECT ProductName from Config.CompleteList) 
GROUP BY ProductId
ORDER BY ProductId

SELECT 
	ProductName AS product_id, 
	TimeID_FK AS [week], 
	(VAT - 1) as rate 
FROM History.markdown M 
JOIN Config.CompleteList CL ON CL.UKID_FK = M.UKID_FK 
JOIN results.Clientfields CF ON CF.UKID_FK = CL.UKID_FK
JOIN Ref.YearWeek ON M.TimeID_FK = PK_YearWeekId
WHERE CL.ProductName IN (SELECT ProductId FROM ##hierarchies) 
	AND CL.CountryName = 1 
	AND OptimisationCSP IS NOT NULL 
	AND PriceStatus in ('Full Price','Markdown') 
GROUP BY ProductName, TimeId_FK, VAT

