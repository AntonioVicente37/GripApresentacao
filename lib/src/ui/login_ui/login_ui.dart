import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';
import 'package:notifydoc_b1/src/ui/login_ui/components/body.dart';

class LoginUi extends StatelessWidget {
  static String routeName = '/login_ui';
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(      
      body: Body(),
    );
  }
}