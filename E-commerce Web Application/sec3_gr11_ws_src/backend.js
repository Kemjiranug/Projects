const express = require("express");
const path = require("path");
const app = express();
const router = express.Router();
app.use("/", router);
app.use(express.static(path.join(__dirname, 'Front-end')));
router.use(express.json());
router.use(express.urlencoded({ extended: true }));

const dotenv = require("dotenv");
dotenv.config();

const cors = require("cors");
/* This is for specific origin and method */
let corsOptions = {
    origin: 'http://localhost:3300',
    methods: 'GET,POST,PUT,DELETE'
}
router.use(cors(corsOptions));


const session = require("express-session");
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));

const cookieParser = require('cookie-parser');
router.use(cookieParser('MY Cookie'));


/* Connection to MySQL */
const mysql = require("mysql2");
var connection = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USERNAME,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
});


/* Connection to DB */
connection.connect(function (err) {
    if (err) {
        throw err;
    }
    console.log(`Connected DB : ${process.env.MYSQL_DATABASE}`)
})


/* FOR HOMEPAGE PAGE*/
router.get("/new-products", (req, res) => {
    connection.query('SELECT * FROM Product WHERE prod_status = "NEW" LIMIT 5', (error, results) => {
        if (error) {
            console.error('Error fetching products:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        res.json(results);
    });
});

router.get("/best-selling", (req, res) => {
    connection.query('SELECT * FROM Product WHERE prod_category = "Women" AND prod_seasons = "Summer" LIMIT 5', (error, results) => {
        if (error) {
            console.error('Error fetching products:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        res.json(results);
    });
});

/* FOR EDIT PAGE*/
router.get("/men-fasion", (req, res) => {
    connection.query('SELECT * FROM Product WHERE prod_category = "Men" LIMIT 5', (error, results) => {
        if (error) {
            console.error('Error fetching products:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        res.json(results);
    });
});

/* FOR PRODUCT PAGE */
router.get("/products", (req, res) => {
    alert('product');
    connection.query('SELECT * FROM Product', (error, results) => {
        if (error) {
            console.error('Error fetching products:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        res.json(results);
    });
});

// Endpoint to fetch product data from the database
router.get('/select', (req, res) => {
    let sql = 'SELECT * FROM Product WHERE 1 = 1'; // Initial query

    // Check if productName query parameter is provided
    if (req.query.productName) {
        const productName = req.query.productName;
        sql += ` AND prod_name LIKE '%${productName}%'`;
    }

    // Check if category query parameter is provided
    if (req.query.category && req.query.category !== 'All Products') {
        const category = req.query.category;
        sql += ` AND prod_category = '${category}'`;
    }
    // Check if season query parameter is provided
    if (req.query.season && req.query.season !== 'All Products') {
        const season = req.query.season;
        sql += ` AND prod_seasons = '${season}'`;
    }
    // Check if minPrice and maxPrice query parameters are provided
    if (req.query.minPrice && req.query.maxPrice) {
        const minPrice = parseFloat(req.query.minPrice);
        const maxPrice = parseFloat(req.query.maxPrice);
        sql += ` AND (prod_price BETWEEN ${minPrice} AND ${maxPrice})`;
    }

    // Check if sortBy query parameter is provided
    if (req.query.sortBy) {
        const sortBy = req.query.sortBy;
        switch (sortBy) {
            case 'nameAZ':
                sql += ' ORDER BY prod_name ASC';
                break;
            case 'nameZA':
                sql += ' ORDER BY prod_name DESC';
                break;
            case 'priceLowToHigh':
                sql += ' ORDER BY prod_price ASC';
                break;
            case 'priceHighToLow':
                sql += ' ORDER BY prod_price DESC';
                break;
            default:
                return res.status(400).json({ error: true, message: 'Invalid sortBy option' });
        }
    }

    // Execute the query
    connection.query(sql, (error, results) => {
        if (error) {
            console.error('Error fetching product data:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.json(results);
    });
});


// Endpoint to fetch product data from the database based on category
router.get('/select_cat', (req, res) => {
    const category = req.query.category; // Get the category from the query parameter
    let sql;
    if (category) {
        // If a category is provided, filter products based on that category
        sql = `SELECT * FROM Product WHERE prod_category = ?`;
    } else {
        // If no category is provided, fetch all products
        sql = 'SELECT * FROM Product';
    }

    // Execute the query with or without category filtering
    connection.query(sql, [category], (error, results) => {
        if (error) {
            console.error('Error selecting products:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.json(results);
    })
})



/* FOR LOGIN PAGE*/
router.post("/form-post", (req, res) => {
    
    const username = req.body.username;
    const password = req.body.password;
    

    let sql = `SELECT * FROM Login WHERE (login_email = ?) AND (login_password = ?)`;
    console.log('sql:'+sql);
    connection.query(sql, [username, password], function (error, results) {
        if (error) {
            res.status(500).send("Internal server error. Please try again."); // Internal server error
        } else {
            console.log(results.length);
            if (results.length > 0) {
                // Set cookie upon successful login
                return res.status(200).send({ error: false,  message: "true" });

                
                console.log("Sign In");
            
            
            } else {
                
                // Render HTML with pop-up message for invalid credentials
                return res.status(401).send({ error: true,  message: "Invalid username or password. Please try again." });
                console.log("Sign In Failed");
            }
        }
    })
})

/* FOR PRODUCT DETAIL PAGE */
router.get("/product_detail", (req, res) => {

    const productId = req.query.prod_ID;
    // Validate the SKU parameter
    if (!productId) {
        return res.status(400).json({ error: 'product ID parameter is required' });
    }
    // Fetch product details from the database based on SKU
    connection.query('SELECT * FROM Product WHERE prod_ID = ?', [productId], (error, results) => {
        if (error) {
            console.error('Error fetching product details:', error);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
        // Check if product details were found
        if (results.length === 0) {
            return res.status(404).json({ error: 'Product details not found' });
        }
        // Send the product details to the client
        const productDetails = results[0]; // Assuming only one product matches the SKU
        console.log(productDetails);
        res.json(productDetails);
    })
})

// Endpoint to fetch product data from the database based on season
router.get('/select_season', (req, res) => {
    const category = req.query.season; // Get the category from the query parameter
    let sql;
    if (category) {
        // If a category is provided, filter products based on that season
        sql = `SELECT * FROM Product WHERE prod_seasons = ?`;
    } else {
        // If no category is provided, fetch all products
        sql = 'SELECT * FROM Product';
    }

    // Execute the query with or without category filtering
    connection.query(sql, [category], (error, results) => {
        if (error) {
            console.error('Error selecting products:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.json(results);
    })
})

// Endpoint to fetch product data from the database
router.get('/select_sort', (req, res) => {
    let sql = 'SELECT * FROM Product';

    // Check if sortBy query parameter is provided
    if (req.query.sortBy) {
        const sortBy = req.query.sortBy;
        switch (sortBy) {
            case 'nameAZ':
                sql += ' ORDER BY prod_name ASC';
                break;
            case 'nameZA':
                sql += ' ORDER BY prod_name DESC';
                break;
            case 'priceLowToHigh':
                sql += ' ORDER BY prod_price ASC';
                break;
            case 'priceHighToLow':
                sql += ' ORDER BY prod_price DESC';
                break;
            default:
                // Handle invalid sortBy option
                return res.status(400).json({ error: true, message: 'Invalid sortBy option' });
        }
    }

    // Execute the query
    connection.query(sql, (error, results) => {
        if (error) {
            console.error('Error fetching product data:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.json(results);
    });
});

router.get('/options', (req, res) => {
    connection.query('SELECT DISTINCT prod_category FROM Product', (error, results) => {
        if (error) {
            console.error('Error fetching categories:', error);
            res.status(500).json({ error: true, message: 'Internal server error' });
        } else {
            const categories = results.map(row => row.category);
            res.json({ categories });
        }
    })
})


router.get('/categories', (req, res) => {
    // Query to fetch category data from the database
    const sql = 'SELECT DISTINCT prod_category FROM Product';

    // Execute the query
    connection.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching categories:', err);
            res.status(500).json({ error: 'Error fetching categories' });
            return;
        }

        // Process the results and structure them in the desired format
        const categories = results.map(row => row.prod_category);

        // Send the structured data as the response
        res.json({ categories });
    })
})

router.get('/season', (req, res) => {
    // Query to fetch category data from the database
    const sql = 'SELECT DISTINCT prod_seasons FROM Product';

    // Execute the query
    connection.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching categories:', err);
            res.status(500).json({ error: 'Error fetching categories' });
            return;
        }

        // Process the results and structure them in the desired format
        const categories = results.map(row => row.prod_category);

        // Send the structured data as the response
        res.json({ categories });
    })
})

router.post("/add-product", function (req, res) {
    const Product = req.body.Product;
    console.log(Product);

    if (!Product.prod_ID || !Product.prod_name || !Product.prod_status) {
        return res.status(400).send({
            error: true, message: 'Please provide product information'
        });
    }

    const sql = `INSERT INTO Product (prod_ID, prod_name, prod_status, prod_pic1, prod_pic2, prod_pic3, prod_pic4, prod_category, prod_seasons, prod_description, prod_price, prod_quantity)
                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

    connection.query(sql, [
        Product.prod_ID,
        Product.prod_name,
        Product.prod_status,
        Product.prod_pic1,
        Product.prod_pic2,
        Product.prod_pic3,
        Product.prod_pic4,
        Product.prod_category,
        Product.prod_seasons,
        Product.prod_description,
        Product.prod_price,
        Product.prod_quantity
    ], function (error, results) {
        if (error) {
            console.error("Error inserting product:", error);
            return res.status(500).send({
                error: true,
                message: error//'Error inserting product into the database'
            });
        }

        // Send success message
        return res.send({
            error: false,
            message: 'New product has been created successfully.',
            data: results
        });
    });

    
});

//Delete

router.delete('/delete_product', (req, res) => {

    const sku = req.query.sku; // Get the product SKU from the query parameter



    if (!sku) {
        return res.status(400).json({ error: true, message: 'Product SKU is required' });
    }

    // Query to delete the product from the database
    const sql = 'DELETE FROM Product WHERE prod_ID = ?';

    // Execute the delete query
    connection.query(sql, [sku], (error, results) => {
        if (error) {
            console.error('Error deleting product:', error);
            return res.status(500).json({ error: true, message: 'Internal server error' });
        }
        return res.status(200).json({ success: true, message: 'Product deleted successfully' });
    })
})

router.post('/update-product', (req, res) => {

    const prod_ID = req.query.prod_ID;
    console.log(prod_ID);



    if (!prod_ID) {
        return res.status(400).send({
            error: true, message: 'Please provide product information'
        });
    }

    const updatedProduct = req.body.Product; // Get the updated product data from the request body
    console.log(updatedProduct);


    if (!prod_ID || Object.keys(updatedProduct).length === 0) {
        return res.status(400).send({ error: true, message: 'Please provide a Product and updated product data' });
    }

    connection.query('UPDATE Product SET ? WHERE prod_ID = ?', [updatedProduct, prod_ID], (error, results) => {
        if (error) {
            console.error('Error updating product:', error);
            return res.status(500).send({ error: true, message: 'Error updating product' });
        }
        return res.send({ error: false, data: results.affectedRows, message: 'Product updated successfully' });
    });
});





app.listen(process.env.PORT, () => {
    console.log(`Server listening on port: ${process.env.PORT}`);
})