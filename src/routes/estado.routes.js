const estadocontroller = require("../controllers/estado.controller");

module.exports = (app) => {
  app.get("/estados", estadocontroller.list);

  app.get("/estados-filter", estadocontroller.listFilter);

  app.get("/estado/find/:id", estadocontroller.getById);

  app.post("/estado/create", estadocontroller.create);

  app.put("/estado/update", estadocontroller.update);

  app.delete("/estado/remove/:id", estadocontroller.remove);
};
