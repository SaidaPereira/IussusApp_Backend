const { DataTypes } = require("sequelize");
const { sequelize } = require("../services/bd.service");

const ProductoModel = sequelize.define(
  "Producto",
  {
    // Model attributes are defined here
    pro_codigo: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    pro_descripcion: {
      type: DataTypes.STRING,
      allowNull: false,
    },

    pro_costo: {
      type: DataTypes.DECIMAL,
      allowNull: true,
    },

    pro_precio: {
    type: DataTypes.DECIMAL,
      allowNull: true,
    },
    pro_unimed: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    
    pro_obse: {
      type: DataTypes.STRING,
      allowNull: true,
    }
  },
  {
    tableName: "producto",
    timestamps: false,
  }
);

module.exports = {ProductoModel };
