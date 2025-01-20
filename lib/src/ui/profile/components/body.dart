import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/services/user_controller.dart';
import 'package:notifydoc_b1/src/ui/login_ui/login_ui.dart';
import 'package:notifydoc_b1/src/ui/profile/components/profile_menu.dart';
import 'package:notifydoc_b1/src/ui/profile/components/profile_pic.dart';

class Body extends StatelessWidget {  
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final UserOnly = Get.put(UserController()); 
      return FutureBuilder(
        future: UserOnly.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final user = snapshot.data!;            
        return Column(
          children: [  
            const SizedBox(height: 12,),
            ProfilePic(),
            SizedBox(height: 20,),
            ProfileMenu(
              icon: 'assets/icons/User Icon.svg',
              text: user.nome!,
              press: (){},
            ),
            ProfileMenu(
              icon: 'assets/icons/Mail.svg',
              text: user.email!,
              press: (){},
            ),
            ProfileMenu(
              icon: 'assets/icons/Settings.svg',
              text: "**********************",
              press: (){},
            ),
            ProfileMenu(
              icon: 'assets/icons/Log out.svg',
              text: 'Log Out',
              press: (){
                signOut();
              }, 
            )
          ],
        ); 
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error.toString()}'));
        } else if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        } else{          
          return Center(child: Text('Nenhuma informação encontrada.'));
        }   
      }
      );
    }
 }

Future<void> signOut() async {
await FirebaseAuth.instance.signOut();  
Get.to(LoginUi());
}