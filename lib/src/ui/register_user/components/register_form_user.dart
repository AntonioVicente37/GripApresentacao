import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notifydoc_b1/src/models/login.dart';
import 'package:notifydoc_b1/src/res/constants.dart';
import 'package:notifydoc_b1/src/services/user_controller.dart';
import 'package:notifydoc_b1/src/utils/components/default_button.dart';
import 'package:notifydoc_b1/src/utils/size_config.dart';


class RegisterFormUser extends StatefulWidget {
  const RegisterFormUser({super.key});

  @override
  State<RegisterFormUser> createState() => _RegisterFormUserFormState();
}

class _RegisterFormUserFormState extends State<RegisterFormUser> {
  final  nomeTextEditingController = TextEditingController();
  final  emailTextEditingController = TextEditingController();
  final  passwordTextEditingController = TextEditingController();
  final auth = FirebaseAuth.instance; 
  bool isPasswordVisible = false;

  void _registerUser(BuildContext context) async{
   try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword( 
        email: emailTextEditingController.text.trim(), 
        password: passwordTextEditingController.text.trim());
        final user = Users(
          nome: nomeTextEditingController.text,
          email: emailTextEditingController.text,
          senha: passwordTextEditingController.text,   
          id: auth.currentUser!.uid,
        );
        UserController.instance.createUser(user);               
   }catch(e){
      print(e);
   }
  }

  final _formKey = GlobalKey<FormState>();
  String? nome;
  String? email;
  String? password;
  String? confirm_password;
  final List<String> errors = [];

  
  void addError({String? error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}){
    if(errors.contains(error)){
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNomeFormField(),
          SizedBox(height: getProportionateSceenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateSceenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateSceenHeight(30)),
          buildConfPasswordFormField(),
          //FormError(errors: errors),
          SizedBox(height: getProportionateSceenHeight(30)),
          DefaultButton(
            text: 'Registrar-se', 
            press: (){
              if(_formKey.currentState!.validate()){
              _registerUser(context);                            
              }
            }
          )
      ],
      ),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
        obscureText: !isPasswordVisible,
        onSaved: (newValue) => confirm_password = newValue!,
        onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kMatchPassError);
        }else if(value.isNotEmpty && password == confirm_password){
          removeError(error: kMatchPassError);
        }
        return;
      },
        validator: (value){
        if(value!.isEmpty){
            addError(error: kPassNullError);
          return '';
        }else if(password != value){ 
            addError(error: kMatchPassError);
          return '';
        }
        return null;
      },
        decoration: InputDecoration(
          labelText: 'Confirmar Senha',
          hintText: 'Digite sua senha novamente',
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordTextEditingController,
        obscureText: !isPasswordVisible,
        onSaved: (newValue) => password = newValue!,
        onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kPassNullError);
        }else if(value.length < 8){
          removeError(error: kShortPassError);
        }
        password = value;
        return;
      },
        validator: (value){
        if(value!.isEmpty){
           addError(error: kPassNullError);
          return '';
        }else if(value.length < 8){
           addError(error: kShortPassError);
          return '';
        }
        return null;
      },
        decoration: InputDecoration(
          labelText: 'Senha',
          hintText: 'Digite sua senha',
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
      onSaved: (newValue) => email = newValue!,
       onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kEmailNullError);
        }else if(emailValidatorRegExp.hasMatch(value)){
          removeError(error: kInvalidEmailError); 
        }
        return;
      },
      validator: (value){
        if(value!.isEmpty){
          addError(error: kEmailNullError);
          return '';
        }else if(!emailValidatorRegExp.hasMatch(value)){
          addError(error: kInvalidEmailError);
          return '';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'E-mail',
        hintText: 'Digite seu e-mail',
        floatingLabelBehavior: FloatingLabelBehavior.always,   
        suffixIcon: Icon(
          size: 50,
          Icons.email
        )             
    ),
    );
  }
  
  TextFormField buildNomeFormField() {
    return TextFormField(   
      controller: nomeTextEditingController,  
      onSaved: (newValue) => nome = newValue!,
       onChanged: (value){
        if(value.isNotEmpty){
          removeError(error: kNamelNullError);
        }
        return;
      },
      validator: (value){
        if(value!.isEmpty){
          addError(error: kNamelNullError);
          return '';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Nome',
        hintText:  'Digite seu nome',
        floatingLabelBehavior: FloatingLabelBehavior.always,   
        suffixIcon: Icon(
          size: 50,
          Icons.person
        )             
    ),
    );
  }
}