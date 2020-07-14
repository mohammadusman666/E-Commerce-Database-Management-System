
use OnlineShopping;

Select FirstName, LastName, HouseNo, Street, Area, CityName
From City

	inner join (
		Select FirstName, LastName, HouseNo, Street, Area, CityID
		From ZipCode

			inner join (
				Select FirstName, LastName, HouseNo, Street, Area, ZipCodeID
				From Customer

					inner join (
						Select CustomerID, HouseNo, Street, Area, ZipCodeID
						From Address
	
							inner join (
								Select TOP 1 AddressID
								From Orders
								Where AddressID = (Select max(AddressID) From Orders)
							) adid on adid.AddressID = Address.AddressID

					) cid on cid.CustomerID = Customer.CustomerID

			) zcid on zcid.ZipCodeID = ZipCode.ZipCodeID

	) ctid on ctid.CityID = City.CityID