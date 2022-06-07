import 'package:intl/intl.dart';

void main() {
  // 1
  print('=== 1 ===');
  Student std1 = Student(
      firstName: 'Ivan',
      lastName: 'Petrov',
      birthDay: DateFormat('dd.mm.yyyy').parse('14.05.1980'),
      yearOfAdmission: DateTime(2021, 1, 1));
  print(std1);

  // 2
  print('=== 2 ===');
  Truck truck = Truck(enginePower: 150);
  SportCar sportCar = SportCar(enginePower: 250);
  Bike bike = Bike();

  print(truck);
  print(sportCar);
  print(bike);

  truck.run();
  sportCar.run();

  print('\n=== 3 ===');

  // 3
  final numValToString = AnythingToString<num>();
  print(numValToString.anythingToString(99.9));

  final dTToString = AnythingToString<DateTime>();
  print(dTToString.anythingToString(DateTime.now()));
}

// 1
class Student extends User {
  final DateTime yearOfAdmission;

  int get currentCourse => DateTime.now().year - yearOfAdmission.year;

  Student({
    required String firstName,
    required String lastName,
    required DateTime birthDay,
    required this.yearOfAdmission,
  }) : super(firstName: firstName, lastName: lastName, birthDay: birthDay);

  @override
  String toString() {
    print(super.toString());
    var _stddata = '''
    Год поступления: ${yearOfAdmission.year}
    Текущий курс: $currentCourse
    ''';
    return _stddata;
  }
}

class User {
  final String firstName;
  final String lastName;
  final DateTime birthDay;

  const User(
      {required this.firstName,
      required this.lastName,
      required this.birthDay});

  @override
  String toString() {
    final DateFormat _format = DateFormat('dd.mm.yyyy');
    String _userdata = '''
    Имя и фамилия: $firstName $lastName
    Дата рождения: ${_format.format(this.birthDay)}
    ''';
    return _userdata;
  }
}

// 2
enum Colors { red, green, blue }

abstract class Car {
  final num weight = 0;
  final num enginePower = 0;
  void run();
}

class Truck extends Car with Painter, Engine {
  double get weight => 10;
  late final num enginePower;

  void run() {
    runEngine();
  }

  String toString() {
    return 'Грузовик $colorName цвета';
  }

  Truck({required this.enginePower}) {
    setColor(Colors.red);
  }
}

class SportCar extends Car with Painter, Engine {
  double get weight => 2;
  late final num enginePower;

  String toString() {
    return 'Спорткар $colorName цвета';
  }

  SportCar({required this.enginePower}) {
    setColor(Colors.blue);
  }

  void run() {
    runEngine();
  }
}

class Bike with Painter {
  @override
  String toString() {
    return 'Велосипед $colorName цвета';
  }

  Bike() {
    setColor(Colors.green);
  }
}

mixin Painter {
  String? colorName;
  void setColor(Colors color) {
    switch (color) {
      case Colors.red:
        {
          colorName = 'красного';
          break;
        }
      case Colors.green:
        {
          colorName = 'зеленого';
          break;
        }
      case Colors.blue:
        {
          colorName = 'синего';
          break;
        }
    }
  }
}

mixin Engine on Car {
  late final num enginePower;
  void runEngine() {
    print(
        'Двигатель работает. Максимальная скорость = $enginePower / $weight = ${enginePower / weight}');
  }
}

// 3
class AnythingToString<T> {
  String anythingToString(T value) => value.toString();
}
