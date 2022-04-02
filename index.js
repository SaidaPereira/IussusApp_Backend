const express = require("express");
const bodyparser = require("body-parser");
const multer = require("multer");
const app = express();
const upload = multer({ dest: "uploads/" });

app.use(bodyparser());

require("./src/routes/cliente.routes")(app);

app.listen(3000);
