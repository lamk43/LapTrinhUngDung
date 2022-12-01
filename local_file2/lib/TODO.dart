import 'package:flutter/material.dart';
import 'package:local_file2/main.dart';

class  TODO extends StatelessWidget {
  const TODO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white,
        title: Row(children:[
          Icon(
           Icons.menu,
           color: Colors.black,
           size: 30,
          ),
          ],)

      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                  prefixIconConstraints:
                    BoxConstraints(maxHeight: 20,maxWidth: 25 ),
                  border: InputBorder.none,
                  hintText: 'Seach'
                ),
              ),
            ),

          ],
        ),
      ),

      );
  }
}

