import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 2;
for (let index = 2; index < 500; index++) {

    var unidade = Math.floor(Math.random()*(6-1 + 1)) + 1; 
    var vendedor = Math.floor(Math.random()*(50-1 + 1)) + 1;  
    var status = Math.floor(Math.random()*(3-1 + 1)) + 1;
    var cliente = Math.floor(Math.random()*(100-1 + 1)) + 1
    var preco = Math.floor(Math.random()*(20000-135 + 1)) + 135; 
    var dia = Math.floor(Math.random()*(30-1 + 1)) + 1; 
    var mes = Math.floor(Math.random()*(12-1 + 1)) + 1;  
    var ano = Math.floor(Math.random()*(2023-2018 + 1)) + 2018;
    const data = ano + "-" + mes + "-" + dia // 1940-08-20T08:53:07.538Z


id = id + 1;

var a = `Insert into TB_PEDIDO (id_Pedido, TB_UNIDADE_id_Unidade,TB_VENDEDOR_id_Vendedor,Status_Pedido_idStatus_Pedido,TB_CLIENTE_id_Cliente,Preco_Total,Data_Pedido) values (${id},${unidade},${vendedor},${status},${cliente},${preco},"${data}");`;

console.log(a)

}


 // select TB_Pedido.id_Pedido, TB_Pedido.Preco_Total, TB_Pedido.Data_Pedido, TB_Cliente.Nome_Cliente, TB_Unidade.Nome_Unidade, TB_Vendedor.Nome_Vendedor, Status_Pedido.Situacao from TB_Pedido INNER JOIN TB_Cliente ON TB_Cliente.id_Cliente = TB_Pedido.TB_CLIENTE_id_Cliente INNER JOIN TB_Vendedor ON TB_Vendedor.id_Vendedor = TB_Pedido.TB_VENDEDOR_id_Vendedor INNER JOIN TB_Unidade ON TB_Unidade.id_Unidade = TB_UNIDADE_id_Unidade INNER JOIN Status_Pedido ON Status_Pedido.idStatus_Pedido = TB_Pedido.Status_Pedido_idStatus_Pedido where TB_Pedido.id_Pedido = 368;


