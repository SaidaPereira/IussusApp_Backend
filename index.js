const express = require("express");
const bodyparser = require("body-parser");
const multer = require("multer");
const app = express();
const upload = multer({ dest: "uploads/" });
const cors = require('cors');
const PORT = 3000;

app.use(bodyparser.json());
app.use(cors());

require("./src/routes/cliente.routes")(app);
require("./src/routes/estado.routes")(app);
require("./src/routes/producto.routes")(app);



app.listen(PORT, () => {
    console.log(`Listening on ${PORT}`);
}).on('error', (err) => {console.log('ERROR DE CONEXION, PUERTO EN USO',err.message)});
