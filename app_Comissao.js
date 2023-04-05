import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 51; 
for (let index = 51; index < 79; index++) {

    var taxa = Math.floor((Math.random()*(15-10 + 1)) + 10)/100; 





id = id + 1;

var a = ` INSERT into TB_COMISSAO (id_Comissao, TB_CAIXA_id_Caixa, Taxa)  values (${id}, ${id},  ${taxa});`;

var b = `UPDATE TB_Comissao 
INNER JOIN TB_Caixa ON TB_Caixa.id_Caixa = TB_Comissao.TB_CAIXA_id_Caixa 
SET TB_Comissao.Valor_Comissao = TB_Comissao.Taxa * TB_Caixa.Valor_Total where  TB_Comissao.TB_CAIXA_id_Caixa = ${id}   ; `


console.log(a)
console.log(b)


}