# Database-Management-System

Use Case: Inventory Tracking
Purpose: Track products, suppliers, stock levels, and sales in a retail store.
Entities and Relationships:
Products: Each product has a unique ID, name, description, and unit price.
Suppliers: Each supplier has a unique ID, name, and contact details, supplying multiple products (1-M).
Stock: Tracks the current quantity of each product in the warehouse, linked to Products (1-M).
Sales: Records transactions, where each sale can involve multiple products (M-M via a junction table).
SalesItems: Junction table for the M-M relationship between Sales and Products, capturing quantities sold.
Constraints:
Primary keys (PK) for unique identification.
Foreign keys (FK) to enforce referential integrity.
NOT NULL for required fields.
UNIQUE for fields like supplier email or product SKU.
Database Design
Tables:
Suppliers (1-M with Products)
Products (1-M with Stock and M-M with Sales via SalesItems)
Stock (1-M with Products)
Sales (M-M with Products via SalesItems)
SalesItems (Junction table for Sales and Products)
Relationships:
1-M: A supplier supplies multiple products; a product has one supplier.
1-M: A product has one stock record; a stock record tracks one product.
M-M: A sale can include multiple products, and a product can be sold in multiple sales.
