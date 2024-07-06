import 'package:flutter/material.dart';

class NoTasks extends StatelessWidget {
  final String? message;

  const NoTasks({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(
          Icons.menu,
          color: Colors.grey,
          size: 35,
        ),
        Text(
          '$message',
          style: TextStyle(color: Colors.grey, fontSize: 30),
        )
      ]),
    );
  }
}
