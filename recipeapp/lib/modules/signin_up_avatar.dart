import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({super.key, required this.cond});
  late int cond;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(cond==0?
          'Sign in your account':'Sign up new account',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height:cond==0? 25:5,
        ),
        const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 66, 169, 148),
          backgroundImage: AssetImage('images/recipe_login.png'),
          radius: 95,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
