// https://dartpad.dev/

void main() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }

  int a = 1;
  String b = 'texto1';
  String c = "texto2";
  bool d = true;
  var e = 15;
  var f = 2.1;
  var g = "oi";
  dynamic h = b + c;
  dynamic i = b + "$e";

  print(a);
}
