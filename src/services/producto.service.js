
const { ProductoModel } = require("../models/producto.model");
const { sequelize } = require("./bd.service");
const { QueryTypes } = require("sequelize");

// Consulta en la base de datos
const list = async (query, pageStart = 1, pageLimit = 10) => {
  const ProductoModelResults = await ProductoModel.findAll(
    {
      order:['pro_codigo'],
    }
  );

  const ProductoArray = new Array();
  for (let i = 0; i < ProductoModelResults.length; i++) {
    const productosResult = ProductoModelResults[i];
    ProductoArray.push(productosResult.dataValues);
  }

  return ProductoArray;
};

//Consulta en la base de datos filtrando por palabras
const listFilter = async (query, pageStart = 1, pageLimit = 10) => {
  let productosResult = await sequelize.query(
    `SELECT * FROM producto WHERE (UPPER(pro_descripcion) LIKE :q)
                                           ORDER BY pro_codigo`,
    {
      replacements: {
        q: query ? "%" + query.toUpperCase() + "%" : "%",
      },
      //type:QueryTypes.SELECT
    }
  );

  productosResult = productosResult && productosResult[0] ? productosResult[0] : [];

  return productosResult;
};


// Buscar en la base de datos por codigo
const getById = async (pro_codigo) => {
  const productoModelResult = await ProductoModel.findByPk(pro_codigo);

  if (productoModelResult) {
    return productoModelResult.dataValues;
  } else {
    return null;
  }
};

//Guardar datos nuevos en la base de datos
const create = async (data) => {
  const productoModelResult = await ProductoModel.create(data);

  if (productoModelResult) {
    return productoModelResult.dataValues;
  } else {
    return null;
  }

  return data;
};

//Actualizar datos en la base de datos
const update = async (data) => {
  const productoModelCount = await ProductoModel.update(data, {
    where: {
        pro_codigo: data.pro_codigo,
    },
  });

  if (productoModelCount > 0) {
    const productoModelResult = await ProductoModel.findByPk(data.pro_codigo);
    return productoModelResult.dataValues;
  } else {
    return null;
  }
};

//Eliminar datos en la base de datos

const remove = async (pro_codigo) => {
  const productoModelCount = await ProductoModel.destroy({
    where: {
        pro_codigo: pro_codigo,
    },
  });

  if (productoModelCount > 0) {
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
