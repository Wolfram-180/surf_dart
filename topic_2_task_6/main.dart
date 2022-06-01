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

// 4
String findEquationResult(double a, double b, double c) {
  double findDiscr(double a, double b, double c) => b*b - 4*a*c;
  double findRoot(double a, double b, double discrRoot) => (-b + discrRoot) / (2*a);

  final discr = findDiscr(a, b, c);
  if (discr < 0) {
    return 'У уравнения нет корней т.к. его дискриминант меньше нуля';
  }

  final discrSqrRoot = sqrt(discr);
  if (discr == 0) {
    return 'У уравнения есть один корень: x= ${findRoot(a, b, discrSqrRoot)}';
  }

  return 'У уравнения есть два разных корня: x1= ${findRoot(a, b, discrSqrRoot)}, x2= ${findRoot(a, b, -discrSqrRoot)}';
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

  print('\n4:');
  print(findEquationResult(8, 9, -3));
  print(findEquationResult(2, 7, 3));
  print(findEquationResult(-12, 24, 36));
  print(findEquationResult(12, 24, 36));
}
