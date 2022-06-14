import 'dart:async';
import 'dart:convert';
import 'dart:io';

/**
    Используя Future
    Напишите функцию, которая считывает данные с клавиатуры. Функция должна возвращать Future.
    Напишите код, который дожидается выполнения функции и распечатывает на консоль "Введена строка stroke_name".
    Поэкспериментируйте с async/await и then
 */

void main() async {
  // Future 1 - 3
  var name = await getKbInput();
  print(' Привет, $name');

  name = await getKbInputHurry();
  print(' Привет, $name');

  var _dartstring = '';
  getDartList().then((dartList) async {
    for (var i = 0; i < dartList.length; i++) {
      await Future.delayed(Duration(milliseconds: 150));
      _dartstring += dartList[i];
      print('$_dartstring');
    }
  });
}

Future<String?> getKbInput() async {
  print('Вводи своё имя, путник. Не торопись...');
  return await stdin.readLineSync(encoding: utf8);
}

Future<String?> getKbInputHurry({int sec = 5}) async {
  print(
      'А теперь поторопись, путник! У тебя $sec секунд чтобы ЕЩЁ РАЗ :) ввести свое имя... ');
  var name = await stdin
      .transform(const Utf8Decoder())
      .transform(const LineSplitter())
      .timeout(Duration(seconds: sec), onTimeout: (sink) => sink.add(''))
      .first;

  if (name == '') {
    name = 'Тормозилка';
    print('Ну ни шмагла я, ни шмагла... Эх, ты... $name');
  } else {
    print('Я так и знал, это ты - $name !!! Защчищчайся !!!');
  }

  return name;
}

Future<List> getDartList() {
  return Future.delayed(Duration(milliseconds: 500), () {
    final String dart = 'DART! >>>>>>---==(________)------';
    List<String> dartList = dart.split('');
    return dartList;
  });
}
