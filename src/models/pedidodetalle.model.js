const { DataTypes } = require("sequelize");
const { sequelize } = require("../services/bd.service");
const { PedidoModel } = require("./pedido.model");
const { ProductoModel } = require("./producto.model");

const PedidodetalleModel = sequelize.define(
  "Pedidodetalle",
  {
    // Model attributes are defined here
    pedi_codigo: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    pedi_nropedi: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'pedido',
        key: 'ped_codigo',
      },
    },
    
    pedi_codpru: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'producto',
        key: 'pro_codigo',
      },
    },
    pedi_precio: {
      type: DataTypes.DECIMAL,
      allowNull: true,
    },
    pedi_cant: {
        type: DataTypes.INTEGER,
        allowNull: true,
      }
  },
  {
    tableName: "pedido_detalle",
    timestamps: false,
  }
);

PedidodetalleModel.belongsTo(PedidoModel, {foreignKey: 'pedi_nropedi'});
PedidodetalleModel.belongsTo(ProductoModel, {foreignKey: 'pedi_codpru'});

module.exports = {PedidodetalleModel};
