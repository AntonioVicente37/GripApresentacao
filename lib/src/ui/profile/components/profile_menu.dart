import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/res/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key, required this.text, required this.icon, required this.press,
  });

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          backgroundColor:  Color.fromARGB(255, 5, 9, 65),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        onPressed: press, 
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              color: kSecondaryColor,
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Text(                
                text,
                style: TextStyle(color: kSecondaryColor), 
              ),
            ),
          ],
        )
      ),
    );
  }
}