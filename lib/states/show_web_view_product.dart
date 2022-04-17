// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ungproject/main.dart';

import 'package:ungproject/models/product_model.dart';
import 'package:ungproject/utility/my_constant.dart';
import 'package:ungproject/widgets/show_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWebViewProduct extends StatelessWidget {
  final ProductModel productModel;
  const ShowWebViewProduct({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ShowText(
            label: productModel.Title,
            textStyle: MyConstant().h1Style(),
          ),
          // WebView(
          //   initialUrl: productModel.urlProduct,
          //   javascriptMode: JavascriptMode.unrestricted,
          // ),
        ],
      ),
    );
  }
}
