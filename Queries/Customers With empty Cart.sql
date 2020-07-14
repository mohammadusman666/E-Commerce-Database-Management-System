use OnlineShopping

select * 
from Customer 
where Customer.CustomerID NOT IN (select CustomerID from Cart)