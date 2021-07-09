import 'package:flutter/material.dart';
class SuccessPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:  Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Center(child: Icon(Icons.check_circle,color: Color(0XFF97DEB4),size: 90,)),
          Center(child: Text('Payment Success!',style: TextStyle(color: Color(0XFF888888),fontSize: 22,fontWeight: FontWeight.bold),))
        ],),
      ),
    );
  }
}