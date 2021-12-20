import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zartek/logic/cart.dart';
import 'package:zartek/logic/phone_sign_in.dart';
import 'package:zartek/ui/home_page.dart';
import 'package:zartek/ui/sign_in.dart';
import 'logic/google_sign_in.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('isLoggedIn') ?? false;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      ChangeNotifierProvider(create: (_) => PhoneSignIn()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:status == true ? const HomePage() : const SignInPage())
    ),
  );
}




