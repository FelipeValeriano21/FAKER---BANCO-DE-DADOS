import { faker } from '@faker-js/faker';

faker.setLocale('pt_BR');;
 

    var id = 0; 
for (let index = 0; index < 101; index++) {

    var dia = Math.floor(Math.random()*(30-1 + 1)) + 1; 
    var mes = Math.floor(Math.random()*(12-1 + 1)) + 1;  
    var ano = Math.floor(Math.random()*(2005-1950 + 1)) + 1950;
    var status_cli = Math.floor(Math.random()*(1-0 + 1)) + 0; 

   const nome = faker.name.fullName(); 
   const telefone = faker.phone.number('(##) #########') // '+48 91 463 61 70
   const email = faker.internet.email(nome);
   const cep = faker.address.zipCode();
   const data = ano + "-" + mes + "-" + dia // 1940-08-20T08:53:07.538Z
   const cpf = faker.datatype.number({ min: 11263480000 }, { max: 99999999999})
   const status = Math.floor(Math.random()*(1-0 + 1)) + 0; 
   const complemento = faker.address.streetAddress()
 

  const cliente = {
    nome, 
    telefone, 
    email, 
    cep, 
    data, 
    cpf, 
    status, 
    complemento, 
}

id = id + 1;

var a = `insert into TB_cliente (id_Cliente, Nome_Cliente, Telefone_Cliente, E_mail_Cliente, CEP_Cliente, Data_Nasc_Cliente, CPF_Cliente, Status_Cliente, Complemento_CLiente)  values (${id}, "${nome}", "${telefone}", "${email}", "${cep}", "${data}", "${cpf}",${status}, "${complemento}" );`;

console.log(a)


}




