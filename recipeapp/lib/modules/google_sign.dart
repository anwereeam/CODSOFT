import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSign extends StatelessWidget {
  const GoogleSign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if(googleUser==null)
        {
          return ;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.offNamed('/home');
      },
      child: const CircleAvatar(backgroundImage:AssetImage('images/google.png'),),
    );
  }
}
