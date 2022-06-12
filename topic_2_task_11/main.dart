import 'dart:convert';
import 'dart:io';

Future<String?> getKbInput() async {
  print('Вводи своё имя, путник. Не торопись...');
  return await stdin.readLineSync(encoding: utf8);
}

Future<String?> getKbInputHurry({int sec = 5}) async {
  print(
      'А теперь поторопись, путник! У тебя $sec секунд чтобы ввести свое имя... ');
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

Future<void> main() async {
  var name = getKbInput();
  print(' Привет, $name');
  name = getKbInputHurry();
  print(' Привет, $name');
}
