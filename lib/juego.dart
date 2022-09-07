import 'package:flutter/material.dart';
import 'dart:math';


class Juego extends StatefulWidget {
  const Juego({Key? key}) : super(key: key);

  @override
  State<Juego> createState() => JuegoState();
}

class JuegoState extends State<Juego> {
  bool empezo = false;
  int nivel = 2,score = 0;
  Random random = Random();
  List items = ["1","2"];
  @override
  Widget build(BuildContext context) {
    int numeroSecreto = random.nextInt(nivel + 1);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juego"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("adivina el numero aleatorio"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nivel: ${nivel-1}"),
                Text("score: $score"),
              ],
            ),
            Visibility(
              visible: !empezo,
              child: OutlinedButton(
                  onPressed: (){
                    setState(() {
                      empezo = true;
                    });
                  }, child: const Text("EMPEZAR")),
            ),
            Visibility(
              visible: empezo,
                child: Column(
                  children: [
                    const Icon(Icons.question_mark_sharp, size: 100,),
                    Text("Selecciona un numero entre el ${items.first} y ${items.last}"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        items: items.map((e) => DropdownMenuItem(
                          value: e,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        )).toList(),
                        onChanged: (value) {
                          compara(value!, numeroSecreto);
                        },
                        icon: const Icon(Icons.find_in_page, size: 50,),
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  compara(Object seleccionado, int numeroSecreto) {
    print(seleccionado.toString() + numeroSecreto.toString());
    if(seleccionado.toString() == numeroSecreto.toString()){
      nivel++;
      items.add(nivel.toString());
      score++;
      setState(() {

      });
    }
  }
}
