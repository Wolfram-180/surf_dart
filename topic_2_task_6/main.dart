import 'dart:math';

class Stack<E> {
  Stack() : _stack = <E>[];
  final List<E> _stack;

  @override
  String toString() {
    return '${_stack.reversed.join(' ')}';
  }

  void push(E element) => _stack.add(element);
}

var a = 'hello world';
var b = '1 2 3 4 5';
var seed = Random();

// 1, 3
void restackWords([String _str = '']) {
  final stack = Stack<String>();
  _str.split(' ').forEach((element) => stack.push(element));
  _str = stack.toString();
  print(_str);
}

// 2
double lstAvrg([nums = 0]) {
  var msv = [];
  double sum = 0;

  for (var i = 0; i < nums; i++) {
    msv.add(seed.nextInt(100));
  }
  print('массив: ${msv}');

  for (var i = 0; i < msv.length; i++) {
    sum += msv[i];
  }

  return nums > 0 ? sum / msv.length : 0;
}

void main() {
  print('1, 3:');
  print(a);
  restackWords(a);
  restackWords();
  print(b);
  restackWords(b);

  print('\n2, 3:');
  // массив чисел с произвольным размером
  print('среднее арифметическое число массива: ${lstAvrg(seed.nextInt(100))}');
  print('среднее арифметическое число массива: ${lstAvrg()}');
}
