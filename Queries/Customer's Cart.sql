use OnlineShopping

select Name,ProductName,Qty
from Product
inner join(
select Vendor.Name,ProductID,Qty
from Vendor
inner join(
select Vendorid,Productid,Qty
from VendorProduct
inner join(
select CartProduct.VendorProductID,CartProduct.Quantity as Qty
from CartProduct

inner join(
select CartID
from Cart
where CustomerID='170') cid on cid.CartID=CartProduct.CartID)
 vpid on vpid.VendorProductID=VendorProduct.VendorProductID)
 vid on vid.vendorid=vendor.vendorid)
 pid on pid.ProductID=product.ProductID