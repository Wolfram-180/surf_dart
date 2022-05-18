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
  // result: dyn became String type
  // reason: dynamic can change type in run-time

  // 5
  final fin = 1;
  const con = 1;

  //fin = 2;
  // result: The final variable 'fin' can only be set once.
  // reason: final can be assigned in run-time - but only once

  //con = 2;
  // result: Constant variables can't be assigned a value. Try removing the assignment, or remove the modifier 'const'
  // reason: const to be assigned before run-time

  // В чем отличия final от const?
  // final - 1 раз в рантайме, const - установка значения до компиляции

  // 6
  a = 5; // var a - conflict with var a from p. 1. Создать глобальную переменную типа int с именем a
  print(a % 2 == 0 ? 'четное' : 'нечетное');

  // 7
  print('I \u2665 dart');
}
