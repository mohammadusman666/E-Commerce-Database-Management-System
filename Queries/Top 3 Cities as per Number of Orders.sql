use OnlineShopping


select Top 3 City.CityName,"no of Orders"
from City	inner join(
						select ZipCode.CityID,"no of Orders"
						from ZipCode inner join
										(select Address.ZipCodeID,count(Address.ZipCodeID) as "no of Orders"
										from Address	inner join
												(select AddressID
													from Orders) ad 
												on ad.AddressID=Address.AddressID
												group by Address.ZipCodeID) 
										zpc on zpc.ZipCodeID=ZipCode.ZipCodeID) 
						ck on ck.CityID=city.CityID

order by "no of Orders" desc
