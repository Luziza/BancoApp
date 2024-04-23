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
    contactMap['id'] = contact.id;
    contactMap['nome'] = contact.nome;
    contactMap['numero'] = contact.numero;
    return db.insert('contacts', contactMap);
  });
}