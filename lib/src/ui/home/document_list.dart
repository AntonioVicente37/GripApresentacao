// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notifydoc_b1/src/models/documento.dart';
import 'package:notifydoc_b1/src/res/constants.dart';
import 'package:notifydoc_b1/src/services/home_controller.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DocumentList extends StatefulWidget {
  final String empresa;
   DocumentList({
    Key? key,
    required this.empresa,  
  }) : super(key: key);

  @override
  State<DocumentList> createState() => _DocumentListState();
}

class _DocumentListState extends State<DocumentList> {
  final controller  = Get.put(HomController());

  Future<void> _downloadAndOpenPDF(String url, String fileName) async {
    try {
      final filePath = await _downloadPDF(url, fileName);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Seu download foi concluído com sucesso: $fileName:')),
      );
      await OpenFile.open(filePath);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ocorreu um erro ao tentar baixar o PDF. $e')),
      );
    }
  }

  Future<void> _showOptionsDialog(String url) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Escolha uma Ação para o Documento'),
          content: Text('Selecione uma opção: visualizar ou baixar o documento.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SfPdfViewer.network(url),
                  ),
                );
              },
              child: Text('Visualizar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _downloadAndOpenPDF(url, 'document.pdf');
              },
              child: Text('Baixar'),
            ),
          ],
        );
      },
    );
  }

  List<Map<String, dynamic>> pdfData = [];
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: FutureBuilder<List<Documento>>(
          future: controller.getDocData(widget.empresa),
          builder: ((context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasData && snapshot.data!.isNotEmpty){
                return ListView.builder(
                itemCount: snapshot.data!.length,        
                itemBuilder: (context, index){
                //var documento = snapshot.data![index];
           return Row(
             children: [
               Container(
                padding: 
                const EdgeInsets.symmetric(horizontal: 20,),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  // width: SizeConfigsreenWidth * 0.78,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), 
                    color: const Color.fromARGB(255, 11, 68, 114),
                  ),
                  child: InkWell(
                    onTap: (){
                      //Navigator.of(context).pushNamed(EditDoc.routeName, arguments: documento);
                    },
                    child: Row(                    
                      children: [                     
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(                              
                            "${snapshot.data![index].empresa}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white                  ),
                            ),
                            const SizedBox(height: 12,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time_rounded,  
                                  color: Colors.grey[200],
                                  size: 18,
                                ),
                                SizedBox(width: 4,),
                                Text(
                                  "${snapshot.data![index].dataIsnc} - ${snapshot.data![index].dataCaduc}",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[100],  
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 12,),
                            Text(
                              "${snapshot.data![index].nome}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 60,
                          width: 0.5,
                          color: Colors.grey[200]!.withOpacity(0.7),
                        ),                       
                        Center(
                        child: InkWell(
                          onTap: (){
                            _showOptionsDialog("${snapshot.data![index].urlpath}");
                          },
                          child: const Icon(
                            Icons.picture_as_pdf, size: 80, 
                            color: Colors.white,
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                         ),
             ],
           ); 
        }              
        );
      }else if (snapshot.hasError){
        return Center(child: Center(child: Text(snapshot.error.toString()),),);
      }else{
        return const Center(child: Text("Atualmente, a empresa não tem documentos registrados.", style: TextStyle(fontSize: 15),),);
      }
      }else{
      return Center(child: CircularProgressIndicator(),);
      }           
      }         
        ),                    
        ),
      )                     
    );   
    }  
    }
 

  _addTaskBar(){
     return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [               
                Text("Informações sobre os Documentos",
                  style: headingStyle1,
                )
              ],
            ),
          ),         
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading:  GestureDetector(
        onTap: (){
          Get.back();         
        },
        child: Icon(
          Icons.arrow_back_ios,    
          color: white,      
        ),
      ),
      actions: [
       CircleAvatar(
        child: Icon(
          Icons.file_copy_outlined,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
       ),
        SizedBox(width: 20,),
      ], 
    );
  }

Future<String> _downloadPDF(String url, String fileName) async {
  try {
    // Obtenha o diretório temporário
    final dir = await getTemporaryDirectory();
    final filePath = '${dir.path}/$fileName';

    // Faça o download do arquivo
    Dio dio = Dio();
    await dio.download(url, filePath);

    return filePath;
  } catch (e) {
    throw Exception('Ocorreu um erro ao tentar baixar o PDF. $e');
  }
}