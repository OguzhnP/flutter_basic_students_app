import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/pages/messages_screen.dart';
import 'package:student_app/pages/student_screen.dart';
import 'package:student_app/pages/teacher_scren.dart';
import 'package:student_app/repositories/messages_repo.dart';
import 'package:student_app/repositories/student_repo.dart';
import 'package:student_app/repositories/teacher_repo.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student App',
      theme: ThemeData(fontFamily: "muli", primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentRepository = ref.watch(studentProvider);
    final messagesRepository = ref.watch(messageProvider);
    final teacherRepository = ref.watch(teacherProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hoşgeldiniz"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton.filled(
                  child:
                      Text("${ref.watch(newMessagesCountProvider)} Yeni Mesaj"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessagesScreen(),
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton.filled(
                  child: Text("${teacherRepository.teachers.length} Öğretmen"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherScreen(),
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton.filled(
                  child: Text("${studentRepository.students.length} Öğrenci"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentScreen(),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
