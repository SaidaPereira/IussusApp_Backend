const usuariocontroller = require("../controllers/usuario.controller");
const authorizationMiddleware = require("../middleware/authorization.middleware");

module.exports = (app) => {
  app.get("/usuarios", usuariocontroller.list);

  app.get("/usuario/find/:id", usuariocontroller.getById);

  app.post("/usuario/create",usuariocontroller.create);

  app.put("/usuario/update",usuariocontroller.update);

  app.post("/usuario/login", usuariocontroller.login);

  app.post("/usuario/logout",authorizationMiddleware.authorization, usuariocontroller.logout);

};
