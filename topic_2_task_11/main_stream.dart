import 'dart:async';
import 'dart:convert';
import 'dart:io';

// working on statistics...

/**
    Используя Stream
    Напишите функцию, которая считывает данные с клавиатуры до тех пор, пока не будет введен строка "exit". Функция должна возвращать Stream.
    Напишите код, который прослушивает поток и распечатывает на консоль "Введена строка stroke_name" каждый раз, когда в потоке появляется новое событие.
 */

void main() async {
  print('Введите что-нибудь, пожалуйста (exit для выхода): ');
  readLnFromKb().listen(checkVal);
}

Stream<String> readLnFromKb() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

void checkVal(String line) {
  print('Введена строка $line');
  if (line == 'exit') {
    throw Exception('Вы ввели exit, выходим');
  }
}
