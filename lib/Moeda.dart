import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Moeda extends StatefulWidget {
  @override
  _MoedaState createState() => _MoedaState();
}
TextEditingController keyController = TextEditingController();
String _key = "0";

class _MoedaState extends State<Moeda> {
  bool _boo = false;
  bool _boo2 = false;
  String price = "0.0";
  String priceBR = "0.0";

  _price() async {
    http.Response response =
        await http.get('https://economia.awesomeapi.com.br/json/USD-BRL');
    if ('${response.statusCode}' == '200') {
      List json = jsonDecode(response.body);
      double rr = double.tryParse(json[0]["low"]) ?? 0;
      if (rr != 0) {
        String value = rr.toStringAsFixed(2);
        setState(() {
          _boo = true;
          price = value;
          print(price);
        });
      }
    } else {
      print("Error");
    }
  }

  void cal(){
    double br = num.tryParse(_key)?.toDouble();
    double us = num.tryParse(price)?.toDouble();
    // print("br $br");
    // print("us $us");
    setState(() {
      _boo2 = true;
      if(br == null || us == null){
        priceBR = "Valor Iválido";
      }
      else{
        double op = us * br;
        priceBR = "$op";
      }
    });

  }

  @override
  void initState() {
    _price();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      // color: Colors.white,
      body: Column(
        children: <Widget>[
          Divider(
            height: 100,
            color: Colors.white,
          ),
          Material(
            type: MaterialType.transparency,
            child: Text("Dolar/Real",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0)),
          ),
          Divider(
            height: 40,
            color: Colors.white,
          ),
          if (_boo)
            Material(
              type: MaterialType.transparency,
              child: Text(price,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0)),
            ),
          Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: keyController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Valor em reais",
                ),
                onChanged: (value) {
                  setState(() {
                    _key = value;
                  });
                },
              )),
          RaisedButton(
              child: Text("Converter", style: TextStyle(color: Colors.black)),
              onPressed: () {
                cal();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))),

          if (_boo2)
            Material(
              type: MaterialType.transparency,
              child: Text(priceBR,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0)),
            ),
        ],
      ),
    );
  }
}