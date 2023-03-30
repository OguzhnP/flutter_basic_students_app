import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/models/student.dart';

class StudentRepository extends ChangeNotifier {
  final List<Student> students = [
    Student(name: "Ayşe", surname: "Çelik", age: 20, gender: "Kadın"),
    Student(name: "Ali", surname: "Yılmaz", age: 12, gender: "Erkek"),
  ];
  final Set<Student> myLove = {};

  void love(Student student, bool isMyLove) {
    if (isMyLove) {
      myLove.add(student);
    } else {
      myLove.remove(student);
    }
    notifyListeners();
  }

  bool isMyLove(Student student) {
    return myLove.contains(student);
  }
}

final studentProvider = ChangeNotifierProvider((ref) => StudentRepository());
