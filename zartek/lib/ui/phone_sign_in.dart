import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zartek/ui/home_page.dart';
import 'package:zartek/utils/colors.dart';
import 'package:get/get.dart';
class PhoneAuthForm extends StatefulWidget {
  const PhoneAuthForm({Key? key}) : super(key: key);

  @override
  _PhoneAuthFormState createState() => _PhoneAuthFormState();
}

class _PhoneAuthFormState extends State<PhoneAuthForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();

  OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.kLightGreen, width: 3.0));

  bool isLoading = false;

  String? verificationId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(title: const Text("Verify OTP"),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.blue),),
        backgroundColor: AppColors.kWhite,
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneNumber,
                      decoration: InputDecoration(
                        labelText: "Enter Phone",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        border: border,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: otpCode,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Otp",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      border: border,
                      suffixIcon: const Padding(
                        child: Icon(Icons.add_ic_call_outlined,
                          size: 15,
                        ),
                        padding: EdgeInsets.only(top: 15, left: 15),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
                !isLoading
                    ? SizedBox(
                  width: size.width * 0.8,
                  child: OutlinedButton(
                    onPressed: () async {
                      // FirebaseService service = FirebaseService();
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await phoneSignIn(phoneNumber: phoneNumber.text);
                      }
                    },
                    child: const Text('Sign in'),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            AppColors.kGreen),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.kBlueGoogleSign),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                  ),
                )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        ));
  }
  Future<void> phoneSignIn({required String phoneNumber}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      otpCode.text = authCredential.smsCode!;
    });
    if (authCredential.smsCode != null) {
      try{
        UserCredential credential =
        await user!.linkWithCredential(authCredential);
      }on FirebaseAuthException catch(e){
        if(e.code == 'provider-already-linked'){
          await _auth.signInWithCredential(authCredential);
        }
      }
      setState(() {
        isLoading = false;
      });
     Get.to(()=>const HomePage());
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      showMessage("The phone number entered is invalid!");
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    print(forceResendingToken);
    print("code sent");
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        }).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }
}