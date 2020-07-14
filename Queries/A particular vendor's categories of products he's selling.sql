use OnlineShopping

select CategoryName
from Category
where CategoryID in
					(select Distinct CategoryID
					from Product
					where ProductID in
									(select ProductID
									from VendorProduct
									where VendorID='3'))