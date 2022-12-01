import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:project_learning_g2/model/product_model.dart';
import 'package:project_learning_g2/provider/product_provider.dart';
import 'package:provider/provider.dart';

// import 'model/productCart_model.dart';


class ProductListPage extends StatefulWidget {
  ProductListPage({Key? key}) : super(key: key);


  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool showGrid = true;
  List<ProductModel> listCart = [];
  String? image;
  String? title;
  String? price;
  String? description;


  // List<ProductCartModel> listCartDetail = [];
  int quantity = 1;
  num total = 0;


  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getList();

    return Scaffold(
        body: Column(
          children: [
            // Category
            Container(
              color: Colors.black,
              child: buildCategory(context),
            ),
            // Navigation
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.white,
              child: buildSearch(context, productProvider),
            ),
            // View List or Grid
            Container(
              // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(2, 4), // Shadow position
                  ),
                ],
              ),
              child: buildView(context),
            ),


            buildProduct_Grid(context, productProvider),
            // showGrid? buildProduct_Grid(context, productProvider):buildProduct_List(context, productProvider),
          ],
        )
    );
  }


  buildCategory(BuildContext context) {
    ProductProvider category = Provider.of<ProductProvider>(context);
    category.getList();
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...category.list.map((e) {
              return Container(
                  margin: EdgeInsets.all(5),
                  child: TextButton(onPressed: () {},
                      child: Text('${e.category}     |'.toUpperCase(),
                          style: TextStyle(color: Colors.white)))
              );
            })
          ],
        ),
      ),
    );
  }

  buildSearch(BuildContext context, var productProvider) {
    var _formKey = GlobalKey<
        FormState>(); // _formKey Để lưu trữ trạng thái của TextFormField
    var _searchController = TextEditingController();
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ô Search
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
              child: Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Search is Empty!";
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text("Search", style: TextStyle(color: Colors.white)),
                    prefixIcon: Icon(Icons.search),
                  ),
                  controller: _searchController,
                ),
              ),
            ),
            // Min, Max, Cart
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // MIN
                    Container(
                      child: IconButton(
                          onPressed: () {
                            return productProvider.list.sort((a, b) =>
                                a.price.compareTo(b.price));
                          },
                          icon:  const Icon(Icons.arrow_downward),
                      ),
                      // padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    // MAX
                    Container(
                      child: IconButton(
                          onPressed: () {},
                          icon:  const Icon(Icons.arrow_upward),
                      ),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    // CART
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // tư làm
                            },
                            icon: const Icon(Icons.shopping_cart, color: Colors.black),
                          ),
                          Container(
                            // padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(listCart.length.toString(),
                              style: TextStyle(color: Colors.white,),),
                          ),
                        ]
                      ),
                    ),
                    // const SizedBox(width: 0.01,),

                  ],
                )
            ),
          ]
      ),
    );
  }

  buildView(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 10,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.black),
            ),
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: TextButton(onPressed: () {
              setState(() {
                showGrid = true;
              });

            },child: const Icon(Icons.grid_3x3, color: Colors.black,)),
          ),
          const SizedBox(width: 20,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.black),
            ),
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: TextButton(onPressed: () {
              setState(() {
                showGrid = false;
              });
            }, child: const Icon(Icons.list_alt, color: Colors.black,)),
          ),
        ],
      ),
    );
  }


  buildProduct_Grid(BuildContext context, var productProvider) {
    productProvider.getList();
    return Expanded(
      child: Container(
        color: Colors.black,
        child: GridView.count(
          childAspectRatio: MediaQuery
              .of(context)
              .size
              .width / (MediaQuery
              .of(context)
              .size
              .height / 1.2),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(10),
          children: [
            ...productProvider.list.map((e) {
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(1, 2), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>buildDetail(context)));
                        },
                        child: Column(
                          children: [
                            OutlinedButton(
                                onPressed: (){
                                  image=e.image.toString();
                                  title=e.title.toString();
                                  price=e.price.toString();
                                  description=e.description.toString();
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>buildDetail(context)));
                                },
                                child: Image.network(
                                  e.image ?? "", width: 100, height: 100,),
                            ),

                            SizedBox(height: 30),
                            Text(e.title ?? "", style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,),
                          ],
                        )
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$ ${e.price}", overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.black54,),),
                        TextButton(
                            onPressed: () {
                              //tự làm
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.red,
                              ),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                children: const [
                                  Text("Add  ", overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(color: Colors.white),),
                                  Icon(Icons.add_shopping_cart,
                                      color: Colors.white),
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }

  buildDetail(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RETURN'),
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          SizedBox(height: 50,),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(

                    border: Border.all(width: 0.5, color: Colors.black),

                  ),
                  child: Image.network('$image', width: 200, height: 200,)),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text('$title')),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text('$price')),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text('$description')),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => buildCart(context)),
                  );
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text(
                      ' ADD TO CARD', style: TextStyle(color: Colors.white)),
                ),

              )


            ],
          )
        ],

      ),

    );
  }

  buildCart(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('RETURN'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
           Row(
              children:[
                 Container(
                 padding: EdgeInsets.all(10),
                 child: Image.network('$image', width: 100, height: 100,),
                 ),

                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Container(
                       padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                       child: Text('$title'),),
                     Container(
                       padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                       child: Text('$price'),),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                       Container(
                         child: IconButton(
                           onPressed: (){},
                           iconSize: (10),
                           icon: Icon(Icons.remove ),
                         ),
                         ),
                       Container(
                        decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black ),
    ),


                         child: Text('1'),
                       ),
                       Container(
                         child: IconButton(
                           onPressed: (){},
                           iconSize: (10),
                           icon:  Icon(Icons.add),
                         ),
                       ),
                       Container(
                         child: IconButton(
                           onPressed: (){},
                           iconSize: (20),
                           icon: Icon(Icons.delete),

                         ),
                       ),
                     ],
                     ),
                   Column(
                     children: [
                       Container(
                         child: TextButton(
                           onPressed: (){},
                           child: Text('THANH TOÁN',style: TextStyle(color: Colors.red),),

                         ),
                       ),
                     ],
                   ),
                   ],
               ),

                 ),
              ],
           ),



        ],
      ),
    );
  }



}
