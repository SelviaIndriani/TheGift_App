import 'package:flutter/material.dart';

import 'model/flowers_data.dart';

class MainCart extends StatelessWidget {
  final FlowersData flower;

  MainCart({required this.flower});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Flowers', style: TextStyle(color: Colors.black54),),
        backgroundColor: Color(0xFFFFE0EF),
      ),

    body: SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            Expanded(
            flex: 2,
            child:  Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(flower.imageAssets),
                    fit: BoxFit.fitHeight,)
              ),
            ),
            ),
          Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      flower.name,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(flower.price),
                  ],
                ),
              ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text('x 1',),
            )

          )
            ],
          ),
          ),
        ),
      ),

        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color(0xFFFFC9E3),
          foregroundColor: Colors.black54,
          onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content:
                        Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: Icon(Icons.check_circle_outline, color: Color(0xFFFFC9E3), size: 50,),

                                ),
                                Container(
                                  height: 80,
                                  child: Center(
                                    child: Text('Successfully Checkout', style: TextStyle(color: Colors.black54,
                                      fontFamily: 'Averta',)
                                    ),
                                  ),
                                ),
                              ],
                            ))
                    );
                  });
          },
          icon: Icon(Icons.shopping_basket_outlined),
          label: Text('Checkout'),
        )

    );
  }
}