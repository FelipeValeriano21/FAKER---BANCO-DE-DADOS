import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 0; 
for (let index = 1; index < 80; index++) {


   const moeda = Math.floor(Math.random()*(3-1 + 1)) + 1;
   const pagamento = Math.floor(Math.random()*(3-1 + 1)) + 1;
   const nota = Math.floor(Math.random()*(100-1 + 1)) + 1;
   const valor = faker.commerce.price(); 

   var dia = Math.floor(Math.random()*(30-1 + 1)) + 1; 
   var mes = Math.floor(Math.random()*(12-1 + 1)) + 1;  
   var ano = Math.floor(Math.random()*(2023-2018 + 1)) + 2018;

   const data = ano + "-" + mes + "-" + dia // 1940-08-20T08:53:07.538Z






id = id + 1;



var a = `insert into TB_CAIXA (id_Caixa, TB_PAGAMENTO_TB_MOEDA_id_Moeda,TB_PAGAMENTO_id_Pagamento,TB_NOTAFISCAL_id_NotaFiscal,Valor_Total,Date)  values (${id}, 1, ${pagamento}, ${nota}, ${valor}, "${data}");`;

console.log(a)


}
