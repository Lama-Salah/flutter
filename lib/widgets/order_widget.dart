import 'package:flutter/material.dart';
import 'package:juiceapplication/models/infos.dart';

// ignore: must_be_immutable
class OrderWidget extends StatelessWidget {
  Infos info;
  OrderWidget({this.info});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0XFFFFFFFF),
      height:150,
      width: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(info.imageUrl)),
                        shape: BoxShape.circle),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [Text(info.fruit)],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0XFFA4A4A4),size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('200ml,',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(
                        width: 5,
                      ),
                      Text('1x50.00 NIS',
                          style: TextStyle(color: Colors.white, fontSize: 18))
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.clear),
                ],
              ),
            ],
          ),
          buildDivider(),
          Container(
            
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_circle_outline_rounded,
                  color: Color(0XFFA4A4A4),
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '2',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.add_circle_outline_rounded,
                  color: Color(0XFFA4A4A4),
                  size: 20,
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
    );
  }

  buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.white60,
        height: 3.0,
        thickness: 3,
        indent: 0.1,
        endIndent: 0.1,
      ),
    );
  }
}
