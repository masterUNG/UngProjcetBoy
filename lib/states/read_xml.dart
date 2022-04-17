import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ungproject/models/promotion_model.dart';
import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

class ReadXML extends StatefulWidget {
  const ReadXML({Key? key}) : super(key: key);

  @override
  State<ReadXML> createState() => _ReadXMLState();
}

class _ReadXMLState extends State<ReadXML> {
  String? stringXML;
  XmlDocument? document;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myReadXml();
  }

  Future<void> myReadXml() async {
    stringXML = await rootBundle.loadString('banner_165_802_promotion.xml');

    Xml2Json xml2json = Xml2Json();

    xml2json.parse(stringXML!);

    // print('## 17apr3 toParker ===>> ${xml2json.toParker()}');

    var map1 = json.decode(xml2json.toParker());
    var result1 = map1['PaginatedResultSetOfLinkDto'];
    // print('result1 ==> $result1');
    var result2 = result1['Results'];
    // print('result2 == $result2');
    var result3 = result2['LinkDto'];
    // print('result3 == $result3');

    for (var item in result3) {
      // print('item ======>>> $item');
      PromotionModel promotionModel = PromotionModel.fromMap(item);
      print('LinkId ==>> ${promotionModel.LinkId}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read XML'),
      ),
    );
  }
}
