
import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/res/constants.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key, required this.text, required this.press,
  });
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,      
      child: ElevatedButton(        
        onPressed: (){
          press();
        },  
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white
          ),
        ),        
      ),
    );
  }
}