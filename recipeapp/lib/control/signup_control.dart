import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignControl extends GetxController {
  late bool formkeystate;
  RxBool verified = false.obs;
  final _auth = FirebaseAuth.instance;
  late String error;
  void register({email,password,name}) async {
    if (formkeystate) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        _auth.currentUser!.sendEmailVerification();
        
        if (_auth.currentUser!.emailVerified) {
          verified=true.obs;
        }
      } on FirebaseAuthException catch (e) {
        error=e.code;
      }
    }
  }
}
