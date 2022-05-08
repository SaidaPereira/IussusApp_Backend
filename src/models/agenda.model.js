const { DataTypes } = require("sequelize");
const { sequelize } = require("../services/bd.service");

const AgendaModel = sequelize.define(
  "Agenda",
  {
    // Model attributes are defined here
    age_codigo: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    age_fecha: {
      type: DataTypes.DATE,
      allowNull: false,
    },
 
    age_codcli: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },

    age_notas: {
      type: DataTypes.STRING,
      allowNull: true,
    }
  },
  {
    tableName: "agenda",
    timestamps: false,
  }
);

module.exports = { AgendaModel };
