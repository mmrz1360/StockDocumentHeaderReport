
SELECT
SD.DocumentCode AS 'کد سند',
dbo.ConvertToJalaliDate(SD.BusinessDate) AS  'تاریخ سند',
s.[Name] AS 'نام انبار',
--SD.TargetStockID AS StockID,
SD.TotalQuantity AS 'جمع تعداد اقلام',
SD.TotalAmount AS 'جمع کل',
SD.Comment AS 'توضیحات'

FROM StockDocument SD 
LEFT JOIN Stock S
ON SD.TargetStockID = S.StockID

WHERE SD.DocumentTypeID = '382' and SD.StatusID ='246'
AND SD.BusinessDate BETWEEN '$StartDate' and '$EndDate'
AND SD.TargetStockID IN ($StockID)
ORDER BY SD.BusinessDate
