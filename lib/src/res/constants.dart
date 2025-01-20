import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';

const kPrimaryColor = Color.fromARGB(255, 12, 12, 12);
const kSecondaryColor = Color.fromARGB(255, 253, 253, 253);
const ktextColor = Color(0xFF757575);
const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr  = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr  = Color(0xFF121212);
const Color myVaiacao  = Color.fromARGB(255, 23, 3, 110);
const darkHeaderCLr  = Color(0xFF424242);

//Padrao para o tamanho de font maior
final headingStyle = TextStyle(
  fontSize: getProportionateSceenWidth(28),
  color: Colors.black,
  fontWeight: FontWeight.bold,
  height: 1.5
);

final TitleStyle = TextStyle(
    fontSize: getProportionateSceenWidth(14),
    fontWeight: FontWeight.w400,
    color: Colors.black
);

final SubTitleStyle = TextStyle(
    fontSize: getProportionateSceenWidth(12),
    fontWeight: FontWeight.w400,
    color: Colors.grey[600]
);

TextStyle get subHeadingStyle{
  return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey   
  );
}

TextStyle get buttonStyle{
  return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey   
  );
}

TextStyle get headingStyle1{
  return TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.white:Colors.black    
  );
}
TextStyle get titleStyle{
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode?Colors.white:Colors.black    
  );
}
TextStyle get subtitleStyle{
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode?Colors.grey[100]:Colors.grey[600]
  );
}
const double kDefaultPadding = 20.0;

// Form Errors
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "O campo e-mail encontra-se vazio";
const String kInvalidEmailError = "Por favor digite um E-mail valido";
const String kPassNullError = "O campo password encontra-se vazio";
const String kShortPassError = "Palavra passse é muito curta";
const String kMatchPassError = "Palavra passe não tem o tamanho adequado";
const String kNamelNullError = "Por favor preencha o teu nome";
const String kPhoneNumberNullError = "Por favor digite o seu numero de telefone";
const String kAddressNullError = "Por favor digite a sua morada";
