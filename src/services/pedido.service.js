
const { PedidoModel } = require("../models/pedido.model");
const { sequelize } = require("./bd.service");
const { QueryTypes } = require("sequelize");
const { update } = require("./usuario.service");
const { PedidodetalleModel } = require("../models/pedidodetalle.model");



//Guardar datos nuevos en la base de datos
const create = async (pedido) => {

    
  const det = pedido.detalles;
  const trans = await sequelize.transaction();

  try{
      let result = await sequelize.query(

        `INSERT INTO public.pedido(
                ped_fecha,
                ped_codcli,
                ped_codest,
                ped_obse,
                ped_total
        ) VALUES (
            :fecha,
            :clienteCod,
            :estadoCod,
            :obse,
            :total
        ) returning ped_codigo AS pedidoId;
        `,{
            replacements:{
                fecha : pedido.fecha,
                clienteCod : pedido.clienteCod,
                estadoCod: pedido.estadoCod,
                obse : pedido.obse,
                total:pedido.total,
            },
            transaction : trans

        });
        console.log(result)

        for(let i=0 ; i < det.length; i++){
            const e = det[i];
            await sequelize.query(
                `INSERT INTO public.pedido_detalle(
                    pedi_nropedi,
                    pedi_codprodu,
                    pedi_precio,
                    pedi_cant
            ) VALUES (
                :pedidoId,
                :pedidoCod,
                :precio,
                :cant
            ) ;`,
            {
                replacements:{
                    pedidoId : result[0][0].pedidoid,
                    pedidoCod : e.productoCod,
                    precio: e.precio,
                    cant: e.cant
                },
                transaction : trans


            });
        }



  }catch(error){
      trans.rollback();
      throw(error)
  }

  trans.commit();
  return true;

}

const getById = async (ped_codigo) => {
    const pedidoModelResult = await PedidoModel.findByPk(ped_codigo);
  
    if (pedidoModelResult) {
      return pedidoModelResult.dataValues;
    } else {
      return null;
    }
  };

  const get = async () => {
    let sql=`select p.*,concat(c.cli_nombre,' ',c.cli_apellido) as nombre, 
              c.cli_direccion as direccion 
              ,st.est_descripcion as estado 
              from pedido as p 
              inner join cliente as c
              on c.cli_codigo = ped_codcli
              inner join estado as st on st.est_codigo=p.ped_codest;             
    `;
    const pedidoModelResult = await sequelize.query(sql);
    if (pedidoModelResult) {
      return pedidoModelResult[0]
    } else {
      return null;
    }
  };


  const updateEstado = async (pedido) => {
    let result = await sequelize.query(
      `UPDATE pedido set ped_codest=:est 
      WHERE ped_codigo=:id `, {
        replacements:{
          id: pedido.id,
          est: pedido.est,
        },

      });
      console.log(result)

      
      return true;

  }


  const remove = async (ped_codigo) => {
    const pedidoModelCount = await PedidoModel.destroy({
      where: {
        ped_codigo: ped_codigo,
      },
    });
  
    if (pedidoModelCount > 0) {
      return true;
    } else {
      return false;
    }
  };


module.exports = {
  create,
  getById,
  get,
remove,
updateEstado
 
};
