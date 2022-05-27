const {DataTypes} = require('sequelize');
const {sequelize} = require('../services/bd.service');

const UsuarioModel = sequelize.define('Usuario', {
  // Model attributes are defined here
  usu_codigo: {
    autoIncrement: true,
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
  },
  usu_email: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  usu_password: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  usu_name: {
    type: DataTypes.STRING(35),
    allowNull: false,
  },
  usu_img: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  usu_telefono: {
    type: DataTypes.STRING,
    allowNull: false,
  }
}, {
  tableName: 'usuario',
  timestamps: false,
});

module.exports = {
  UsuarioModel,
};