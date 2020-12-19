import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperaraCep() async {
    String cep = "01001000";
    String url = "http://viacep.com.br/ws/${cep}/json/";
    http.Response response;

     response = await http.get(url);
     Map<String, dynamic> retorno = json.decode(response.body);

     String logradouro = retorno["logradouro"];
     String complemento = retorno["complemento"];
     String bairro = retorno["bairro"];
     String localidade = retorno["localidade"];

     print(
       "Resposta: logradouro é ${logradouro}, complento é ${complemento}, bairro é ${bairro} e localidade é ${localidade}"
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de Serviço Web'),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Clique Aqui'),
              onPressed: _recuperaraCep(),
            )
          ],
        )
      )
    );
  }
}
