import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipeapp/control/signup_control.dart';
import 'package:recipeapp/modules/build_textfield.dart';
import 'package:recipeapp/modules/signin_up_avatar.dart';
import '../modules/google_sign.dart';
class SignUP extends StatelessWidget {
  SignUP({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 5, right: 20, left: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Avatar(cond: 1),
                    BuildFormField(
                        control: name,
                        hint: 'User name',
                        prefix: const Icon(Icons.person_2_outlined),
                        valdidatecond: 0),
                    const SizedBox(
                      height: 15,
                    ),
                    BuildFormField(
                        control: email,
                        hint: 'Email',
                        prefix: const Icon(Icons.email_outlined),
                        valdidatecond: 1),
                    const SizedBox(
                      height: 15,
                    ),
                    BuildFormField(
                        control: password,
                        hint: 'Password',
                        prefix: const Icon(Icons.lock_outline_rounded),
                        valdidatecond: 2),
                    const SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      onPressed:()async{await AuthController.instance.register( email.text, password.text,name.text);},
                      color: const Color.fromARGB(255, 67, 146, 125),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      minWidth: double.infinity,
                      child: const Text('Sign up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Text('or'),
                    const GoogleSign(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an acount?'),
                        TextButton(
                            onPressed: () {
                              Get.offNamed('/login');
                            },
                            child: const Text('log in')),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
