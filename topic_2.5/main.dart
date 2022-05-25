import 'dart:io';

var monthNum = 0;
var months = [
  'январь',
  'февраль',
  'март',
  'апрель',
  'май',
  'июнь',
  'июль',
  'август',
  'сентябрь',
  'октябрь',
  'ноябрь',
  'декабрь',
];

// 2
void printAllOdds(int _max) {
  for (var i = 0; i < _max + 1; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}

// 3
void sumOrStop() {}

void main() {
  print('Введите номер месяца: ');

  try {
    monthNum = int.parse((stdin.readLineSync()).toString());
  } on Exception {
    monthNum = -1;
  }

  --monthNum;

  // 1
  switch (monthNum) {
    case 1:
      print(months[monthNum]);
      break;
    case 2:
      print(months[monthNum]);
      break;
    case 3:
      print(months[monthNum]);
      break;
    case 4:
      print(months[monthNum]);
      break;
    case 5:
      print(months[monthNum]);
      break;
    case 6:
      print(months[monthNum]);
      break;
    case 7:
      print(months[monthNum]);
      break;
    case 8:
      print(months[monthNum]);
      break;
    case 9:
      print(months[monthNum]);
      break;
    case 10:
      print(months[monthNum]);
      break;
    case 11:
      print(months[monthNum]);
      break;
    case 12:
      print(months[monthNum]);
      break;
    default:
      print('Неверный номер месяца');
  }

  // 2
  printAllOdds(100);

  // 3 sum or stop
  sumOrStop();
}
