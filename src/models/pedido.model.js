const { DataTypes } = require("sequelize");
const { sequelize } = require("../services/bd.service");
const { ClienteModel } = require("./cliente.model");
const { EstadoModel } = require("./estado.model");

const PedidoModel = sequelize.define(
  "Pedido",
  {
    // Model attributes are defined here
    ped_codigo: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    ped_fecha: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    ped_codest: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: 'estado',
          key: 'est_codigo',
        },
      },

    ped_codcli: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'cliente',
        key: 'cli_codigo',
      },
    },

    ped_obse: {
    type: DataTypes.STRING,
      allowNull: true,
    },

    ped_total: {
      type: DataTypes.DECIMAL,
      allowNull: true,
    }
  },
  {
    tableName: "pedido",
    timestamps: false,
  }
);

PedidoModel.belongsTo(ClienteModel, {foreignKey: 'ped_codcli'});
PedidoModel.belongsTo(EstadoModel, {foreignKey: 'ped_codest'});

module.exports = {PedidoModel};
