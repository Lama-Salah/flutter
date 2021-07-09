import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juiceapplication/dataBase/db_helper.dart';
import 'package:juiceapplication/models/Cart.dart';
import 'package:juiceapplication/models/infos.dart';
import 'package:juiceapplication/models/infos_model.dart';
import 'package:juiceapplication/pages/cart_widget.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

// ignore: must_be_immutable
class ImageInfoViewer extends StatefulWidget {
  Infos info;
  int index;
  // String title;
  // int color;
  // int gradientColor;
  // String imageUrl;

  ImageInfoViewer({this.info, this.index});

  @override
  _ImageInfoViewerState createState() => _ImageInfoViewerState();
}

class _ImageInfoViewerState extends State<ImageInfoViewer> {
  @override
  Widget build(BuildContext context) {
    int count = 1;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.info.fruit),
          leading: Icon(Icons.arrow_back),
          actions: [
            GestureDetector(
              child: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CartWidget(
                    info: InfosModel.info[widget.index],
                  );
                }));
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                height: 450,
                width: 320,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(widget.info.gradientColor),
                      Color(widget.info.color),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              alignment: Alignment.center,
                              // child:ClipOval(child: Image.asset(info.imageUrl,fit: BoxFit.cover,)),

                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(widget.info.imageUrl)),
                                  shape: BoxShape.circle),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              widget.info.fruit,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0XFFA4A4A4),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('200ml,',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            SizedBox(
                              width: 5,
                            ),
                            Text('1x50.00',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ]),
                    ),
                    buildDivider(),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                                setState(() {
                                count--;
                              });
                            },
                            child: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: Color(0XFFA4A4A4),
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "$count",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                count++;
                              });
                            },
                            child: Icon(
                              Icons.add_circle_outline_rounded,
                              color: Color(0XFFA4A4A4),
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('100.00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (v) {},
                        starCount: 5,
                        rating: 4.0,
                        size: 40.0,
                        isReadOnly: true,
                        // filledIconData: Icons.blur_off,
                        // halfFilledIconData: Icons.blur_on,
                        color: Color(0XFFF0D355),
                        borderColor: Color(0XFFF0D355),
                        spacing: 0.0)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80)),
                      child: ElevatedButton(
                        onPressed: () {
                          Cart cart = Cart(
                              name: widget.info.fruit,
                              price: widget.info.price,
                              count: count);
                          DBHelper.helper.insertNewTask(cart);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(widget.info.gradientColor),
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(widget.info.gradientColor),
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(30)),
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        child: Text('Add to Cart'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.white60,
        height: 3.0,
        thickness: 6,
      ),
    );
  }
}
