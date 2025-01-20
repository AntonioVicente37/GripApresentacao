import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';

class CustomSurfficxIcon extends StatelessWidget {
  const CustomSurfficxIcon({
    super.key, required this.svgIcon,
  });

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateSceenHeight(20),
        getProportionateSceenWidth(20),
        getProportionateSceenWidth(20)
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionateSceenWidth(18),
      ),
    );
  }
}