// No contexto do Flutter, quando utilizamos o FutureBuilder, o snapshot.data nos permite acessar os dados assíncronos que foram carregados após a conclusão do Future.
//
// No exemplo do código da aula, o snapshot.data é utilizado para acessar a lista de contatos retornada pela função findAll() e atribuí-la a uma variável do tipo List<Contact>. Essa lista de contatos é então utilizada para exibir os contatos na tela por meio do ListView.builder.
//
// Em resumo, o snapshot.data nos permite acessar e utilizar os dados retornados de forma assíncrona, garantindo que a interface do usuário seja atualizada com as informações mais recentes.
//
// Espero que isso esclareça o papel do snapshot.data! Se tiver mais alguma dúvida ou quiser explorar outros aspectos, fique à vontade para perguntar.