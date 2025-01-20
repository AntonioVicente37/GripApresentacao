import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.text, required this.press,
  });

  final String text;
  final GestureTapCallback press;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateSceenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateSceenWidth(18),
              color: Colors.black
            ),
          ),
          GestureDetector(
            onTap: press,
            child: const Text('See More')
          ),
        ],
      ),
    );
  }
}