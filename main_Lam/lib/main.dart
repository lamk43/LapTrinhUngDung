import 'package:flutter/material.dart';
import 'package:project_learning_g2/BT_2022_09_07.dart';
import 'package:project_learning_g2/1_homepage.dart';
import 'package:project_learning_g2/2_slider.dart';
import 'package:project_learning_g2/BT_2022_09_22.dart';
import 'package:project_learning_g2/GuideToLayout.dart';
import 'package:project_learning_g2/login_page.dart';
import 'package:project_learning_g2/productlist_page.dart';
import 'package:project_learning_g2/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=>ProductProvider()),
        ],
        child: MaterialApp(

          home: ProductListPage(),
        ),//MaterialAPP
      )
  );
}
