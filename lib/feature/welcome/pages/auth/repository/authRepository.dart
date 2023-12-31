import 'package:chaten/common/helper/showAlertDialog.dart';
import 'package:chaten/common/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AuthRepositoryProvider = Provider(
  (ref) {
    return AuthRepository(
      auth: FirebaseAuth.instance,
       firestore: FirebaseFirestore.instance,
       );
  });

class AuthRepository{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository(
    {required this.auth,
     required this.firestore});


     void sendSmsCode({
      required BuildContext context,
      required String phoneNumber,
     }) async {
      try {
        await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential)async{
            await auth.signInWithCredential(credential);
          },
         
           verificationFailed: (e){
            showAlertDialog(context: context, massege: e.toString());
           },
            codeSent: (smsCodeId, resendSmsCodeId){
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.verification,
                 (route) => false,
                 arguments: {
                  'phoneNumber' : phoneNumber,
                  'smsCodeId' : smsCodeId,
                 }
                 
                 );
            },
             codeAutoRetrievalTimeout: (String smsCodeId){}
             );
      }on FirebaseAuth catch (e){
        showAlertDialog(context: context, massege: e.toString());
      }
     }
}