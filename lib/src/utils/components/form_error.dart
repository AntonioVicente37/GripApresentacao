import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    super.key, required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length, (index) => formErrorText(error: errors[index]))
    );
  }

  Row formErrorText({String? error}) {
    return Row(
        children: [
          SvgPicture.asset(
            'assets/icons/Error.svg',
            height: getProportionateSceenHeight(14),
            width: getProportionateSceenWidth(14),
          ),
          SizedBox(width: getProportionateSceenWidth(10),),
          Text(error!),
        ],
      );
  }
}
