import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key, required this.iconData, required this.press,
  });

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateSceenWidth(40),
      width: getProportionateSceenWidth(40),
      child: ElevatedButton(            
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50))
        ),
        child: Icon(
          iconData, 
          color: Colors.white,
        )
      ),
    );
  }
}
