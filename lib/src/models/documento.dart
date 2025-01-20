import 'package:cloud_firestore/cloud_firestore.dart';

class Documento {
  dynamic id;  
  int? estaAtualizado;
  String? nome;
  String? empresa;
  String? descricao;  
  String? dataIsnc;
  String? dataCaduc;
  String? ficheiro;
  String? urlpath;
  String? endTime;
  
  Documento({
    this.id,
    this.nome,
    this.empresa,
    this.descricao,
    this.dataIsnc,
    this.dataCaduc,
    this.ficheiro,
    this.urlpath,
    this.endTime,
    this.estaAtualizado,
  });

  get color => null;

  fromJson(){
    return {
      'nome': nome,
      'empresa': empresa,
      'descricao': descricao,
      'dataisnc': dataIsnc,
      'datacaduc': dataCaduc,
      'ficheiro': ficheiro,
      'urlpath': urlpath,
      'endTime': endTime,
      'estaAtualizado': estaAtualizado,
    };
  }

    Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'empresa': empresa,
      'descricao': descricao,
      'dataisnc': dataIsnc,
      'datacaduc': dataCaduc,
      'ficheiro': ficheiro,
      'urlpath': urlpath,
      'endTime': endTime,
      'estaAtualizado': estaAtualizado,
    };
  }

  factory Documento.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Documento(
    id: document.id,
    nome:  data['nome'],
    empresa: data['empresa'], 
    descricao:  data['descricao'], 
    dataIsnc:  data['dataisnc'] ,
    dataCaduc:  data['datacaduc'] ,
    ficheiro:  data['ficheiro'] ,
    urlpath:  data['urlpath'] ,
    endTime:  data['endTime'] ,
    estaAtualizado:  data['estaAtualizado']
    );
  }
}
