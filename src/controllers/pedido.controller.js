const pedidoService = require("../services/pedido.service");



const create = async (req, res) => {
  const pedido = await pedidoService.create(req.body);
  res.status(202).send({ success: true, pedido });
};

const getById = async (req, res) => {
    const pedido = await pedidoService.getById(req.params.id);
  
    let jsonResultado = req.query;
    jsonResultado["success"] = true;
    jsonResultado["pedido"] = pedido;
  
    res.status(201).send(jsonResultado);
  };

  const get = async (req, res) => {
    const pedido = await pedidoService.get();
  console.log(pedido)
    let jsonResultado = req.query;
    jsonResultado["success"] = true;
    jsonResultado["pedido"] = pedido;
  
    res.status(201).send({success:true,
    pedido:pedido});
  };
  
 

  const updateEstado = async (req, res) => {
    try{
      let estado = req.body;
      let pedido= await pedidoService.updateEstado(estado);
      res.status(202).send({ success: true, pedido });
    }catch(error){
      res.status(400).send({ success: false, pedido: error.message });
    }
    
    
  };


  const remove = async (req, res) => {
    try{
    const booleanValue = await pedidoService.remove(req.params.id);
    res.status(202).send({ success: booleanValue });
  }catch(error){
    res.status(400).send({ success: false, res: error.message });
  }
  };

module.exports = {
  
  create,
  getById,
  get,
  remove,
  updateEstado
 
};
