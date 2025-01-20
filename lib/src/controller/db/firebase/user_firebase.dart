
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/models/login.dart';

class FirebaseLogin extends GetxController{
  static FirebaseLogin get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

 createUser(Users users) async{
    await _db.collection('users').add(users.fromJson()).whenComplete(() {
      Get.snackbar(
        'Sucesso', 
        'Usuário registrado com sucesso!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green
      );
    }).catchError((error, stackTrace){
      Get.snackbar(
        'Erro', 
        'Erro ao registrar o seu usuário',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white
      );
    });
  }

  updateDoc(String id, Users users) async{
    await _db.collection('users').doc(id).update(users.fromJson()).whenComplete(() {
      Get.snackbar(
        'Sucesso', 
        'Seus dados foram atualizados com sucesso',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green
      );
    }).catchError((error, stackTrace){
      Get.snackbar(
        'Erro', 
        'Houve um erro ao atualizar seus dados',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.red   
      );
    });
  }

  //Carregando os dados selecionados do usuario pelo firebase varios dados
  Future<List<Users>> getDocDeatils(String id) async{
    try {
     final snapshot = await _db.collection('users').where('id', isEqualTo: _auth.currentUser!.uid).get();            
            
      if (snapshot.docs.isEmpty) {  
        print("nenhum documento encontrado para o id: $id}"); 
        return [];                
      } 
      
      final docData = snapshot.docs.map((e) => Users.fromSnapshot(e)).toList();
      print("Meus dados do banco de dados $docData");
      return docData;

    } catch (e) {
      print('Erro ao obter dados do usuário: $e');
      return [];
    }    
  }    

    
  //Carregando todos os dados dos firebase   
  Future<List<Users>> getDocAll() async{
    final snapshot = await _db.collection('users').get();
    final docData = snapshot.docs.map((e) => Users.fromSnapshot(e)).toList();
    return docData;
  }
}