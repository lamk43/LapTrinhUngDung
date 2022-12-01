import 'package:flutter/material.dart';

class Place {
  String image;
  String name;
  int evalute;
  String description;

  Place(this.image, this.name, this.evalute, this.description);
}

class Food extends StatelessWidget {
  Food({Key? key}) : super(key: key);
  
  List<Place> place = [
    new Place("assets/images/food/place1.png", 'Sushi Den', 5, 'Lorem ipsum sits dolar amet is for publishing'),
    new Place("assets/images/food/place2.png", 'Hatsuhana Sushi', 5, 'Lorem ipsum sits dolar amet is for publishing'),
    new Place("assets/images/food/place3.png", 'Other', 4, 'Lorem ipsum sits dolar amet is for publishing'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNav(context),
              SizedBox(height: 20,),
              buildHeader(context),
              SizedBox(height: 30,),
              buildText(context),
              SizedBox(height: 30,),
              buildGrid(context),
              SizedBox(height: 40,),
              buildPlace(context),
              buildList(context),
            ],
          ),
        ),
      ),
    );
  }

  buildNav(BuildContext context) {
    return SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          ],
        )
    );
  }

  buildHeader(BuildContext context) {
    return SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Today's Special", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.add_shopping_cart),
                      Text("CART", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
            ),
          ],
        ),
    );
  }

  buildText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Find out what's cooking today!", style: TextStyle(color: Colors.grey, fontSize: 16),),
      ],
    );
  }

  buildGrid(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width/2,
          padding: EdgeInsets.fromLTRB(14, 50, 14, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage("assets/images/food/sushi.png")),
              SizedBox(height: 30,),
              Text("Yoshimasa Sushi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18,),),
              SizedBox(height: 10,),
              Row(
                children: [
                  for(int i=1; i<=5; i++) Icon(Icons.star, color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("250 Ratings", style: TextStyle(color: Colors.white),),
                ],
              ),
              SizedBox(height: 10,),
              Text("Lorem ipsum is a dummy text used for printing", style: TextStyle(color: Colors.white),),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.lightBlueAccent,
          ),
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2.5,
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage('assets/images/food/sushi1.png')),
                  Text("Yoshimasa Sushi", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      for(int i=1; i<=5; i++) Icon(Icons.star, color: Colors.white,),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.greenAccent,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width/2.5,
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage('assets/images/food/sushi2.png')),
                  Text("Prato Sushi", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      for(int i=1; i<=5; i++) Icon(Icons.star, color: Colors.white,),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black54,
              ),
            ),
          ],
        )
      ],
    );
  }

  buildPlace(BuildContext context) {
    return Row(
      children: [
        Text("Places", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ],
    );
  }

  buildList(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
      child: Column(
        children: [
          ...place.map((e){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage(e.image)),
                SizedBox(width: 15,),
                Row(
                  children: [

                  ],
                ),
                Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: Column(
                      children: [
                        Text(e.name, style: TextStyle(fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            for(int i=1; i<=e.evalute; i++) Icon(Icons.star, color: Colors.orange,),
                          ],
                        ),
                        Text(e.description),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      padding: EdgeInsets.fromLTRB(20, 18, 20, 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Container(
                      child: Text('Oder Now'),
                      // margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    )
                ),
                SizedBox(height: 100,),
              ],
            );
          }),
        ],
      ),
    );
  }

}
