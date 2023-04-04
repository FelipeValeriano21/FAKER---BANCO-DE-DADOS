import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 0; 
for (let index = 0; index < 1; index++) {


   const categoria = faker.commerce.department()



id = id + 1;

var a = `insert into TB_PAGAMENTO (id_Pagamento, id_Pagamento_id_Moeda,Tipo,Parcela)  values (${id}, 1, "Pix", 1 );`;

console.log(a)


}
