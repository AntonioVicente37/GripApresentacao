import 'package:flutter/material.dart';

 
class MenuPerfil extends StatelessWidget {
  const MenuPerfil({super.key, required this.text, required this.press});

  final String  text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            backgroundColor: Color.fromARGB(255, 5, 9, 65),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
          onPressed: press, 
          child: Row(
            children: [
             /*  Icon(
                icon,
                color: primaryClr,
              ), */
              const SizedBox(width: 20,),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                  
                )
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ], 
          )
        ),
      ),
    );
  }
}