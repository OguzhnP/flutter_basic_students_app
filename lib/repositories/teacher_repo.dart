import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/models/teacher.dart';

class TeacherRepository extends ChangeNotifier {
  final List<Teacher> teachers = [
    Teacher(name: "Gülnur", surname: "Demir", age: 50, gender: "Kadın"),
    Teacher(name: "Ferhat", surname: "Sal", age: 44, gender: "Erkek"),
  ];
}

final teacherProvider = ChangeNotifierProvider((ref) => TeacherRepository());
