// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  dynamic id;  
  String? nome;
  String? email;
  String? senha;

  Users({
    this.id,
    this.nome,
    this.email,
    this.senha,
  });

  fromJson(){
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory Users.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Users(
    id: data['id'],
    nome:  data['nome'],
    email: data['email'], 
    senha:  data['senha'],     
    );
  }
}

