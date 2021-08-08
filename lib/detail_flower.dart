import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_gift/main_cart.dart';
import 'package:the_gift/model/flowers_data.dart';



class DetailFlower extends StatelessWidget{
  final FlowersData flower;

  DetailFlower({required this.flower});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFFFE0EF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 350,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(flower.imageAssets),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(top: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: flower.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 5.0, right: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                flower.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontFamily: 'Averta',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.0,),
              child: Text(
                flower.price,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                    color: Colors.black54
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(18.0),
              child: Text(
                flower.desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                    color: Colors.black45
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: FavoriteButton(),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Flexible(child: FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      color: Colors.grey,
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content:
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: AssetImage(flower.imageAssets),
                                                fit: BoxFit.cover,)
                                          ),
                                        ),
                                      Container(
                                        height: 80,
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10.0),
                                                child: Text('Successfully added', style: TextStyle(color: Colors.black54,
                                                  fontFamily: 'Averta',)
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                    return MainCart(flower: flower);
                                                  }));
                                                },
                                                child: Text('Open Cart', style: TextStyle(
                                                    fontFamily: 'Averta'),),
                                              ),
                                            ],
                                          ),
                                      ),
                                      ],
                                    ))
                              );
                            });
                      },
                      child: Container(
                        height: 50,
                        child: Center(child: Text("ADD TO CART",style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                        ),
                      )
                  )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}


class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}