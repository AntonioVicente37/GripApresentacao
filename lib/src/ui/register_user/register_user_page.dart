import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/ui/register_user/components/body.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';

class RegisterUserpage extends StatelessWidget {
  static String routeName = '/registerUser';
  const RegisterUserpage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black45,        
      ),
      body: Body(),
    );
  }
}