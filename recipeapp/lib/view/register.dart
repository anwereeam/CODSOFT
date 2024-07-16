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
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 5,right: 20,left: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Sign up new account',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                  SizedBox(
                    height: 30,
                  ), 
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 66, 169, 148),
                      backgroundImage: AssetImage('images/recipe_login.png'),
                      radius: 100,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'user name is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_2_outlined),
                        hintText: 'User name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'email is required';
                        } else if (!value.isEmail) {
                          return 'wrong email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password is required';
                        } else if (value.length < 8) {
                          return 'Minimum length is 8';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            
                            await _auth.createUserWithEmailAndPassword(
                                email: email.text, password: password.text);
                            _auth.currentUser!.sendEmailVerification();
                            _firestore.collection('users').add(
                                {'username': name.text, 'email': email.text});
                            if(_auth.currentUser!.emailVerified)
                            {
                              Get.offNamed('/home');
                            }
                            else{
                              Get.showSnackbar(GetSnackBar(
                                messageText: Text(
                              'check your email & click the link to activate your account',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 254, 218, 111)),
                            )));
                            }
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
      ),
    );
  }
}
