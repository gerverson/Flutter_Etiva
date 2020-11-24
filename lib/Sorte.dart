import 'package:flutter/material.dart';
import 'dart:math' show Random;

int _credit = 0;
var _random = "000";

class Sorte extends StatefulWidget {
  @override
  _SorteState createState() => _SorteState();
}

class _SorteState extends State<Sorte> {
  void _masCred() async {
    _credit = _credit + 1;
    setState(() {
      _credit = _credit ?? -1;
    });
  }

  void _sorte() async {
    int myCred = _credit ?? -1;
    if (myCred > 0) {
      var randomizer = new Random();
      var max = 100;
      var min = 1;
      var num = min + randomizer.nextInt(max - min);
      setState(() {
        _random = "$num";
      });
      _credit = _credit - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      Align(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Material(
                  type: MaterialType.transparency,
                  child: Text("Sorteador",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0)),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Text("Créditos: $_credit",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ),
                Divider(
                  color: Colors.white,
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Text("$_random",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0)),
                ),
                RaisedButton(
                    child: Text("Sortear Número",
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      _sorte();
                    }),
                Divider(
                  color: Colors.white,
                ),
                Divider(
                  color: Colors.white,
                ),
                RaisedButton(
                    child: Text("Ganhar Créditos",
                        style: TextStyle(color: Colors.black)),
                    onPressed: () async {
                      setState(() {
                        _masCred();
                        debugPrint("Cred: $_credit");
                      });
                      debugPrint("Cred: $_credit");
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
              ])),
    ]);
  }
}
