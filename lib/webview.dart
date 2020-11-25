import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {


  @override
  HelpScreenState createState() {
    return HelpScreenState();
  }
}

class HelpScreenState extends State<HelpScreen> {
  WebViewController _controller;

  bool _isJSEnabled = true;

  _onChanged() {
    setState(() {
      _isJSEnabled = !_isJSEnabled;
    });
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Etiva', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          WebView(
            javascriptMode: _isJSEnabled
                ? JavascriptMode.unrestricted
                : JavascriptMode.disabled,
            initialUrl: '',
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('http://www.dominiopublico.gov.br/')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              if (request.url.contains("mailto:")) {
                _launchURL(request.url);
                return NavigationDecision.prevent;
              } else if (request.url.contains("tel:")) {
                _launchURL(request.url);
                return NavigationDecision.prevent;
              } else if (request.url.contains("http:")) {
                _launchURL(request.url);
                return NavigationDecision.prevent;
              } else if (request.url.contains("https:")) {
                _launchURL(request.url);
                return NavigationDecision.prevent;
              }

              return NavigationDecision.navigate;
            },
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
              _loadHtmlFromAssets();
            },
          ),
        ]));
  }

  _loadHtmlFromAssets() async {
    String noInternet = '<!DOCTYPE html> '
        '<html lang="pt-br"> '
        '<head> '
        '<title>Sem Internet</title> '
        '<meta charset="utf-8">'
        '</head> '
        '<body> '
        '<div align="center"> '
        '<img src=\'data:image/png;base64,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\'/> '
        '<h3>Não foi possível conectar a Internet.</h4>'
        '<h4>Por favor reinicie o aplicativo conectado a Internet para que seja exibido o conteúdo.</h4>'
        '</div>'
        '</body>'
        '</html>';

    String text = '<!DOCTYPE html> '
        '<html> '
        '<head> '
        '<meta charset="UTF-8"/> '
        '<title>Document</title>'
        '</head> '
        '<body> '
        '<h1>Título de nível 1</h1> '
        '<h2>Título de nível 2</h2> '
        '<h3>Título de nível 3</h3> '
        '<h4>Título de nível 4</h4> '
        '<h5>Título de nível 5</h5> '
        '<h6>Título de nível 6</h6>'
        '</body>'
        '</html>';

    String myString = text ?? noInternet;

    _controller.loadUrl(Uri.dataFromString(myString,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}