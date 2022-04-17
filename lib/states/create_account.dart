// ignore_for_file: invalid_return_type_for_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungproject/models/user_model.dart';
import 'package:ungproject/utility/my_constant.dart';
import 'package:ungproject/utility/my_dialog.dart';
import 'package:ungproject/widgets/show_button.dart';
import 'package:ungproject/widgets/show_form.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? name, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Account'),
        backgroundColor: MyConstant.primary,
      ),
      body: Container(
        decoration: MyConstant().bgBox(),
        child: Center(
          child: Column(
            children: [
              ShowForm(
                label: 'Display Name :',
                icon: Icons.fingerprint,
                changeFunc: (String string) => name = string.trim(),
              ),
              ShowForm(
                label: 'Email :',
                icon: Icons.email_outlined,
                changeFunc: (String string) => email = string.trim(),
              ),
              ShowForm(
                label: 'Password :',
                icon: Icons.lock_outline,
                changeFunc: (String string) => password = string.trim(),
              ),
              ShowButton(
                label: 'Create New Account',
                pressFunc: () {
                  print('name = $name, email = $email, password = $password');

                  if ((name?.isEmpty ?? true) ||
                      (email?.isEmpty ?? true) ||
                      (password?.isEmpty ?? true)) {
                    print('Have Space');
                    MyDialog(context: context).normalDialog(
                        title: 'Have Space ?',
                        message: 'Please Fill Every Blank');
                  } else {
                    print('No Space');
                    processCreateNewAccountAndInsertData();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> processCreateNewAccountAndInsertData() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) async {
      String uid = value.user!.uid;
      print('Success Create Account uid => $uid');

      UserModel userModel =
          UserModel(email: email!, name: name!, password: password!);
      Map<String, dynamic> data = userModel.toMap();

      await FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .set(data)
          .then((value) => Navigator.pop(context));
          
    }).catchError((onError) => MyDialog(context: context)
            .normalDialog(title: onError.code, message: onError.message));
  }
}
