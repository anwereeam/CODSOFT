// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipeapp/control/signup_control.dart';
import 'package:recipeapp/view/home.dart';
import 'package:recipeapp/view/login.dart';
import 'package:recipeapp/view/register.dart';

import 'view/bootom_bar.dart';
import 'view/ingredient_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: ' AIzaSyAwE8hSd9uoUscB7KXOhngR1UymxjdDdjU ', appId: '1:74066100390:android:f23f4cb122dc0bd4acb467',
      messagingSenderId: '74066100390',
      projectId: 'recipe-app-66fca')
  ).then((value) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  //final _auth=FirebaseAuth.instance;
  //GoogleSignIn  googleUser =GoogleSignIn();
                             //.signOut();
  @override
  Widget build(BuildContext context){
    //googleUser.disconnect();
    //_auth.signOut();
    //print(_auth);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'recipe app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 39, 90, 210)),
        useMaterial3: true,
      ),
      getPages:[
        GetPage(name: '/home', page :()=>RecipeList()),
        GetPage(name: '/ingred', page :()=>MyIngred()),
        GetPage(name: '/login', page :()=>LoginScreeen()),
        GetPage(name: '/signup', page :()=>SignUP()),
        GetPage(name: '/BottomBar', page :()=>BottomBar()),

      ],
      home: LoginScreeen(),
      //initialRoute:_auth.currentUser!=null&& _auth.currentUser!.emailVerified?'/home':'/login',
      
    );
  }
}

