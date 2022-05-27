
const { AgendaModel } = require("../models/agenda.model");
const { sequelize } = require("./bd.service");
const { QueryTypes } = require("sequelize");

// Consulta en la base de datos
const list = async () => {

  let sql = `select a.*,concat(c.cli_nombre,' ',c.cli_apellido) as nombre   
              from agenda as a 
              inner join cliente as c
              on c.cli_codigo = age_codcli`;

  const agendaModelResults = await sequelize.query(sql);
   
    if (agendaModelResults) {
      return agendaModelResults[0]
    } else {
      return null;
    }
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
