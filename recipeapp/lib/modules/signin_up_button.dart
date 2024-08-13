import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInButton extends StatelessWidget {
  SignInButton(
      {super.key,
      required this.emailtxt,
      required this.passwordtxt,
      required this.nametxt,
      required this.formvalidate,
      required this.cond});
  final _auth = FirebaseAuth.instance;
  String passwordtxt;
  String emailtxt;
  String nametxt;
  bool formvalidate;
  bool cond; //cond==0 register ||cond ==1  login
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: cond == true
          ? () async {
              if (!formvalidate) {
                try {
                  await _auth.signInWithEmailAndPassword(
                      email: emailtxt, password: passwordtxt);
                  Get.offNamed('/home');
                } on FirebaseAuthException catch (e) {
                  Get.showSnackbar(GetSnackBar(
                      duration: const Duration(seconds: 3),
                      messageText: Text(
                        e.code.toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 254, 218, 111)),
                      )));
                }
              }
            }
          : () async {
              if (!formvalidate) {
                try {
                  await _auth.createUserWithEmailAndPassword(
                      email: emailtxt, password: passwordtxt);
                  _auth.currentUser!.sendEmailVerification();

                  if (_auth.currentUser!.emailVerified) {
                    Get.offNamed('/home');
                  } else {
                    Get.showSnackbar(const GetSnackBar(
                        messageText: Text(
                      'check your email & click the link to activate your account',
                      style:
                          TextStyle(color: Color.fromARGB(255, 254, 218, 111)),
                    )));
                  }
                } on FirebaseAuthException catch (e) {
                  Get.showSnackbar(GetSnackBar(
                      duration: const Duration(seconds: 3),
                      messageText: Text(
                        e.code.toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 254, 218, 111)),
                      )));
                }
              }
            },
      color: const Color.fromARGB(255, 67, 146, 125),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
      minWidth: double.infinity,
      child: Text(cond == true ? 'Login' : 'Sign up',
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
