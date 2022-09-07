import 'package:flutter/material.dart';
import 'package:practica_dos/juego.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Practica 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String usarName = "";
  String pin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.person_outline, size: 200,),
            const Text(
              'Ingrese su datos:',
            ),
            Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(helperText: "ingrese su usuario"),
                    onChanged: (value){
                      usarName = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(helperText: "ingrese su pin"),
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    onChanged: (value){
                      pin = value;
                    },
                  ),
                  TextButton(
                    onPressed: (){
                      validarLogin(usarName, pin, context);
                    },
                    child: Text("INGRESAR"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  validarLogin(String userName, String pin, BuildContext context) {
    if(pin.length == 6 && userName != ""){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Juego()));
    }
  }
}
