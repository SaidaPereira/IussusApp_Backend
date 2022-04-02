const { DataTypes } = require("sequelize");
const { sequelize } = require("../services/bd.service");

const ClienteModel = sequelize.define(
  "Cliente",
  {
    // Model attributes are defined here
    cli_codigo: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    cli_nombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },

    cli_apellido: {
      type: DataTypes.STRING,
      allowNull: false,
    },

    cli_ruci: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    cli_direccion: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    cli_telefono: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    cli_correo: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    cli_notas: {
      type: DataTypes.STRING,
      allowNull: true,
    }
  },
  {
    tableName: "cliente",
    timestamps: false,
  }
);

module.exports = { ClienteModel };
