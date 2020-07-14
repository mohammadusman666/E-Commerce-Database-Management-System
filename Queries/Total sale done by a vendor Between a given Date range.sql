use OnlineShopping



select sum(Price) as "Total Sale"
from VendorProduct
inner join(
select VendorProductID
from OrderedProduct
inner join(
select OrderID as oid
from Orders
where OrderDate Between '2013-07-26' And '2014-02-21') ordi on ordi.oid=OrderedProduct.VendorProductID)vpid on vpid.VendorProductID=VendorProduct.VendorProductID
where VendorID='3'