const productoService = require("../services/producto.service");

const list = async (req, res) => {
  const productos = await productoService.list(req.query.q);

  res.send({ success: true, productos });
};

const listFilter = async (req, res) => {
  const productos = await productoService.listFilter(req.query.q);

  res.send({ success: true, productos });
};

const getById = async (req, res) => {
  const producto = await productoService.getById(req.params.id);

  let jsonResultado = req.query;
  jsonResultado["success"] = true;
  jsonResultado["producto"] = producto;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const producto = await productoService.create(req.body);
  res.status(202).send({ success: true, producto });
};

const update = async (req, res) => {
  const producto = await productoService.update(req.body);
  res.status(202).send({ success: true, producto });
};

const remove = async (req, res) => {
  const booleanValue = await productoService.remove(req.params.id);
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
