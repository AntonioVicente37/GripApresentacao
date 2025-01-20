import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/ui/register_user/components/register_form_user.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: getProportionateSceenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [              
              Text(
                'Registrar-se',
                style: TextStyle(
                  fontSize: getProportionateSceenWidth(24),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                ),
              ),
              const Text(  
                'Complete os detalhes e continue \nCom o seu registro',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02,), // 7% total height
              RegisterFormUser(),
             ],
          ),
        ),
      ),
    );
  }
}
