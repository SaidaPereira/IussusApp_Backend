const { DataTypes } = require("sequelize");
const { sequelize } = require("../services/bd.service");

const EstadoModel = sequelize.define(
  "Estado",
  {
    // Model attributes are defined here
    est_codigo: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
   est_descripcion: {
      type: DataTypes.STRING,
      allowNull: false,
    }},
    {
      tableName: "estado",
      timestamps: false,
    }
  );
  
  module.exports = { EstadoModel};
  