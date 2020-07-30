import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imageapp = AssetImage("images/padrao.png");
  var resultado = "Escolha umas das opções abaixo";
  var colortext = Colors.black;
  var placarpc = 0;
  var placarplay = 0;
  void opcao_selecionanada(String escolhausuario) {
    print(escolhausuario);
    var opcoes_pc = ["pedra","papel","tesoura"];
    var ramdom = new Random();
    var indice = ramdom.nextInt(opcoes_pc.length);
  var  escolha_pc = opcoes_pc[indice];
  switch(escolha_pc) {
    case "pedra":
      setState(() {
        imageapp = AssetImage("images/pedra.png");
      });
      break;
    case "tesoura":
      setState(() {
        imageapp = AssetImage("images/tesoura.png");
      });
      break;
    case "papel":
      setState(() {
        imageapp = AssetImage("images/papel.png");
      });
      break;
  }
  if((escolhausuario == "pedra" && escolha_pc == "tesoura") ||
      (escolhausuario == "tesoura" && escolha_pc == "papel")
      || (escolhausuario == "papel" && escolha_pc == "pedra")
  ) {
   setState(() {
     resultado = "VOCÊ GANHOU !!!";
     colortext = Colors.lightGreen;
     placarplay = placarplay + 1;
   });
  }
 else if((escolha_pc == "pedra" && escolhausuario == "tesoura") ||
    (escolha_pc == "papel" && escolhausuario == "pedra")
   || (escolha_pc == "tesoura" && escolhausuario == "papel")) {
    resultado = " Você PERDEU!!!";
    colortext = Colors.red;
    placarpc = placarpc + 1;
  }
 else {
    resultado = "HOUVE EMPATE !!!";
    colortext = Colors.yellow;
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOKENPO"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          //width: double.infinity,
          padding: EdgeInsets.all(30),
          child: Container(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("Escolha do App:",style: TextStyle( fontSize: 20),),
                Padding(padding: EdgeInsets.only(top: 12),
                  child: Image(image: this.imageapp, width: 100,)
                    
                ),
            Padding(padding: EdgeInsets.only(top: 40),
               child: Text(resultado, style: TextStyle(fontSize:30, color: colortext)
                 , textAlign: TextAlign.center,)
            ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
              child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(

                   child: Image.asset("images/pedra.png", width: 100,),
                      onTap: (){this.opcao_selecionanada("pedra");},
                    ),
                    GestureDetector(
                    child: Image.asset("images/papel.png",width: 100,),
                      onTap: (){this.opcao_selecionanada("papel");},
                    ),
                   GestureDetector(
                   child: Image.asset("images/tesoura.png", width: 100,),
                     onTap: (){this.opcao_selecionanada("tesoura");},
                   )
                  ],
                ),
                ),
                Padding(
                child: Text("PLACAR", style: TextStyle(color: Colors.orange, fontSize: 34),),
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                  Text("Jogador: $placarplay X computador: $placarpc",
                  style: TextStyle(fontSize: 25),)
                ],)

              ],
            ),
          ),
      ),
      )
      );


  }
}
