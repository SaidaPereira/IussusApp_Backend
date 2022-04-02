
const { ClienteModel } = require("../../models/cliente.model");
const { sequelize } = require("../bd.service");
const { QueryTypes } = require("sequelize");

// Consulta en la base de datos
const list = async (query, pageStart = 1, pageLimit = 10) => {
  const clienteModelResults = await ClienteModel.findAll();

  const clientesArray = new Array();
  for (let i = 0; i < clienteModelResults.length; i++) {
    const clientesResult = clienteModelResults[i];
    clientesArray.push(clientesResult.dataValues);
  }

  return clientesArray;
};

//Consulta en la base de datos filtrando por palabras
const listFilter = async (query, pageStart = 1, pageLimit = 10) => {
  let clientesResult = await sequelize.query(
    `SELECT * FROM cliente WHERE (UPPER(cli_nombre) LIKE :q
                                           OR UPPER(cli_apellido)  LIKE :q)
                                           ORDER BY cli_codigo`,
    {
      replacements: {
        q: query ? "%" + query.toUpperCase() + "%" : "%",
      },
      //type:QueryTypes.SELECT
    }
  );

  clientesResult = clientesResult && clientesResult[0] ? clientesResult[0] : [];

  return clientesResult;
};


// Buscar en la base de datos por codigo
const getById = async (cli_codigo) => {
  const clienteModelResult = await ClienteModel.findByPk(cli_codigo);

  if (clienteModelResult) {
    return clienteModelResult.dataValues;
  } else {
    return null;
  }
};

//Guardar datos nuevos en la base de datos
const create = async (data) => {
  const clienteModelResult = await ClienteModel.create(data);

  if (clienteModelResult) {
    return clienteModelResult.dataValues;
  } else {
    return null;
  }

  return data;
};

//Actualizar datos en la base de datos
const update = async (data) => {
  const clienteModelCount = await ClienteModel.update(data, {
    where: {
      cli_codigo: data.cli_codigo,
    },
  });

  if (clienteModelCount > 0) {
    const clienteModelResult = await ClienteModel.findByPk(data.cli_codigo);
    return clienteModelResult.dataValues;
  } else {
    return null;
  }
};

//Eliminar datos en la base de datos

const remove = async (cli_codigo) => {
  const clienteModelCount = await ClienteModel.destroy({
    where: {
      cli_codigo: cli_codigo,
    },
  });

  if (clienteModelCount > 0) {
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
