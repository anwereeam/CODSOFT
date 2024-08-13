import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  RxBool visibility=true.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void onReady() {
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
    super.onReady();
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/login');
    } else if (user.emailVerified) {
      Get.offAllNamed('/home');
    } else if (!user.emailVerified) {
      Get.showSnackbar(const GetSnackBar(
          duration: const Duration(seconds: 3),
          messageText: Text(
            'check your email & click the link to activate your account',
            style: TextStyle(color: Color.fromARGB(255, 254, 218, 111)),
          )));
    }
  }

  register(email, password,name) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
          
      await firestore.collection('message').add({
        "name": name,
        'email': email,
      });
      auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 3),
          messageText: Text(
            e.code.toString(),
            style: const TextStyle(color: Color.fromARGB(255, 254, 218, 111)),
          )));
    }
  }

  login(email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      //auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 3),
          messageText: Text(
            e.code.toString(),
            style: const TextStyle(color: Color.fromARGB(255, 254, 218, 111)),
          )));
    }
  }

  logout() async {
    try {
      await auth.signOut();
      //auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 3),
          messageText: Text(
            e.code.toString(),
            style: const TextStyle(color: Color.fromARGB(255, 254, 218, 111)),
          )));
    }
  }
}
