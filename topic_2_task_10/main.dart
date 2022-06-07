import 'package:intl/intl.dart';

void main() {
  // 1
  Student std1 = Student(
      firstName: 'Ivan',
      lastName: 'Petrov',
      birthDay: DateFormat('dd.mm.yyyy').parse('14.05.1980'),
      yearOfAdmission: DateTime(2021, 1, 1));
  print(std1);

  // 2
  Truck truck = Truck();
  SportCar sportCar = SportCar();
  Bike bike = Bike();

  print(truck);
  print(sportCar);
  print(bike);

  truck.run();
  sportCar.run();

  // 3
}

// 1
class Student extends User {
  final DateTime yearOfAdmission;

  int get currentCourse => DateTime.now().year - yearOfAdmission.year;

  Student({
    String firstName,
    String lastName,
    DateTime birthDay,
    this.yearOfAdmission,
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

  const User({this.firstName, this.lastName, this.birthDay});

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
  double weight;
  void run();
}

class Truck extends Car with Painter, Engine {
  @override
  double get weight => 10;

  @override
  void run() {
    runEngine();
  }

  @override
  String toString() {
    return 'Грузовик $colorName цвета';
  }

  Truck() {
    setColor(Colors.red);
  }
}

class SportCar extends Car with Painter, Engine {
  @override
  double get weight => 2;

  @override
  String toString() {
    return 'Спорткар $colorName цвета';
  }

  SportCar() {
    setColor(Colors.blue);
  }

  @override
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
  String colorName;
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
  int enginePower = 143;
  void runEngine() {
    print(
        'Двигатель работает. Максимальная скорость = $enginePower / $weight = ${enginePower / weight}');
  }
}
