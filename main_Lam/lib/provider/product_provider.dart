import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:project_learning_g2/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{
  List<ProductModel> list =[];


  void getList() async{
    //lay ds san pham tu fakestoreAPI
    String urlAPI = "https://fakestoreapi.com/products";
    var client = http.Client();
    var rs = await client.get(Uri.parse(urlAPI));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;
    list = jsonObject.map((e){
      return ProductModel(
        id: e['id'],
        title: e['title'],
        description: e['description'],
        price: e['price'],
        image: e['image'],
        category: e['category'],

      );
    }).toList();

    notifyListeners();
  }
}