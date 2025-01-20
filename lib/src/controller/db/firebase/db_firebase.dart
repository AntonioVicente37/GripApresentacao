
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/models/documento.dart';

class FirebaseDocument extends GetxController{
  static FirebaseDocument get instance => Get.find();

  final  _db = FirebaseFirestore.instance;

  createDoc(Documento docus) async{
    try {
    await _db.collection('documento').add(docus.fromJson());     
    Get.back();
    Get.snackbar(
      'Sucesso', 
      'O documento foi salvo com sucesso.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green
    );   
   }catch(error){  
      Get.snackbar(
        'Erro', 
        'Erro ao salvar seu documentos',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.7),
        colorText: Colors.green
      );
    } 
  }

  /* updateDoc(Documento docus) async{
    try {
      print('Atualizando documento com ID: ${docus.nome}');
    await _db.collection('documento').doc(docus.id).update(docus.toJson());
    print("O nome e o id ddo documento são ${docus.nome} - ${docus.id}");
      Get.snackbar(
        'Sucesso', 
        'Seus documentos foram atualizados com sucesso',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green
      );  
    }catch(error){
      print("Erro de agora> ${error.toString()}");
      Get.snackbar(
        'Erro', 
        'Houve um erro ao atualizar seus documentos',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.red
      );
    }
  }   */

  //Carregando os dados selecionados da empresa pelo firebase varios dados
  Future<List<Documento>> getDocDeatils(String empresa) async{
    final snapshot = await _db.collection('documento').where('empresa', isEqualTo: empresa).get();
    final docData = snapshot.docs.map((e) => Documento.fromSnapshot(e)).toList();
    return docData;
  }

  //Carregando todos os dados dos firebase   
  Future<List<Documento>> getDocAll() async{
    final snapshot = await _db.collection('documento').get();
    final docData = snapshot.docs.map((e) => Documento.fromSnapshot(e)).toList();
    return docData;
  }
}