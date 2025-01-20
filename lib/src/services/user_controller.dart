import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/controller/db/firebase/user_firebase.dart';
import 'package:notifydoc_b1/src/models/login.dart';
import 'package:notifydoc_b1/src/ui/login_ui/login_ui.dart';

class UserController extends GetxController{
  static UserController get  instance => Get.put(UserController());

  final docRep = Get.put(FirebaseLogin());


  void createUser(Users users) async{
    await docRep.createUser(users);
    Get.to(() => const LoginUi()); 
  }

  Future<List<Users>> getOnlyUser(Users users) async{    
    return await docRep.getDocDeatils(users.id);   
    
  } 
   
  Future<Users?> getUserData() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final users = await docRep.getDocDeatils(user.uid);
    return users.isNotEmpty ? users.first : null;
    }
    return null;
  }  
} 