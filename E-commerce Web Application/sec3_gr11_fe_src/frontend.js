const PORT = 3300;
const path = require("path");
const express = require("express");
const app = express();
const dotenv = require("dotenv");
dotenv.config();

const router = express.Router();
const cors = require("cors");
/* This is for specific origin and method */
let corsOptions = {
    origin: 'http://localhost:8000',
    methods: 'GET,POST,PUT,DELETE'
}
router.use(cors(corsOptions));


app.use("/", router);
app.use("/picture", express.static(path.join(__dirname, "picture")));
app.use("/css", express.static("css"));
app.use("/js", express.static(path.join(__dirname, "js")));

router.use(express.json());
router.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

/* START OF homepage */
router.get("/homepage", (req, res) => {
    console.log("--Connected to Webpage")
    res.sendFile(path.join(`${__dirname}/html/homepage.html`));
})
/* END OF homepage */

/* START OF sign-in */
router.get("/sign-in", (req, res) => {
    console.log("--Connected to Signin Page")
    res.sendFile(path.join(`${__dirname}/html/sign-in.html`));
})
/* END OF sign-in */

/* START OF team-page */
router.get("/team", (req, res) => {
    console.log("--Connected to Team Page")
    res.sendFile(path.join(`${__dirname}/html/Team.html`));
})

/* END OF team-page */


router.get('/search', (req, res) => {
    res.sendFile(path.join(`${__dirname}/html/search.html`))
    console.log('Request at ', req.url)
});

router.get('/product', (req, res) => {
    res.sendFile(path.join(`${__dirname}/html/Product.html`))
    console.log('Request at ', req.url)
});

router.get('/add', (req, res) => {
    res.sendFile(path.join(`${__dirname}/html/add.html`))
    console.log('Request at ', req.url)
});

router.get('/detail-page', (req, res) => {
    res.sendFile(path.join(`${__dirname}/html/detailpage.html`))
    console.log('Request at ', req.url)
});

router.get('/edit', (req, res) => {
    res.sendFile(path.join(`${__dirname}/html/edit-page.html`))
    console.log('Request at ', req.url)
});
router.get('/view', (req, res) => {
    res.sendFile(path.join(`${__dirname}/html/view.html`))
    console.log('Request at ', req.url)
});
router.get('/edit-product', (req, res) => {
    res.sendFile(path.join(`${__dirname}/html/edit.html`))
    console.log('Request at ', req.url)
});


app.listen(PORT, () => {
    console.log(`Server listening on port: ${PORT}`);
})