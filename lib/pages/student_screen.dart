import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/models/student.dart';
import 'package:student_app/repositories/student_repo.dart';

class StudentScreen extends ConsumerWidget {
  StudentScreen({super.key});

  var selectedColor = Colors.grey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var studentRepository = ref.watch(studentProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğrenciler"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 6,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                child: Text("${studentRepository.students.length} Öğrenci"),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => StudentView(
                    student: studentRepository.students[index],
                    studentRepository: studentRepository),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: studentRepository.students.length),
          )
        ],
      ),
    );
  }
}

class StudentView extends ConsumerWidget {
  final Student student;
  const StudentView({
    super.key,
    required this.studentRepository,
    required this.student,
  });

  final StudentRepository studentRepository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isMyLove = ref.watch(studentProvider).isMyLove(student);

    return ListTile(
      leading: student.gender == "Erkek"
          ? const IntrinsicWidth(child: Center(child: Text("👦🏼")))
          : const IntrinsicWidth(child: Center(child: Text("👩🏼"))), //👩🏼
      title: Text("${student.name} ${student.surname}"),
      trailing: IconButton(
          onPressed: () {
            ref.watch(studentProvider).love(student, !isMyLove);
          },
          icon: Icon(isMyLove ? Icons.favorite : Icons.favorite_border)),
    );
  }
}
