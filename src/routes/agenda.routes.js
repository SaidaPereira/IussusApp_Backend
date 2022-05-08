const agendaController = require("../controllers/agenda.controller");

module.exports = (app) => {
  app.get("/agendas",agendaController.list);

  app.get("/agenda/find/:id",agendaController.getById);

  app.post("/agenda/create",agendaController.create);

  app.put("/agenda/update",agendaController.update);

  app.delete("/agenda/remove/:id",agendaController.remove);
};
