
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/controller/db/firebase/db_firebase.dart';
import 'package:notifydoc_b1/src/models/documento.dart';

class HomController extends GetxController{
  static HomController get instance => Get.put(HomController.instance);

  final _docRepo = Get.put(FirebaseDocument());

  getDocData(String empresa){
    return _docRepo.getDocDeatils(empresa);
  }

  Future<List<Documento>> getAllDoc() async {
    return await _docRepo.getDocAll();
  }
}  