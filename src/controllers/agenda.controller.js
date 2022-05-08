const agendaService = require("../services/agenda.service");

const list = async (req, res) => {
  const agendas = await agendaService.list(req.query.q);

  res.send({ success: true, agendas });
};

const getById = async (req, res) => {
  const agenda = await agendaService.getById(req.params.id);

  let jsonResultado = req.query;
  jsonResultado["success"] = true;
  jsonResultado["agenda"] = agenda;

  res.status(201).send(jsonResultado);
};

const create = async (req, res) => {
  const agenda = await agendaService.create(req.body);
  res.status(202).send({ success: true, agenda });
};

const update = async (req, res) => {
  const agenda = await agendaService.update(req.body);
  res.status(202).send({ success: true, agenda });
};

const remove = async (req, res) => {
  const booleanValue = await agendaService.remove(req.params.id);
  res.status(202).send({ success: booleanValue });
};

module.exports = {
  list,
    getById,
  create,
  update,
  remove,
};
