const pedidocontroller = require("../controllers/pedido.controller");

module.exports = (app) => {

  app.post("/pedido/create", pedidocontroller.create);
  app.get("/pedido/find/:id", pedidocontroller.getById);
  app.get("/pedido/get", pedidocontroller.get);

  app.delete("/pedido/remove/:id", pedidocontroller.remove);

  app.put("/pedido/update", pedidocontroller.updateEstado);

};
