const productocontroller = require("../controllers/producto.controller");

module.exports = (app) => {
  app.get("/productos", productocontroller.list);

  app.get("/productos-filter", productocontroller.listFilter);

  app.get("/producto/find/:id", productocontroller.getById);

  app.post("/producto/create", productocontroller.create);

  app.put("/producto/update", productocontroller.update);

  app.delete("/producto/remove/:id", productocontroller.remove);
};
