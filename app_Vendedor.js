import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 0; 
for (let index = 0; index < 51; index++) {

    var dia = Math.floor(Math.random()*(30-1 + 1)) + 1; 
    var mes = Math.floor(Math.random()*(12-1 + 1)) + 1;  
    var ano = Math.floor(Math.random()*(2005-1950 + 1)) + 1950;
    var status_cli = Math.floor(Math.random()*(1-0 + 1)) + 0; 

   const nome = faker.name.fullName(); 
   const telefone = faker.phone.number('(##) #########') // '+48 91 463 61 70
   const email = faker.internet.email(nome);
   const cep = faker.address.zipCode();
   const cpf = faker.datatype.number({ min: 11263480000 }, { max: 99999999999})
   var genero = Math.floor(Math.random()*(3-1 + 1)) + 1;
   
   if(genero == 1){
    genero = "Masculino"
    } else if(genero == 2){
    genero = "Feminino"
    }    
    else{
   genero = "transgenero"
   }



   const status = Math.floor(Math.random()*(1-0 + 1)) + 0; 
   const complemento = faker.address.streetAddress()
   const data = ano + "-" + mes + "-" + dia // 1940-08-20T08:53:07.538Z


id = id + 1;

var a = `insert into TB_VENDEDOR (id_Vendedor, Nome_Vendedor, Telefone_Vendedor, E_mail_Vendedor, CEP_Vendedor, CPF_Vendedor, Genero_Vendedor, Status_Vendedor, Complemento_Vendedor, Data_Nascimento_Vendedor)  values (${id}, "${nome}", "${telefone}", "${email}", "${cep}", "${cpf}", "${genero}", ${status}, "${complemento}", "${data}" );`;

console.log(a)


}




