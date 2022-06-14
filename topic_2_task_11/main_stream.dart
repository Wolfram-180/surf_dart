import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() async {
  print('Введите что-нибудь, пожалуйста (exit для выхода)');
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
