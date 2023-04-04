import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 0; 
for (let index = 0; index < 100; index++) {

    var ida = Math.floor(Math.random()*(350-1 + 1)) + 1; 
    
id = id + 1;


var a = `insert into TB_NOTAFISCAL (id_NotaFiscal, TB_PEDIDO_id_Pedido)  values (${id}, "${ida}");`;

console.log(a)


}

