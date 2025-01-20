import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/res/constants.dart';
import 'package:notifydoc_b1/src/utils/components/default_button.dart';
import 'package:notifydoc_b1/src/utils/components/form_error.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  bool isPasswordVisible = false;

  void _loginUser() async {  
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim());          
      //Get.back();
      Get.snackbar(
      'Sucesso', 
      'Login realizado com sucesso! Bem-vindo ao nosso aplicativo.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
      duration: Duration(seconds: 2),
      );  
    } catch (e) {
    Get.snackbar(
      'Erro', 
      'Falha no login. Por favor, confirme seu e-mail e senha e tente novamente.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.1),
      colorText: Colors.red,
      duration: Duration(seconds: 3),
    );
      print('Erro: $e');
    }
  }

  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateSceenHeight(20)),
        child: Column(children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateSceenHeight(20),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateSceenHeight(20),
          ),        
          FormError(
            errors: errors,
          ),
          SizedBox(
            height: getProportionateSceenHeight(3),
          ),
          DefaultButton(
          text: 'Entrar',
          press: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              _loginUser();              
            }
          })
        ]),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordTextEditingController,
      obscureText: !isPasswordVisible,
      onSaved: (newValue) => passwordTextEditingController.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return '';
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Palavra passe',
          hintText: 'Digite a tua palavra passe',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
          iconSize: 45,
          icon: Icon(            
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
        ),      
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailTextEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => emailTextEditingController.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return '';
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return '';
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: 'E-mail',
          hintText: 'Digite o teu email',
          floatingLabelBehavior: FloatingLabelBehavior.always,          
          suffixIcon: Icon(            
            size: 50,
            Icons.email
          ))
    );
  }
}
