// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ungproject/models/product_model.dart';
import 'package:ungproject/states/show_web_view_product.dart';
import 'package:ungproject/utility/my_constant.dart';
import 'package:ungproject/widgets/show_button.dart';
import 'package:ungproject/widgets/show_text.dart';

class ShowDetailProduct extends StatelessWidget {
  final ProductModel productModel;
  const ShowDetailProduct({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(productModel.Image),
              ShowText(
                label: productModel.Title,
                textStyle: MyConstant().h2Style(),
              ),
              ShowButton(
                label: 'Shop Now',
                pressFunc: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowWebViewProduct(productModel: productModel,),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
