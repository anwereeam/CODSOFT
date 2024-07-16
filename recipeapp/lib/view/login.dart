import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

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
                Text('Sign in your account',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                SizedBox(
                  height: 35,
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
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email is required';
                    } else if (!value.isEmail) {
                      return 'wrong email';
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'email',
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
                    hintText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {}, child: Text('Forget password'))),
                SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await _auth.signInWithEmailAndPassword(
                            email: email.text, password: password.text);
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
