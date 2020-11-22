// https://dartpad.dev/

void main() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }

  int num = 1;
  String a = 'texto1';
  String b = "texto2";
  bool value = true;
  var c =15;
  var d = 2.1;
  var e = "oi";
  dynamic f = a + b;
  dynamic g = a + "$c";

  print(g);
}
