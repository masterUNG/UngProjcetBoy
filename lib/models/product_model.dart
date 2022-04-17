// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String Title;
  final String Pid;
  final String Image;
  final String Cashback;
  final String Description;
  final String Condition;
  final String Category;
  final String Ship;
  final String? urlProduct;
  ProductModel({
    required this.Title,
    required this.Pid,
    required this.Image,
    required this.Cashback,
    required this.Description,
    required this.Condition,
    required this.Category,
    required this.Ship,
    this.urlProduct,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Title': Title,
      'Pid': Pid,
      'Image': Image,
      'Cashback': Cashback,
      'Description': Description,
      'Condition': Condition,
      'Category': Category,
      'Ship': Ship,
      'urlProduct': urlProduct,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      Title: (map['Title'] ?? '') as String,
      Pid: (map['Pid'] ?? '') as String,
      Image: (map['Image'] ?? '') as String,
      Cashback: (map['Cashback'] ?? '') as String,
      Description: (map['Description'] ?? '') as String,
      Condition: (map['Condition'] ?? '') as String,
      Category: (map['Category'] ?? '') as String,
      Ship: (map['Ship'] ?? '') as String,
      urlProduct: map['urlProduct'] ?? '',
    );
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
