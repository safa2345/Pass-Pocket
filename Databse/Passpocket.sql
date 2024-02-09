Create Database PassPocket
use PassPocket
select * from Categories

drop table Categories

create table Users(
    Id int identity(1,1),
    Name nvarchar(100) not null,
    Email nvarchar(1000),
    Password nvarchar(100) not null,
    IsAdmin bit,
    CONSTRAINT PK_User PRIMARY KEY (ID, Email, IsAdmin)
)

create table Categories(
    Id int identity(1,1),
    Name nvarchar(100),
    CONSTRAINT PK_Category PRIMARY KEY (Name)
)

create table Accounts(
    Id int identity(1,1),
    Name nvarchar(100) not null,
    Url nvarchar(1000) not null,
    Email nvarchar(1000) not null,
    Password nvarchar(100) not null,
    Modified datetime not null,
    Category nvarchar(100),
    UserId int,
    UserEmail nvarchar(1000),
    IsAdmin bit,
    CONSTRAINT PK_Account PRIMARY KEY (Id, Category, UserEmail),
    CONSTRAINT FK_AccountUser FOREIGN KEY (UserId, UserEmail, IsAdmin) REFERENCES Users(Id, Email,IsAdmin) ,
    CONSTRAINT FK_AccountCategory FOREIGN KEY (Category) REFERENCES Categories(Name)
)

select * from Accounts