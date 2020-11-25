import 'package:flutter/material.dart';
import 'package:flutter_etiva/Contador.dart';
import 'package:flutter_etiva/Moeda.dart';
import 'package:flutter_etiva/Sorte.dart';
import 'package:flutter_etiva/imc.dart';
import 'package:flutter_etiva/lista.dart';
import 'package:flutter_etiva/pessoas.dart';
import 'package:flutter_etiva/tarefas.dart';
import 'package:flutter_etiva/webview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Etiva';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Widget build(BuildContext context) {
    Color gradientStart = Colors.blueAccent[700];
    Color gradientEnd = Colors.red[500];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Etiva'),
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [gradientStart, gradientEnd],
                begin: const FractionalOffset(0.5, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: new EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    type: MaterialType.transparency,
                    child: Text("ETIVA",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 60.0)),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            RaisedButton(
              child: Text("Contador",
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contador()),
                );
              },
            ),
            RaisedButton(
              child: Text("Moeda",
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Moeda()),
                );
              },
            ),
            RaisedButton(
              child: Text("Sorte",
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sorte()),
                );
              },
            ),
            RaisedButton(
              child: Text("Lista Automatica",
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                List<String> items;
                items = List<String>.generate(100, (i) => "Item $i");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyList(items: items)),
                );
              },
            ),
            RaisedButton(
              child: Text("IMC",
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => imc()),
                );
              },
            ),
            RaisedButton(
              child: Text("Contador Pessoas",
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pessoas()),
                );
              },
            ),
            RaisedButton(
              child: Text("Lista de tarefas",
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tarefas()),
                );
              },
            ),
            RaisedButton(
              child: Text("WebView",
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpScreen()),
                );
              },
            ),
          ],
        ),
      ]),
    );
  }
}
