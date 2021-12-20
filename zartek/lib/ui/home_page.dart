import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek/logic/google_sign_in.dart';
import 'package:zartek/ui/sign_in.dart';
import 'package:zartek/utils/colors.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: ()  {
            Provider.of<GoogleSignInProvider>(context, listen: false)
                .signOutWithGoogle().whenComplete(() => Get.to(()=>const SignInPage()));
          },
          child: Container(color: AppColors.kGreen,
          child:const Text('Sign Out')),
        ),
      ),
    );
  }

}
