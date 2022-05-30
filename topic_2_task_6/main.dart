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

// 1
void restackWords(_str) {
  final stack = Stack<String>();
  _str.split(' ').forEach((element) => stack.push(element));
  _str = stack.toString();
  print(_str);
}

void main() {
  print(a);
  restackWords(a); // 1
  print(b);
  restackWords(b); // 1
}
