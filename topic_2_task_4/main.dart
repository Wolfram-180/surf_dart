// 1
var a = 0;

void main() {
  // 2
  double b = 0.0;

  print(a.runtimeType);
  print(b.runtimeType);

  // 3
  var text = 'text';
  // a = text;
  // result: invalid_assignment: A value of type 'String' can't be assigned to a variable of type 'int'.
  // reason: incompatible types

  // 4
  dynamic dyn = 1;
  print(dyn.runtimeType);
  dyn = text;
  print(dyn.runtimeType);
}
