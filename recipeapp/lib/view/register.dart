import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

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
    return Scaffold(
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 66, 169, 148),
                    backgroundImage: AssetImage('images/recipe_login.png'),
                    radius: 100,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'user name is required';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'User name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email is required';
                      } else if (!value.isEmail) {
                        return 'wrong email';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password is required';
                      } else if (value.length < 8) {
                        return 'Minimum length is 8';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await _auth.createUserWithEmailAndPassword(
                              email: email.text, password: password.text);
                          _firestore.collection('users').add(
                              {'username': name.text, 'email': email.text});
                          Get.offNamed('/home');
                        } on FirebaseAuthException catch (e) {
                          Get.showSnackbar(GetSnackBar(
                            duration: Duration(seconds: 3),
                              messageText: Text(
                            e.code.toString(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 254, 218, 111)),
                          )));
                        } 
                      }
                    },
                    child: Text('Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    color: Color.fromARGB(255, 67, 146, 125),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minWidth: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an acount?'),
                      TextButton(onPressed: () {
                        Get.offNamed('/login');
                      }, child: Text('log in')),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
