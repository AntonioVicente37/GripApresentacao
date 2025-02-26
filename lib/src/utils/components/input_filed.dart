import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/res/constants.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({super.key, required this.title, required this.hint, this.controller, this.widget, });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),  
          Container(
              height: 52,
              margin: const EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: (){},                      
                      controller: controller,
                      readOnly: widget==null?false:true,
                      autofocus: false,
                      cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                      style: subtitleStyle,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: subtitleStyle,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            ///color: context.theme.backgroundColor,
                            width: 0
                          )
                        )
                      ),
                    )
                  ),
                  widget==null?Container():Container(child: widget,)
                ]
              ),
            )
        ],
      ),
    );
  }
} 