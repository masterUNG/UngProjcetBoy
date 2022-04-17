// ignore_for_file: invalid_return_type_for_catch_error, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungproject/states/create_account.dart';
import 'package:ungproject/states/my_service.dart';
import 'package:ungproject/utility/my_constant.dart';
import 'package:ungproject/utility/my_dialog.dart';
import 'package:ungproject/widgets/show_button.dart';
import 'package:ungproject/widgets/show_form.dart';
import 'package:ungproject/widgets/show_image.dart';
import 'package:ungproject/widgets/show_text.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShowImage(
          path: 'images/image2.png',
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 72,
            ),
            ShowText(
              label: 'Ung Project',
              textStyle: MyConstant().h1Style(),
            ),
            Row(
              children: [
                ShowForm(
                  label: 'Email : ',
                  icon: Icons.email_outlined,
                  changeFunc: (String string) => email = string.trim(),
                ),
                const SizedBox(
                  width: 16,
                ),
                ShowForm(
                  obscu: true,
                  label: 'Password :',
                  icon: Icons.lock_outline,
                  changeFunc: (String string) => password = string.trim(),
                ),
              ],
            ),
            SizedBox(
              width: 516,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShowButton(
                    label: 'SignIn',
                    pressFunc: () {
                      if ((email?.isEmpty ?? true) ||
                          (password?.isEmpty ?? true)) {
                        MyDialog(context: context).normalDialog(
                            title: 'Have Space ?',
                            message: 'Please Fill Every Blank');
                      } else {
                        processCheckAuthen();
                      }
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ShowButton(
                    label: 'SignUp',
                    pressFunc: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccount(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> processCheckAuthen() async {
    print('email = $email, password = $password');
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) => Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => const MyService(),), (route) => false))
        .catchError((onError) => MyDialog(context: context)
            .normalDialog(title: onError.code, message: onError.message));
  }
}
