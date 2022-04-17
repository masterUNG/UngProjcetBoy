// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ungproject/utility/my_constant.dart';
import 'package:ungproject/widgets/show_text.dart';

class ShowForm extends StatelessWidget {
  final double? width;
  final String label;
  final IconData icon;
  final bool? obscu;
  final Function(String) changeFunc;
  const ShowForm({
    Key? key,
    this.width,
    required this.label,
    required this.icon,
    this.obscu,
    required this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: width ?? 250,
      child: TextFormField(
        onChanged: changeFunc,
        obscureText: obscu ?? false,
        style: MyConstant().h3Style(),
        decoration: InputDecoration(fillColor: Colors.white.withOpacity(0.5),
          filled: true,
          prefixIcon: Icon(
            icon,
            color: MyConstant.dark,
          ),
          label: ShowText(label: label),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: MyConstant.dark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: MyConstant.light),
          ),
        ),
      ),
    );
  }
}
