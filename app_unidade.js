import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 0; 
for (let index = 0; index < 6; index++) {

    var dia = Math.floor(Math.random()*(30-1 + 1)) + 1; 
    var mes = Math.floor(Math.random()*(12-1 + 1)) + 1;  
    var ano = Math.floor(Math.random()*(2005-1950 + 1)) + 1950;
    var status_cli = Math.floor(Math.random()*(1-0 + 1)) + 0; 

   const nome = faker.company.name(); 
   const cep = faker.address.zipCode();
   const telefone = faker.phone.number('(##) #########') // '+48 91 463 61 70
   const email = faker.internet.email(nome);
   const status = Math.floor(Math.random()*(1-0 + 1)) + 0; 
   const complemento = faker.address.streetAddress()



id = id + 1;

var a = `insert into TB_UNIDADE (id_Unidade, Nome_Unidade, CEP_Unidade, Telefone_Unidade, Email_Unidade, Complemento_Unidade, Status_Unidade)  values (${id}, "${nome}", "${cep}", "${telefone}", "${email}", "${complemento}", ${status} );`;

console.log(a)


}

