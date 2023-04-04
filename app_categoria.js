import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 0; 
for (let index = 0; index < 20; index++) {


   const categoria = faker.commerce.department()



id = id + 1;



var a = `insert into TB_Categoria (idTB_CATEGORIA, Nome_Categoria)  values (${id}, "${categoria}");`;

console.log(a)


}
