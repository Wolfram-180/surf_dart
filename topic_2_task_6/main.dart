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

// 1, 3
void restackWords([String _str = '']) {
  final stack = Stack<String>();
  _str.split(' ').forEach((element) => stack.push(element));
  _str = stack.toString();
  print(_str);
}

double average(List nums) {
  double sum = 0;
  for (int i = 0; i < nums.length; i++) {
    sum += nums[i];
  }

  return sum / nums.length;
}

void main() {
  print(a);
  restackWords(a); // 1, 3
  restackWords(); // 1, 3
  print(b);
  restackWords(b); // 1, 3
}
