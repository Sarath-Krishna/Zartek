import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek/logic/google_sign_in.dart';
import 'package:zartek/ui/phone_input.dart';
import 'package:zartek/utils/colors.dart';
import 'package:zartek/utils/images.dart';
import 'package:get/get.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // Provider.of<GoogleSignInProvider>(context, listen: false)
    //     .signOutWithGoogle()
    //     .whenComplete(() => Get.to(() => const SignInPage()));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(AppImages.kFirebaseLogo),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Provider.of<GoogleSignInProvider>(context, listen: false)
                        .signInWithGoogle(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.kBlueGoogleSign,
                          borderRadius: BorderRadius.circular(25)),
                      width: width * 0.80,
                      height: height * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              AppImages.kGoogleLogo,
                            ),
                          ),
                          const Text(
                            'Google',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kWhite),
                          ),
                          const Text(
                            'Phone',
                            style: TextStyle(color: AppColors.kTransparent),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.to(()=>PhoneVerification());
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              AppColors.kLightGreen,
                              AppColors.kGreen,
                            ],
                          ),
                          color: AppColors.kBlueGoogleSign,
                          borderRadius: BorderRadius.circular(25)),
                      width: width * 0.80,
                      height: height * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.call,
                                  color: AppColors.kWhite,
                                ),
                              )),
                          Text(
                            'Phone',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kWhite),
                          ),
                          Text(
                            'Google',
                            style: TextStyle(color: AppColors.kTransparent),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
