
const { EstadoModel } = require("../models/estado.model");
const { sequelize } = require("./bd.service");
const { QueryTypes } = require("sequelize");

// Consulta en la base de datos
const list = async (query, pageStart = 1, pageLimit = 10) => {
  const estadoModelResults = await EstadoModel.findAll();

  const estadosArray = new Array();
  for (let i = 0; i < estadoModelResults.length; i++) {
    const estadosResult = estadoModelResults[i];
    estadosArray.push(estadosResult.dataValues);
  }

  return estadosArray;
};

//Consulta en la base de datos filtrando por palabras
const listFilter = async (query, pageStart = 1, pageLimit = 10) => {
  let estadosResult = await sequelize.query(
    `SELECT * FROM estado WHERE (UPPER(est_descripcion) LIKE :q)
                                           ORDER BY est_codigo`,
    {
      replacements: {
        q: query ? "%" + query.toUpperCase() + "%" : "%",
      },
      //type:QueryTypes.SELECT
    }
  );

  estadosResult = estadosResult && estadosResult[0] ? estadosResult[0] : [];

  return estadosResult;
};


// Buscar en la base de datos por codigo
const getById = async (est_codigo) => {
  const estadoModelResult = await EstadoModel.findByPk(est_codigo);

  if (estadoModelResult) {
    return estadoModelResult.dataValues;
  } else {
    return null;
  }
};

//Guardar datos nuevos en la base de datos
const create = async (data) => {
  const estadoModelResult = await EstadoModel.create(data);

  if (estadoModelResult) {
    return estadoModelResult.dataValues;
  } else {
    return null;
  }

  return data;
};

//Actualizar datos en la base de datos
const update = async (data) => {
  const estadoModelCount = await EstadoModel.update(data, {
    where: {
      est_codigo: data.est_codigo,
    },
  });

  if (estadoModelCount > 0) {
    const estadoModelResult = await EstadoModel.findByPk(data.est_codigo);
    return estadoModelResult.dataValues;
  } else {
    return null;
  }
};

//Eliminar datos en la base de datos

const remove = async (est_codigo) => {
  const estadoModelCount = await EstadoModel.destroy({
    where: {
      est_codigo: est_codigo,
    },
  });

  if (estadoModelCount > 0) {
    return true;
  } else {
    return false;
  }
};

module.exports = {
  list,
  listFilter,
  getById,
  create,
  update,
  remove,
};
