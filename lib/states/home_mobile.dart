import 'package:flutter/material.dart';
import 'package:ungproject/states/create_account.dart';
import 'package:ungproject/utility/my_constant.dart';
import 'package:ungproject/widgets/show_button.dart';
import 'package:ungproject/widgets/show_form.dart';
import 'package:ungproject/widgets/show_image.dart';
import 'package:ungproject/widgets/show_text.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const ShowImage(
            path: 'images/image2.png',
          ),
          ShowText(
            label: 'Ung Project',
            textStyle: MyConstant().h1Style(),
          ),
          ShowForm(
            label: 'Email :',
            icon: Icons.email_outlined,
            changeFunc: (String string) {},
          ),
          ShowForm(
            obscu: true,
            label: 'Password :',
            icon: Icons.lock_outline,
            changeFunc: (String string) {},
          ),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShowButton(
                  label: 'SignIn',
                  pressFunc: () {},
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
          )
        ],
      ),
    );
  }
}
