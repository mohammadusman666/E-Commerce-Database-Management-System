use OnlineShopping


select Name,Contact,email,ProductName,Price
from Vendor

inner join(
select Product.ProductName,VendorID,Price
from Product
inner join(
 select ProductID,VendorID,Price
from VendorProduct
inner join (
select TOP 3 OrderedProduct.VendorProductID,sum(Quantity) as OrderedQuantity
from OrderedProduct group by VendorProductID order by orderedquantity desc) vpfk on vpfk.VendorProductID=VendorProduct.ProductID
) pro on pro.ProductID=Product.ProductID) vna on vna.VendorID=Vendor.VendorID


order by Price
