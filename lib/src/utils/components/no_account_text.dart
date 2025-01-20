
import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/res/constants.dart';
import 'package:notifydoc_b1/src/ui/register_user/register_user_page.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ainda não tens uma conta? ',
          style: TextStyle(
            fontSize: 18,
            color: kPrimaryColor
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, RegisterUserpage.routeName),
          child: Text(
            'Registrar-se',
            style: TextStyle(
              fontSize: 18,
              color:Colors.black38,
            ),
          ),
        )
      ],
    );
  }
}