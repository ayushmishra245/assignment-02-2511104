## Anomaly Analysis

Insert Anomaly:

In the flat file, product details are stored only when an order exists. This means a new product cannot be added independently unless there is also an order for it. For example, product P008 (Webcam) appears only in the row with order_id ORD1185. If the company wants to add a new product before any order is placed, there is no separate place to store that information. This is an insert anomaly because product master data depends on order data.

Update Anomaly:

The same sales representative information is repeated across multiple rows. This can lead to inconsistent updates. For example, for sales_rep_id SR01 (Deepak Joshi), the office address appears in more than one row. If the office address is updated in one row but missed in another, inconsistent values may remain in the dataset. This is an update anomaly because the same information is stored repeatedly.

Delete Anomaly:

Some product information exists only because of a related order row. For example, product P008 (Webcam) appears only once in the dataset, in the row for order_id ORD1185. If that row is deleted, both the order record and the only available product record are lost. This is a delete anomaly because deleting a transaction can also remove important master data.


## Normalization Justification

The flat file contains customer details, product details, sales representative details, and order details in a single table. This causes repeated data and increases redundancy. The same customer can appear in multiple rows, the same product can appear in multiple orders, and the same sales representative details are repeated many times.

This structure creates data maintenance problems. If a customer email changes, it must be updated in every row where that customer appears. If a product is deleted from a single row and it was the only occurrence, the product information may be lost. Similarly, inserting a new product or sales representative without an order is difficult because there is no separate place to store that data.

To solve this, the data is normalized into separate tables:
- customers
- products
- sales_reps
- orders

Each table stores one type of entity, and the orders table connects them using foreign keys. This reduces redundancy, improves consistency, and makes insert, update, and delete operations easier to manage.

The final design is in 3NF because:
- each table has a primary key
- all non-key attributes depend only on the primary key
- there are no repeating groups
- there are no transitive dependencies within the tables

Therefore, normalization is necessary in this case to maintain clean and reliable data.