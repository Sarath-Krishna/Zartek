import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:zartek/logic/phone_sign_in.dart';
import 'package:zartek/utils/colors.dart';


class PhoneVerification extends StatefulWidget {


  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();

}

class _PhoneVerificationState extends State<PhoneVerification> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  late String _verificationId;
  final SmsAutoFill _autoFill = SmsAutoFill();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(labelText: 'Enter 10 Digit Phone number'),
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   alignment: Alignment.center,
              //   child: RaisedButton(child: Text("Get current number"),
              //       onPressed: () async => {
              //         _phoneNumberController.text = (await _autoFill.hint)!
              //       },
              //       color: Colors.greenAccent[700]),
              // ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: RaisedButton(
                  color: AppColors.kBlueGoogleSign,
                  child: Text("Send OTP",style: TextStyle(color: AppColors.kWhite),),
                  onPressed: () async {
                    Provider.of<PhoneSignIn>(context,listen: false).verifyPhoneNumber(_phoneNumberController.text);
                  },
                ),
              ),
              TextFormField(
                controller: _smsController,
                decoration: const InputDecoration(labelText: 'Enter Received OTP'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.center,
                child: RaisedButton(
                    color: AppColors.kBlueGoogleSign,
                    onPressed: () async {
                      Provider.of<PhoneSignIn>(context,listen: false).signInWithPhoneNumber(_smsController.text);
                    },
                    child: Text("Verify OTP",style: TextStyle(color: AppColors.kWhite),)),
              ),
            ],
          ),
        )
    );
  }


}