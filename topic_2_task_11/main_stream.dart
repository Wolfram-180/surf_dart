import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() async {
  // Stream 1 - 2
  print('Введите что-нибудь, пожалуйста (exit для выхода)');
  readLnFromKb().listen(checkVal);

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

  print('подождем пару секунд');
  await Future.delayed(Duration(seconds: 10));
}

// Stream 1 - 2
Stream<String> readLnFromKb() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

void checkVal(String line) {
  print('Введена строка $line');
  if (line == 'exit') {
    throw Exception('Вы ввели exit, выходим');
  }
}

// Future 1 - 3
Future<String?> getKbInput() async {
  print('Вводи своё имя, путник. Не торопись...');
  return await stdin.readLineSync(encoding: utf8);
}

Future<String?> getKbInputHurry({int sec = 5}) async {
  print(
      'А теперь поторопись, путник! У тебя $sec секунд чтобы ЕЩЁ РАЗ :) ввести свое имя... ');
  var name = await stdin
      .asBroadcastStream()
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
