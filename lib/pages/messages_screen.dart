import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_app/models/messages.dart';
import 'package:student_app/repositories/messages_repo.dart';

class MessagesScreen extends ConsumerStatefulWidget {
  const MessagesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then(
        (value) => ref.read(newMessagesCountProvider.notifier).makeZero());
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    final messagesRepository = ref.watch(messageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlar"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messagesRepository.messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                if (index > messagesRepository.messages.length) {
                  return null;
                }

                return MessageView(
                  message: messagesRepository
                      .messages[messagesRepository.messages.length - index - 1],
                );
              },
            ),
          ),
          DecoratedBox(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blue.shade300)),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade300),
                          borderRadius: BorderRadius.circular(14)),
                      child: TextField(
                        controller: messageController,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      )),
                )),
                CupertinoButton(
                    child: const Text("Gönder"),
                    onPressed: () {
                      messagesRepository.messages.add(Message(
                          text: messageController.text,
                          sender: "Ali",
                          time: DateTime.now()));
                      messageController.text = "";
                      setState(() {});
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MessageView extends StatelessWidget {
  final Message message;
  const MessageView({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == "Ali"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 2, color: Colors.blue.shade300),
              color: Colors.blue.shade300),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
