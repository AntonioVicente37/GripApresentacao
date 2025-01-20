import 'package:get/get.dart';
import 'package:notifydoc_b1/src/controller/db/firebase/db_firebase.dart';
import 'package:notifydoc_b1/src/models/documento.dart';

class DocController extends GetxController{
  static DocController get  instance => Get.put(DocController());

  final docRep = Get.put(FirebaseDocument());


  void createDoc(Documento docus) async{
    await docRep.createDoc(docus);
    //Get.to(() => HomeScreen()); 
  }

  /* void updateDoc(Documento docus) async {
    try {
      await docRep.updateDoc(docus);
     // Get.to(() => DocumentList(empresa: docus.empresa.toString()));
    } catch (e) {
      print('Erro ao atuzalizar o documento: ${e.toString()}');
    }
  } */
}