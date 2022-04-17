import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ungproject/models/product_model.dart';
import 'package:ungproject/models/user_model.dart';
import 'package:ungproject/states/show_detail_prodict.dart';
import 'package:ungproject/utility/my_constant.dart';
import 'package:ungproject/widgets/show_text.dart';
import 'package:url_launcher/url_launcher.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  bool load = true;
  UserModel? userModel;
  var productModels = <ProductModel>[];

  @override
  void initState() {
    super.initState();
    readDataUser();
    readJsonData();
  }

  Future<void> readJsonData() async {
    if (productModels.isNotEmpty) {
      productModels.clear();
    }

    String jsonString = await rootBundle.loadString('retailer_web3.json');

    for (var item in json.decode(jsonString)) {
      Map<String, dynamic> map = item;
      map['urlProduct'] = 'https://bit.ly/3vnVfVR';

      // print('map =======>>> $map');

      ProductModel productModel = ProductModel.fromMap(map);
      productModels.add(productModel);
    }

    setState(() {});
  }

  Future<void> readDataUser() async {
    var user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    print('uid ==> $uid');

    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .get()
        .then((value) {
      print('value ==> ${value.data()}');
      load = false;

      userModel = UserModel.fromMap(value.data()!);

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Service'),
      ),
      body: load
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  newTitle(head: 'Name :', value: userModel!.name),
                  newTitle(head: 'Email :', value: userModel!.email),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: productModels.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowDetailProduct(productModel: productModels[index],),
                          ),
                        );
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ShowText(
                                    label: productModels[index].Title,
                                    textStyle: MyConstant().h1Style(),
                                  ),
                                  ShowText(
                                      label: productModels[index].urlProduct!),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Image.network(productModels[index].Image),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Row newTitle({required String head, required String value}) {
    return Row(
      children: [
        ShowText(
          label: head,
          textStyle: MyConstant().h2Style(),
        ),
        ShowText(label: value),
      ],
    );
  }
}