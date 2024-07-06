import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  //const Categories({super.key});
  late IconData type;
  late String title;
  Categories({super.key, required this.title, required this.type});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          type,
          color: Color.fromARGB(255, 91, 118, 252),
        ),
        Text(title)
      ],
    );
  }
}
