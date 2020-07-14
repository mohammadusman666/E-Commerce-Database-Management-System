use OnlineShopping
 select SUM(Price*Qty)as Total_Purchase
 from(
select VendorProduct.Price as price,Qty
from VendorProduct
inner join(
select Quantity as Qty,VendorProductID
from OrderedProduct
inner join(
select OrderID
from Orders
where CustomerID='60') op on op.OrderID=OrderedProduct.OrderedProductID) pp on pp.VendorProductID=VendorProduct.VendorProductID) as ta
