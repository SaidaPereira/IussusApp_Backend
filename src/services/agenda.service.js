
const { AgendaModel } = require("../models/agenda.model");
const { sequelize } = require("./bd.service");
const { QueryTypes } = require("sequelize");

// Consulta en la base de datos
const list = async (query, pageStart = 1, pageLimit = 10) => {
  const agendaModelResults = await AgendaModel.findAll(
    {
      order:['age_codigo'],
    }
  );

  const agendasArray = new Array();
  for (let i = 0; i < agendaModelResults.length; i++) {
    const agendasResult = agendaModelResults[i];
    agendasArray.push(agendasResult.dataValues);
  }

  return agendasArray;
};


// Buscar en la base de datos por codigo
const getById = async (age_codigo) => {
  const agendaModelResult = await AgendaModel.findByPk(age_codigo);

  if (agendaModelResult) {
    return agendaModelResult.dataValues;
  } else {
    return null;
  }
};

//Guardar datos nuevos en la base de datos
const create = async (data) => {
  const agendaModelResult = await AgendaModel.create(data);

  if (agendaModelResult) {
    return agendaModelResult.dataValues;
  } else {
    return null;
  }

  return data;
};

//Actualizar datos en la base de datos
const update = async (data) => {
  const agendaModelCount = await AgendaModel.update(data, {
    where: {
      age_codigo: data.age_codigo,
    },
  });

  if (agendaModelCount > 0) {
    const agendaModelResult = await AgendaModel.findByPk(data.age_codigo);
    return agendaModelResult.dataValues;
  } else {
    return null;
  }
};

//Eliminar datos en la base de datos

const remove = async (age_codigo) => {
  const agendaModelCount = await AgendaModel.destroy({
    where: {
      age_codigo: age_codigo,
    },
  });

  if (agendaModelCount > 0) {
    return true;
  } else {
    return false;
  }
};

module.exports = {
  list,
  getById,
  create,
  update,
  remove,
};
