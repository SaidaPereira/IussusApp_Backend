const { UsuarioModel } = require("../models/usuario.model");
const { sequelize } = require("./bd.service");
const jwt = require("jsonwebtoken");

// Consulta en la base de datos
const list = async (query, pageStart = 1, pageLimit = 10) => {
  const usuarioModelResults = await UsuarioModel.findAll({
    order: ["usu_codigo"],
  });

  const usuariosArray = new Array();
  for (let i = 0; i < usuarioModelResults.length; i++) {
    const usuariosResult = usuarioModelResults[i];
    usuariosArray.push(usuariosResult.dataValues);
  }

  return usuariosArray;
};


// Buscar en la base de datos por codigo
const getById = async (usu_codigo) => {
  const usuarioModelResult = await UsuarioModel.findByPk(usu_codigo);

  if (usuarioModelResult) {
    return usuarioModelResult.dataValues;
  } else {
    return null;
  }
};

//Guardar datos nuevos en la base de datos
const create = async (data) => {
  const usuarioModelResult = await UsuarioModel.create(data);

  if (usuarioModelResult) {
    return usuarioModelResult.dataValues;
  } else {
    return null;
  }

  return data;
};

const login = async (data) => {
  // BUscar al usuario por el username y password
  let usuariosResult = await sequelize.query(
    `SELECT usu_codigo, usu_name,usu_email, usu_token FROM usuario WHERE usu_email = :n
                          AND usu_password = :p LIMIT 1 `,
    {
      replacements: {
        n: data.usu_email,
        p: data.usu_password,
      },
      //type:QueryTypes.SELECT
    }
  );

  usuariosResult = usuariosResult && usuariosResult[0] ? usuariosResult[0] : [];


  if (usuariosResult && usuariosResult.length > 0) {
    if (usuariosResult[0].usu_token && usuariosResult[0].usu_token != " ") {
      return {
        token: usuariosResult[0].usu_token,
        codigo : usuariosResult[0].usu_codigo,
      };
    } else {
      const payload = {
        usu_email: data.usu_email,
        usu_codigo: usuariosResult[0].usu_codigo,
      };

      var token = jwt.sign(payload, "123456");

      let updateTokenUsuarioResult = await sequelize.query(
        `UPDATE usuario SET usu_token =:t
                                              WHERE usu_codigo = :c `,
        {
          replacements: {
            t: token,
            c: usuariosResult[0].usu_codigo,
          },
          //type:QueryTypes.SELECT
        }

        
      );
      const codigo = usuariosResult[0].usu_codigo;
      return {
        token, codigo
             };
    }
  } else {
    throw new Error("Datos de usuario o password incorrectos");
  }
};



const logout = async (usuarioCodigo) => {
  let updateTokenUsuarioResult = await sequelize.query(
                            `UPDATE usuario SET usu_token = null
                             WHERE usu_codigo = :c `,
                            {
                            replacements: {
                            c :usuarioCodigo
                            },
                            //type:QueryTypes.SELECT
                            }
                            );

  
};



//Actualizar datos en la base de datos
const update = async (data) => {
  const usuarioModelCount = await UsuarioModel.update(data, {
    where: {
      usu_codigo: data.usu_codigo,
    },
  });

  if (usuarioModelCount > 0) {
    const usuarioModelResult = await UsuarioModel.findByPk(data.usu_codigo);
    return usuarioModelResult.dataValues;
  } else {
    return null;
  }
};

//Eliminar datos en la base de datos





module.exports = {
  list,
  getById,
  create,
  update,
  login,
  logout,
};
