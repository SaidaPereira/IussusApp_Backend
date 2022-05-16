const usuariocontroller = require("../controllers/usuario.controller");
const authorizationMiddleware = require("../middleware/authorization.middleware");

module.exports = (app) => {
  app.get("/usuarios", usuariocontroller.list);

  app.get("/usuario/find/:id", authorizationMiddleware.authorization,usuariocontroller.getById);

  app.post("/usuario/create",usuariocontroller.create);

  app.put("/usuario/update", authorizationMiddleware.authorization,usuariocontroller.update);

  app.delete("/usuario/remove/:id", authorizationMiddleware.authorization,usuariocontroller.remove);

  app.post("/usuario/login", usuariocontroller.login);

  app.post("/usuario/logout",authorizationMiddleware.authorization, usuariocontroller.logout);

};
