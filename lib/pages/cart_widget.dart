import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juiceapplication/models/infos.dart';
import 'package:juiceapplication/models/infos_model.dart';
import 'package:juiceapplication/widgets/order_widget.dart';


// ignore: must_be_immutable
class CartWidget extends StatelessWidget {
  Infos info;
 

  CartWidget({this.info});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
          leading: Icon(Icons.arrow_back),
          actions: [
            Icon(Icons.notifications),
          ],
        ),
        body: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Container(
            color: Color(0XFFEDEDED),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('hello'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/2,
                      child: ListView.builder(
                          itemCount: InfosModel.info.length,
                          itemBuilder: (context, index) {
                            return OrderWidget(info: InfosModel.info[index]);
                          }),
                    ),
                  ],
                ),
                Container(
                  color: Color(0XFFFFFFFF),
                  height: MediaQuery.of(context).size.height/2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Your Orders',
                            style: TextStyle(
                                color: Color(0XFF585858),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('Bill Total',
                                  style: TextStyle(color: Color(0XFF585858))),
                            ],
                          ),
                          Column(
                            children: [
                              Text(' ') //dummy
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('Discount',
                                  style: TextStyle(color: Color(0XFF585858))),
                            ],
                          ),
                          Column(
                            children: [
                              Text(' ') //dummy data
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('Grand Total',
                                  style: TextStyle(color: Color(0XFF585858))),
                            ],
                          ),
                          Column(children: [
                            Text(' ') //dummy data
                          ]),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80)),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Color(info.gradientColor),
                                padding: EdgeInsets.all(20),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Color(info.gradientColor),
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(30)),
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              child: Text('Proceed to Pay'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
