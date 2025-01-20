import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/ui/profile/components/body.dart';
import 'package:notifydoc_b1/src/utils/components/rounded_icon_btn.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('Perfil', style: TextStyle(color: Colors.white),),),
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
