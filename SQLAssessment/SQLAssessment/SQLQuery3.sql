Use NORMAL;

Create Table ProductsTrig(
	ProductId int,
	Price int
);

Insert Into ProductsTrig Values (1,200),(2,150),(3,200);

Select * From ProductsTrig;

--Q4 -- 

Create or Alter Trigger UpdatePrice On ProductsTrig
Instead of Update
As
Begin
	
	if exists (
		Select 1 
		from inserted i join deleted d on i.ProductId = d.ProductId
		Where d.Price > i.Price * 0.8
	)
	Begin
		Raiserror('insertedprice is 20 perecentage less then the delete price',16,1)
		Rollback Transaction;
		Return;
	End

	Update P
	set P.ProductId = i.ProductId,
		P.Price = i.Price
	From ProductsTrig P join inserted i on P.ProductId = i.ProductId;

End
update ProductsTrig
Set Price = 10
Where ProductId = 1; 
