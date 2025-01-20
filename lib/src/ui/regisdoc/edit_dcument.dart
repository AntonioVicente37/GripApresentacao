
import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:notifydoc_b1/src/models/documento.dart';
import 'package:notifydoc_b1/src/res/constants.dart';
import 'package:notifydoc_b1/src/utils/components/button_add.dart';
import 'package:notifydoc_b1/src/utils/components/input_filed.dart';

class EditDoc extends StatefulWidget {
  static String routeName = '/edit_doc';
  const EditDoc({super.key,});

  @override
  State<EditDoc> createState() => _EditDocPageState();
}

class _EditDocPageState extends State<EditDoc> {
  Documento? documento;  
   //inicializando o nosso task controller
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  //arquivos cima relacionados com o envio do arquivo no firestore
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _fileController = TextEditingController();
  final TextEditingController _descController = TextEditingController(); 
  DateTime _intoDate =  DateTime.now();
  DateTime _endDate = DateTime.now(); 
  String _endTime = "09:30 PM";
  String _selecteName = "None";
  bool isButtonActive = true;
  List<String> NameList = [
   "Alvara Comercial",
   "Agência Reguladora de Medicamentos",
   "Certificado de Habitabilidade",
   "Diário da República",
   "Estatuto da Sociedade",
   "Licença de Publicidade",
   "Licença Para  o exercício da actividade ",
   "Declaração Industrial - Alvará Industial",
   "Pacto Social- Sociedade por Quota",
   "Parecer Tecnico",
   "Guiché  Único",
   "certificado de Admissibilidade",
   "Numero de Identificação Fisca- NIF",
   "Memória Descritiva",
   "Segurança Social",
   "Certidão Comercial",
   "Croquis de Localização",
   "Planta do Esquema Electrico"
  ];
  String _selecteEmpresa = "None";
  List<String> EmpresaList = [
   "Empresa AEXE, LDA",
   "Vellar, LDA",
   "Quantos Quatus, LDA",
   "Deellos, LDA",
   "Sadoce, LDA",
   "AV - Empresa, LDA",
   "AV - Farma, LDA",
   "AV - Optica, LDA",
   "Lankatel, LDA",   
   "Kwanssul, LDA",   
   "Cerpesca, LDA",   
   "Gestreito, LDA",
   "Siah Zaura, LDA"
  ];
  //int _selectedColor=0;
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Documento? doc = ModalRoute.of(context)!.settings.arguments as Documento?;
    if (doc != null && documento == null) {
      setState(() {
        documento = doc;
        _initializeFields();
      });
    }
  }
  
  void _initializeFields() {
    if (documento != null) {
      _nomeController.text = "${documento!.nome}";
      _fileController.text = "${documento!.urlpath}";
      _descController.text = "${documento!.descricao}";
      _intoDate = DateFormat("dd/MM/yyyy").parse("${documento!.dataIsnc}");
      _endDate = DateFormat("dd/MM/yyyy").parse("${documento!.dataCaduc}");
      _endTime = "${documento!.endTime}";
      _selecteName = "${documento!.nome}";
      _selecteEmpresa = "${documento!.empresa}"; 
    }   
  }
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      //backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Alterar Documento",
                style: headingStyle1,
              ),
              MyInputField(title: "Empresa", hint: _selecteEmpresa, 
              widget: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
                iconSize: 32,
                elevation: 4,
                style: subtitleStyle,
                underline: Container(height: 0,),
                items: EmpresaList.map<DropdownMenuItem<String>>((String? value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value!, style: const TextStyle(color: Colors.grey),)
                  );
                }).toList(), 
                onChanged: (String? newValue){
                  setState(() {
                    _selecteEmpresa = newValue!;
                  });
                }
              ),
             ),
              MyInputField(title: "Nome", hint: _selecteName, controller: _nomeController,
              widget: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
                iconSize: 32,
                elevation: 4,
                style: subtitleStyle,
                underline: Container(height: 0,),
                items: NameList.map<DropdownMenuItem<String>>((String? value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value!, style: const TextStyle(color: Colors.grey),)
                  );
                }).toList(), 
                onChanged: (String? newValue){
                  setState(() {
                    _selecteName = newValue!;
                  });
                }
              ),
             ),
             MyInputField(title: "Descrição", hint: "Enter your note", controller: _descController,),            
              Row(
              children: [
                Expanded(
                  child: MyInputField(title: "Data Inscrição", hint: DateFormat("dd/MM/yyyy").format(_intoDate), 
                  widget: IconButton(
                    icon: const Icon(Icons.calendar_today_outlined,
                    color: Colors.grey,
                    ),
                    onPressed: (){ 
                      print("Inscricao");
                      _getDateInscr();
                  },
              ),
             ),
            ),
            const SizedBox(width: 12,),
            Expanded(
              child:MyInputField(title: "Data caducidade", hint: DateFormat("dd/MM/yyyy").format(_endDate),
                  widget: IconButton(
                    icon: const Icon(Icons.calendar_today_outlined,
                    color: Colors.grey,
                    ),
                    onPressed: (){ 
                      print("Caducidade");
                      _getDateCaduc();
                  },
              ),
             ),
            ),  
          ],
          ),         
        MyInputField(
              title: "Horas", 
              hint: _endTime,
              widget: IconButton(
                onPressed: (){
                  _getTimeFromUser(isStartTime: false);
                }, 
                icon: const Icon(
                  Icons.access_time_rounded,
                  color: Colors.grey,
                )
              ),
            ),                 
            MyInputField(title: "Ficheiro", hint: "upload you file", controller: _fileController,
              widget: MyButton(
                label: 'Carregar PDF', 
                onTap: () { 
                 selecionarArquivo();
                }, 
                cor: const Color.fromARGB(255, 10, 57, 95),
              )
            ),         
            const SizedBox(height: 18,),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //_colorPallete(),
                MyButton(label: "Create Task", onTap: ()=>_validateDate(), cor: Colors.black,)
              ],
             ),
             const SizedBox(height: 20,),
             Text("Carregando o documento"),                             
             buildProgress(),             
            ],
          ),
        ),
      ),
    );
  }

  Future selecionarArquivo() async{    
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;
    
    setState(() {
      pickedFile = result.files.first;
    });
  }
 
 Future carregarPdf() async{
  final path = 'documento/${pickedFile!.name}';
  final file = File(pickedFile!.path!);
  
  final ref = FirebaseStorage.instance.ref().child(path);
  
  //esta task é para poder se implementar o progressBar
  setState(() {
    //uploadTask nos permite ver a ação que esta sendo realizada com o pdf
    //se esta parado ou se esta sendo enviado
    uploadTask = ref.putFile(file);
  });
  final snapshot = await uploadTask!.whenComplete(() {});

  final urlDownload = await snapshot.ref.getDownloadURL();
  print("Link do Download, $urlDownload");
  setState(() {
    uploadTask = null;
  });

  final doc = Documento(
    id: documento!.id,
    nome: _selecteName,
    empresa: _selecteEmpresa,
    descricao: _descController.text,
    dataIsnc: DateFormat.yMd().format(_intoDate),
    dataCaduc: DateFormat.yMd().format(_endDate),
    endTime: _endTime,
    ficheiro: path,
    urlpath: urlDownload,
    estaAtualizado: 1
  );
 /*  DocController.instance.updateDoc(doc); */
 }
 
