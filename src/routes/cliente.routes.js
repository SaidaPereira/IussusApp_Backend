const clienteController = require("../controllers/cliente.controller");

module.exports = (app) => {
  app.get("/clientes", clienteController.list);

  app.get("/clientes-filter", clienteController.listFilter);

  app.get("/cliente/find/:id", clienteController.getById);

  app.post("/cliente/create", clienteController.create);

  app.put("/cliente/update", clienteController.update);

  app.delete("/cliente/remove/:id", clienteController.remove);
};
