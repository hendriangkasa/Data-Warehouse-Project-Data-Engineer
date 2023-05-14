CREATE PROCEDURE summary_order_status 
(@StatusID INT) as
BEGIN
	SELECT
		so.OrderID,
		CustomerName,
		ProductName,
		Quantity,
		StatusOrder
	FROM FactSalesOrder so
	INNER JOIN DimCustomer c on so.CustomerID = c.CustomerID
	INNER JOIN DimProduct p on so.ProductID = p.ProductID
	INNER JOIN DimStatusOrder s on so.StatusID = s.StatusID
	WHERE s.StatusID = @StatusID
END

EXEC summary_order_status @StatusID = 4
