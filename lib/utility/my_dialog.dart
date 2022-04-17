// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ungproject/utility/my_constant.dart';
import 'package:ungproject/widgets/show_button.dart';
import 'package:ungproject/widgets/show_image.dart';
import 'package:ungproject/widgets/show_text.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  Future<void> normalDialog(
      {required String title, required String message}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: const ShowImage(
            width: 100,
          ),
          title: ShowText(
            label: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(label: message),
        ),
        actions: [
          ShowButton(label: 'OK', pressFunc: ()=>Navigator.pop(context))
        ],
      ),
    );
  }
}
