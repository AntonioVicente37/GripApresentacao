import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/ui/login_ui/components/login_form.dart';
import 'package:notifydoc_b1/src/utils/components/no_account_text.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
       children: [      
          SizedBox(height: SizeConfig.screenHeight * 0.10,),        
        Padding(
          padding: const EdgeInsets.all(12),
          child: const Text(  
            'Bem-Vindo\nRealize o seu login e sinta-se à vontade e seguro em nosso app.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20
            ,), 
          ),
        ), 
        const SizedBox(height: 20,),       
         LoginForm(),
         const SizedBox(height: 20),  
         NoAccountText()
       ],
      ),
    );
  }
}