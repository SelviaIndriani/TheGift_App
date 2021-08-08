import 'package:flutter/material.dart';
import 'package:the_gift/detail_flower.dart';
import 'package:the_gift/model/flowers_data.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.local_florist, color: Color(0xFFFDAFDE),),
                Text('The Gift',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold, fontFamily: 'Averta',),),
                IconButton(
                    icon: Icon(Icons.shopping_basket, color: Color(0xFFFDAFDE),),
                    onPressed: (){
                    }),
                ],
          ),
        ),
        body:

        Container(
           child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth <= 600) {
                  return FlowersGrid(gridCount: 2);
                } else if (constraints.maxWidth <= 1200) {
                  return FlowersGrid(gridCount: 4);
                } else {
                  return FlowersGrid(gridCount: 6);
                }
              },
            ),
        ),

    );
  }
}

class FlowersGrid extends StatelessWidget {
  final int gridCount;

  FlowersGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: flowersDataList.map((flower) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailFlower(flower: flower);
                }));
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Color(0xFFFFE0EF),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(
                        spreadRadius: 1,
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2
                    )
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        flower.imageAssets,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Center(
                        child: Text(flower.name, style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'Averta',
                        ),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Center(
                        child: Text(flower.price, style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}