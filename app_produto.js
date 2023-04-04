import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 1; 
for (let index = 1; index < 50; index++) {


   var categoria = Math.floor(Math.random()*(20-1 + 1)) + 1; 
   var marca = Math.floor(Math.random()*(20-1 + 1)) + 1; 
   var status = Math.floor(Math.random()*(1-0 + 1)) + 0; 
   const nome = faker.commerce.product(); 
   const descricao = faker.commerce.productAdjective(nome); 
   const preco = faker.commerce.price();




id = id + 1;

var a = `insert into TB_PRODUTO (id_Produto, Status_Produto,Marca_Id_Marca,TB_CATEGORIA_idTB_CATEGORIA,Nome,Preco_unitario,Descricao)  values (${id}, ${status}, ${marca}, ${categoria}, "${nome}",${preco},"${descricao}");`;

console.log(a)


}
