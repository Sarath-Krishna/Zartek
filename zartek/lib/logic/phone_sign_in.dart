import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zartek/ui/home_page.dart';
import 'package:zartek/utils/colors.dart';

class PhoneSignIn extends ChangeNotifier {
  late String _verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String ind = '+91';

  void verifyPhoneNumber(String PhoneNumber) async {
    //Callback for when the user has already previously signed in with this phone number on this device
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      // showSnackbar("Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
    };
    //Listens for errors with verification, such as too many attempts
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      // showSnackbar('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };
    //Callback for when the code is sent
    PhoneCodeSent codeSent =
        (String verificationId, int? forceResendingToken) async {
      // showSnackbar('Please check your phone for the verification code.');
      _verificationId = verificationId;
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      // showSnackbar("verification code: " + verificationId);
      _verificationId = verificationId;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '${ind}${PhoneNumber}',
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      // showSnackbar("Failed to Verify Phone Number: ${e}");
    }
  }

  void signInWithPhoneNumber(String smsController) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsController,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", true).whenComplete(() =>  Get.to(()=>const HomePage()));

      // showSnackbar("Successfully signed in UID: ${user.uid}");
    } catch (e) {
      // showSnackbar("Failed to sign in: " + e.toString());
      Get.snackbar('Incorrect OTP', 'Please check your entered OTP',
          backgroundColor: AppColors.kRed, snackPosition:SnackPosition.BOTTOM,colorText: Colors.white);
      Get.to(()=>HomePage());
    }
  }

}