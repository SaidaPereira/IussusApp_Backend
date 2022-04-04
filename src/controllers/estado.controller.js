const estadoService = require("../services/estado.service");

const list = async (req, res) => {
  const estados = await estadoService.list(req.query.q);

  res.send({ success: true, estados });
};

const listFilter = async (req, res) => {
  const estados = await estadoService.listFilter(req.query.q);

  res.send({ success: true, estados });
};

const getById = async (req, res) => {
  const estado = await estadoService.getById(req.params.id);

  let jsonResultado = req.query;
  jsonResultado["success"] = true;
  jsonResultado["estado"] = estado;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const estado = await estadoService.create(req.body);
  res.status(202).send({ success: true, estado });
};

const update = async (req, res) => {
  const estado = await estadoService.update(req.body);
  res.status(202).send({ success: true, estado });
};

const remove = async (req, res) => {
  const booleanValue = await estadoService.remove(req.params.id);
  res.status(202).send({ success: booleanValue });
};

module.exports = {
  list,
  listFilter,
  getById,
  create,
  update,
  remove,
};
