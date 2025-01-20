import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifydoc_b1/src/res/constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        // overflow: overflow.visible,
        children: [
          CircleAvatar(
          backgroundColor: kSecondaryColor,   
           child: Icon(
            Icons.person,
            size: 90, 
            color: kPrimaryColor,           
           ),
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: ElevatedButton(                    
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white)
                  )                      
                ),                    
                onPressed: (){}, 
                child: SvgPicture.asset('assets/icons/Camera Icon.svg')
              ),
            ),
          )
        ],
      ),
    );
  }
}