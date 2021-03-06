SET NOCOUNT ON;

TRUNCATE TABLE Matt.dbo.ProductSales

INSERT INTO Matt.dbo.ProductSales (ProductId, [Week], Price, Quantity, Stock, CostPrice)
SELECT 
	ProductName						AS product_id,
	TimeID_FK						As [week], 
	OptimisationCSP					AS price, 
	CAST(SalesVolume AS INT)		AS quantity, 
	CAST(TotalStockVolume AS INT)	AS stock, 
	CostPrice						AS cost_price
FROM History.markdown M 
JOIN Config.CompleteList CL on CL.UKID_FK = M.UKID_FK 
WHERE CL.CountryName = 1 AND OptimisationCSP IS NOT NULL
AND PriceStatus in ('Full Price','Markdown') 
GROUP BY ProductName, TimeID_FK, OptimisationCSP, SalesVolume, TotalStockVolume, CostPrice
ORDER BY Week, ProductName