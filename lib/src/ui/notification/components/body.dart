import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          Text(
            "Dados do Documento com Prazo de Validade Próximo",
            style: TextStyle(fontSize: 35, color: Colors.black),
          ),
          const SizedBox(height: 30,),  
            Container(
              width: 680,
              height: 680,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 5, 9, 65),  
                borderRadius: BorderRadius.circular(70)   
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nome do documento 1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),),
                  const SizedBox(height: 50,),
                  Text("Nome do documento 1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                   const SizedBox(height: 50,),
                  Text("Nome do documento 1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                   const SizedBox(height: 50,),
                  Text("Nome do documento 1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                ],
              ),
            )
          ],
      ),
    );
  }
}   