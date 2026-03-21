// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    product_id: "E1001",
    product_name: "Samsung Smart TV 55 Inch",
    category: "Electronics",
    brand: "Samsung",
    price: 54999,
    stock: 25,
    specifications: {
      screen_size: "55 inch",
      resolution: "4K UHD",
      voltage: "220V",
      warranty_years: 2
    },
    features: ["Smart TV", "WiFi", "HDR", "Voice Control"],
    seller: {
      seller_id: "S001",
      seller_name: "TechWorld"
    }
  },
  {
    product_id: "C2001",
    product_name: "Men's Casual Cotton Shirt",
    category: "Clothing",
    brand: "Allen Solly",
    price: 1899,
    stock: 60,
    sizes_available: ["S", "M", "L", "XL"],
    material: "100% Cotton",
    color_options: ["Blue", "White", "Black"],
    care_instructions: {
      wash_type: "Machine Wash",
      iron: "Warm Iron"
    },
    seller: {
      seller_id: "S002",
      seller_name: "FashionHub"
    }
  },
  {
    product_id: "G3001",
    product_name: "Organic Oats 1kg",
    category: "Groceries",
    brand: "True Elements",
    price: 399,
    stock: 120,
    expiry_date: new Date("2024-12-15"),
    weight: "1kg",
    nutritional_info: {
      calories_per_100g: 389,
      protein_g: 16.9,
      fiber_g: 10.6
    },
    ingredients: ["Whole Grain Oats"],
    seller: {
      seller_id: "S003",
      seller_name: "FreshMart"
    }
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "E1001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

// This index improves query performance when filtering products by category,
// especially when the product catalog grows large and category-based searches are frequent.