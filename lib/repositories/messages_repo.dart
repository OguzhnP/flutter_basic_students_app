import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/models/messages.dart';

class MessagesRepository extends ChangeNotifier {
  final List<Message> messages = [
    Message(
        text: "Merahaba",
        sender: "Ali",
        time: DateTime.now().subtract(const Duration(minutes: 3))),
    Message(
        text: "Orda mısın?",
        sender: "Ali",
        time: DateTime.now().subtract(const Duration(minutes: 2))),
    Message(
        text: "Evet",
        sender: "Ayşe",
        time: DateTime.now().subtract(const Duration(minutes: 1))),
    Message(text: "Nasılsın", sender: "Ayşe", time: DateTime.now()),
  ];
}

class NewMessageCount extends StateNotifier<int> {
  NewMessageCount(super.state);

  void makeZero() => state = 0;
}

final newMessagesCountProvider =
    StateNotifierProvider<NewMessageCount, int>((ref) => NewMessageCount(2));

final messageProvider = ChangeNotifierProvider((ref) => MessagesRepository());
