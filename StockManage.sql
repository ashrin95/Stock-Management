Drop Database [StockManage]
CREATE DATABASE [StockManage]
Use [StockManage]
CREATE TABLE [dbo].[customer](
	[customer_id] [int] Primary key IDENTITY(1,1) NOT NULL,
	[customer_name] [varchar](50) NULL,
	[mobile] [varchar](50) NULL,
	[address] [varchar](50) NULL);
CREATE TABLE [dbo].[produc_type](
	[product_type_id] [int] Primary key IDENTITY(1,1) NOT NULL,
	[product_type_name] [varchar](50) NULL);

CREATE TABLE [dbo].[product](
	[product_id] [int] Primary key IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](50) NULL,
	[product_type_id] [int] references [produc_type]([product_type_id]) NULL,
	[buying_price] [decimal](18, 8) NULL,
	[selling_price] [decimal](18, 8) NULL,
	[photo] [varchar](500) NULL);

CREATE TABLE [dbo].[supplier](
	[supplier_id] [int] Primary Key IDENTITY(1,1) NOT NULL,
	[supplier_name] [varchar](50) NULL,
	[mobile] [decimal](18, 0) NULL,
	[address] [varchar](50) NULL);

CREATE TABLE [dbo].[store](
	[store_id] [int] Primary Key IDENTITY(1,1) NOT NULL,
	[store_no] [int] NULL,
	[store_name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[manager_name] [varchar](50) NULL);

CREATE TABLE [dbo].[stock](
	[stock_id] [int] Primary Key IDENTITY(1,1) NOT NULL,
	[product_id] [int] references [product]([product_id]) NULL,
	[store_id] [int] references [store]([store_id]) NULL,
	[quantity] [int] NULL,
	[status] [varchar](50) NULL);

CREATE TABLE [dbo].[purchase](
	[purchase_id] [int] Primary Key IDENTITY(1,1) NOT NULL,
	[product_id] [int] references [product]([product_id]) NULL,
	[supplier_id] [int] references [supplier]([supplier_id]) NULL,
	[store_id] [int] references [store]([store_id]) NULL,
	[purchase_date] [date] NULL,
	[unit_price] [decimal](18, 8) NULL,
	[quantity] [int] NULL,
	[total_price] [decimal](18, 8) NULL,
	[vat] [decimal](18, 8) NULL,
	[grand_total_price] [decimal](18, 8) NULL,
	[stock_status] [varchar](50) NULL,
	[memo_no] [int] NULL,
	[coomments] [varchar](50) NULL);

CREATE TABLE [dbo].[Sale](
	[sale_id] [int] Primary Key IDENTITY(1,1) NOT NULL,
	[product_id] [int] references [product]([product_id]) NULL,
	[customer_id] [int] references [customer]([customer_id]) NULL,
	[store_id] [int] references [store]([store_id]) NULL,
	[sale_date] [date] NULL,
	[rate] [decimal](18, 2) NULL,
	[quantity] [int] NULL,
	[total_price] [decimal](18, 2) NULL,
	[vat] [decimal](18, 2) NULL,
	[discount] [decimal](18, 2) NULL,
	[net_total_price] [decimal](18, 2) NULL,
	[stock_status] [varchar](50) NULL,
	[memo_no] [int] NULL,
	[coomments] [varchar](50) NULL);
