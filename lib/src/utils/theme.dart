import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme(){
   return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
   );
}

AppBarTheme appBarTheme(){
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,

  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      //If you are using latest version of flutter then label text and hin text show like this 
      //if you r using flutter less then 1.20.* then maybe this is not working properly
      // if we are define or floatingLabelBehavior in ou theme then it´s not applayed
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: 
        const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder:outlineInputBorder,
      border: outlineInputBorder,
  );
}

