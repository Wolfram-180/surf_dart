import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<void> main() async {
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

  // Stream 1 - 2
  var listener = readKb().listen(processKb);
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

Future<List> getDartList() async {
  return Future.delayed(Duration(milliseconds: 500), () {
    final String dart = 'DART! >>>>>>---==(________)------';
    List<String> dartList = dart.split('');
    return dartList;
  });
}

// Stream 1 - 2

Stream<String> readKb() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

void processKb(String str) {
  print(str);
  if (str == 'exit') {
    //listener.cancel();
  }
}
