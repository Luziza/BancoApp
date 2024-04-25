import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/contact.dart';

Future<Database> createDatabase(){
    return getDatabasesPath().then((dbPath){
    //criou o caminho do banco
    final String path = join(dbPath, 'banco.db');
    return openDatabase(path, onCreate: (db, version){
      //criou a tabela dele no banco de dados
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY,'
          'nome TEXT,'
          'numero INTEGER)');
    }, version: 1);
  });
}

Future<int> Save(Contact contact){
  return createDatabase().then((db){
    //criar um mapa com as informações para depois inserir na tabela contacts
    final Map<String, dynamic> contactMap = Map();
    contactMap['nome'] = contact.nome;
    contactMap['numero'] = contact.numero;
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll(){
  //Vai ter acesso ao db
  return createDatabase().then((db){
    //vai pegar todos os dados dessa tabela
    return db.query('contacts').then((maps){
      //pega cada mapa e converte para o contato, cria a lista e insere as informações do mapa dentro
      final List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps){
        final Contact contact = Contact(map['id'], map['nome'], map['numero']);
        contacts.add(contact);
      }
      return contacts;
    });
  });
}