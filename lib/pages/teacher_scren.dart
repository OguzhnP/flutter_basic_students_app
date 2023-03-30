import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/repositories/teacher_repo.dart';

class TeacherScreen extends ConsumerWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherRepository = ref.watch(teacherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğretmenler"),
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
                child: Text("${teacherRepository.teachers.length} Öğretmen"),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      leading:
                          teacherRepository.teachers[index].gender == "Erkek"
                              ? const IntrinsicWidth(
                                  child: Center(child: Text("👦🏼")))
                              : const IntrinsicWidth(
                                  child: Center(child: Text("👩🏼"))), //👩🏼
                      title: Text(
                          "${teacherRepository.teachers[index].name} ${teacherRepository.teachers[index].surname}"),
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: teacherRepository.teachers.length),
          )
        ],
      ),
    );
  }
}
