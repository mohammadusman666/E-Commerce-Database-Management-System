use OnlineShopping


select Name,Product.ProductName,OrderedQuantity
from Product

inner join(
select vendor.Name,ProductID,OrderedQuantity
from Vendor

inner join(

 
 select vendorID,ProductID,OrderedQuantity
from VendorProduct
inner join (
select TOP 3 OrderedProduct.VendorProductID,sum(Quantity) as OrderedQuantity
from OrderedProduct group by VendorProductID order by orderedquantity desc) vpfk on vpfk.VendorProductID=VendorProduct.VendorProductID)
vpid on vpid.VendorID=vendor.VendorID)
vpvp on vpvp.ProductID=Product.ProductID



