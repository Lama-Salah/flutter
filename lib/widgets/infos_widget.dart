import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juiceapplication/widgets/image_info_viewer.dart';

import 'package:juiceapplication/models/infos_model.dart';

// ignore: must_be_immutable
class InfosWidget extends StatelessWidget {
  String fruit;
  String price;
  int color;
  String imageUrl;
  int gradientColor;
  int index;
  InfosWidget(
      {this.fruit, this.price, this.color, this.imageUrl, this.gradientColor,this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 76,
                width: 270,
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(gradientColor),
                      Color(color),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Text(
                            fruit,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            price,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ImageInfoViewer(info: InfosModel.info[index]);
                  }));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(
                    imageUrl,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
