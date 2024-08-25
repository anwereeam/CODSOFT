import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipeapp/modules/google_sign.dart';
import 'package:recipeapp/modules/signin_up_avatar.dart';

import '../control/signup_control.dart';
import '../modules/build_textfield.dart';

class LoginScreeen extends StatelessWidget {
  LoginScreeen({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  //final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Avatar(cond: 0),
                    BuildFormField(
                        control: email,
                        hint: 'Email',
                        prefix: const Icon(Icons.email_outlined),
                        valdidatecond: 1),
                    SizedBox(
                      height: 15,
                    ),
                    BuildFormField(
                        control: password,
                        hint: 'Password',
                        prefix: const Icon(Icons.lock_outline_rounded),
                        valdidatecond: 2),
                    Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () async {
                              if (email.text == '') {
                                Get.showSnackbar(const GetSnackBar(
                                    duration: Duration(seconds: 3),
                                    messageText: Text(
                                      'please write your email',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 254, 218, 111)),
                                    )));
                              } else {
                                await AuthController.instance.resetpass(email.text);
                              }
                            },
                            child: Text('Forget password'))),
                    MaterialButton(
                      onPressed: () async {
                        await AuthController.instance
                            .login(email.text, password.text);
                      },
                      child: Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      color: Color.fromARGB(255, 67, 146, 125),
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      minWidth: double.infinity,
                    ),
                    //Text('or'),
                    GoogleSign(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an acount?'),
                        TextButton(
                            onPressed: () {
                              Get.offNamed('/signup');
                            },
                            child: Text('sign up')),
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
