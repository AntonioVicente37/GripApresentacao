import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/ui/home/homeScreen.dart';
import 'package:notifydoc_b1/src/ui/login_ui/login_ui.dart';
import 'package:notifydoc_b1/src/ui/regisdoc/registdoc.dart';
import 'package:notifydoc_b1/src/ui/register_user/register_user_page.dart';


final Map <String, WidgetBuilder> route = {
  LoginUi.routeName:(context) => LoginUi(),
  RegisterUserpage.routeName:(context) => RegisterUserpage(),
  RegisterDoc.routeName:(context) =>RegisterDoc(),
  HomeScreen.routeName:(context) => HomeScreen(),
}; 