Widget buildProgress() => StreamBuilder<TaskSnapshot>(
    stream: uploadTask?.snapshotEvents, 
    builder: (context, snapshot){
      if(snapshot.hasData){
        final data = snapshot.data!;
        double progress = data.bytesTransferred / data.totalBytes;
        
        return SizedBox(
          height: 50,
          child: Stack(
            fit: StackFit.expand,
            children: [              
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey,
                color: Colors.green,
              ),
              Center(
                child: Text(
                  '${(100 * progress).roundToDouble()}%',
                  style: const TextStyle(color: Colors.white),
                ),
              ),                           
            ],                        
          ),                 
        );
             
      }else{
        return const SizedBox(height: 50,); 
      }
    }  
);
 
   _validateDate(){
    if(_selecteName.isNotEmpty&&_descController.text.isNotEmpty){
      carregarPdf();
      //"Obrigatório", "Todos os campos são obrigatórios !"
    }else if(_selecteName.isEmpty || _descController.text.isEmpty){
      Get.snackbar("Obrigatório", "Todos os campos são obrigatórios !",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 22, 4, 104),
        colorText: pinkClr,
        icon: const Icon(Icons.warning_amber_rounded,
          color: Colors.red,
        )
      );
    }        
   }
 
  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading:  GestureDetector(
        onTap: (){
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color:Colors.white,
        ),
      ),
      actions: const [
      CircleAvatar(
        backgroundImage: AssetImage(
          "assets/images/profile.jpg"
        ),
       ),
        SizedBox(width: 20,)
      ],  
    );
  }

  _getDateInscr() async {
    DateTime? _pickerDatee = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2015), 
      lastDate: DateTime(2121)
    );
    if(_pickerDatee!=null){
      setState(() {
        _intoDate = _pickerDatee;
        print(_intoDate);
      });
    }else{
      print("Data inserida com erro");
    }
  }
  _getDateCaduc() async {   
     DateTime? _pickerDatee = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2015), 
      lastDate: DateTime(2121)
    );
   if(_pickerDatee!=null){
      setState(() {
        _endDate = _pickerDatee;
        print(_endDate);
      });
    }else{
      print("Data inserida com erro");
    }
  }

  _getTimeFromUser({required bool? isStartTime}) async{
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if(pickedTime==null){
        print("Hora cancelada");
    }else if(isStartTime==false){
      setState(() {
        _endTime=_formatedTime;
      });
    }
  }

  _showTimePicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context, 
      initialTime: TimeOfDay(
        //_startTime formato ---> 10:30
        hour: int.parse(_endTime.split(":")[0]), 
        minute: int.parse(_endTime.split(":")[1].split(" ")[0])
      )
    );
  }
}