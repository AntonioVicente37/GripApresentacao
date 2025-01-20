
import 'package:notifydoc_b1/src/res/constants.dart';
import 'package:notifydoc_b1/src/ui/home/document_list.dart';
import 'package:notifydoc_b1/src/ui/login_ui/login_ui.dart';
import 'package:notifydoc_b1/src/ui/profile/profile_screen.dart';
import 'package:notifydoc_b1/src/ui/regisdoc/registdoc.dart';
import 'package:notifydoc_b1/src/utils/components/button_add.dart';
import 'package:notifydoc_b1/src/utils/components/menu_perfil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  DateTime _seleDate = DateTime.now();
  HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
      //backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [    
           _addTaskBar(),
           // ignore: avoid_unnecessary_containers
          const SizedBox(height: 10,),            
          MenuPerfil(text: 'Quantos Quatus, LDA',  press:  (){Get.to(DocumentList(empresa: 'Quantos Quatus, LDA',));}),
          MenuPerfil(text: 'Empresa AEXE, LDA',    press:  (){Get.to(DocumentList(empresa: 'Empresa AEXE, LDA')); }),            
          MenuPerfil(text: 'AV - Empresa, LDA',    press:  (){Get.to(DocumentList(empresa: 'AV - Empresa, LDA',));}),
          MenuPerfil(text: 'AV - Farma, LDA',      press:  (){Get.to(DocumentList(empresa: 'AV - Farma, LDA',));}),
          MenuPerfil(text: 'Siah Zaura, LDA',      press:  (){Get.to(DocumentList(empresa: 'Siah Zaura, LDA',));}),
          MenuPerfil(text: 'Kwanssul, LDA',        press:  (){Get.to(DocumentList(empresa: 'Kwanssul, LDA',)); }),
          MenuPerfil(text: 'Vellar, LDA',          press:  (){Get.to(DocumentList(empresa: 'Vellar, LDA',));}),
          MenuPerfil(text: 'Sadoce, LDA',          press:  (){Get.to(DocumentList(empresa: 'Sadoce, LDA',));}),
          MenuPerfil(text: 'Deellos, LDA',         press:  (){Get.to(DocumentList(empresa: 'Deellos, LDA',));}),       
          MenuPerfil(text: 'Lankatel, LDA',        press:  (){Get.to(DocumentList(empresa: 'Lankatel, LDA',));}),
          MenuPerfil(text: 'Cerpesca, LDA',        press:  (){Get.to(DocumentList(empresa: 'Cerpesca, LDA',));}),
          MenuPerfil(text: 'Gestreito, LDA',       press:  (){Get.to(DocumentList(empresa: 'Gestreito, LDA',));}),
          ],
        ),
      ),
    );     
  }
}


  _addTaskBar(){
  return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd('pt_BR').format(DateTime.now()),
                  style: buttonStyle, 
                ),
                Text("Documentos",
                  style: headingStyle1,
                ),
              ],
            ),
          ),
          MyButton(label: "+ Cadastrar", onTap: (){
            Get.to(RegisterDoc());           
          },cor: Colors.black,)
        ],
      ),
    );
  }

  _appBar() {
    Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
     Get.to(() => const LoginUi());
    }
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading:  GestureDetector(
        onTap: (){
          signOut();         
        },
        child: const Icon(
          Icons.logout,
          color: Colors.white,          
        ),
      ),
      actions: [
       GestureDetector(
        onTap: (){
          Get.to(() => const ProfileScreen());
        },
         child: CircleAvatar(
          backgroundImage: AssetImage(
            "assets/images/user_icon.png", 
          ),                
         ),
       ),
        SizedBox(width: 20,)
      ],  
    );
  }
