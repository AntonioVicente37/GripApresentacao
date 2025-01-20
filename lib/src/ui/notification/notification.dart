import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/ui/notification/components/body.dart';
import 'package:notifydoc_b1/src/utils/components/rounded_icon_btn.dart';

class NotificaPage extends StatelessWidget {
  static String routeName = '/notificatio';
  const NotificaPage({super.key});
  
  @override
  Widget build(BuildContext context) {    
    return Scaffold(      
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("Notificação", style: TextStyle(color: Colors.white),)),
         leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: RoundedIconBtn(
            iconData: Icons.arrow_back_ios, 
            press: () => Navigator.pop(context),
          ),
      ),
      ),
      body: Body(),
    );
  }
}  