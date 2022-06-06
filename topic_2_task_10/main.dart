import 'package:intl/intl.dart';

void main() {
  Student std1 = Student(
      firstName: 'Ivan',
      lastName: 'Petrov',
      birthDay: DateFormat('dd.mm.yyyy').parse('14.05.1980'),
      yearOfAdmission: DateTime(2021, 1, 1));
  print(std1);
}

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
    super.toString();
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

  User({this.firstName, this.lastName, this.birthDay});

  @override
  String toString() {
    final DateFormat _format = DateFormat('dd.mm.yyyy');
    String _userdata = '''
    Имя и фамилия: $firstName $lastName
    Дата рождения: ${_format.format(this.birthDay)}
    ''';
    print(_userdata);
    return _userdata;
  }
}
