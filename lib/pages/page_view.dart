import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:juiceapplication/models/infos.dart';

// ignore: must_be_immutable
class PagesView extends StatefulWidget {
  @override
  _PagesViewState createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {
 
  String img1 = 'assets/images/watermelon.png';
  String img2 = 'assets/images/mango.png';
  String img3 = 'assets/images/grape.png';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
          children:[
            PageView(
      children: [
          Container(
            height: 268,
            width: 238,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 179,
                  width: 176,
                  child: Image.asset(img1,fit: BoxFit.cover,),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "It's availiable in your favourite cities now\n\t \t \t \t \t and they wait go and order\n \t \t \t \t  \t \t \t for favourite juices",
                            style:
                                TextStyle(fontSize: 14, color: Color(0XFFA5A5A5)),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
           Container(
            height: 268,
            width: 238,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 179,
                  width: 176,
                  child: Image.asset(img2,fit: BoxFit.cover,),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            " \t  \t  \t\t Juice is a beverage made from the \n  \t \t extraction or pressing out of natural liquid \n \t \t \t \t  \t \t \t \t contained good quality fruits",
                            style:
                                TextStyle(fontSize: 14, color: Color(0XFFA5A5A5)),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
           Container(
            height: 268,
            width: 238,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 179,
                  width: 176,
                  child: Image.asset(img3,fit: BoxFit.cover,),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                           "    User can look for their favorite juices \n  \t \t and buy it through the online gateway \n  \t \t process or through cash on delivery",
                            style:
                                TextStyle(fontSize: 14, color: Color(0XFFA5A5A5),),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
      ],
    ),

    Align(
      alignment: Alignment(0,0.83),
      child: TextButton(
      child: Text('SKIP'),
      style: TextButton.styleFrom(
        primary: Color(0XFF939393),
      ),
      onPressed: () {
        print('Pressed');
      },
  ),
    )
          ] 
        ));
        
  }
}
