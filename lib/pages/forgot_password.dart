import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
       height: 400,
       width: 500,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(padding: EdgeInsets.all(70),child: Text('Forgot Password',style: TextStyle(color:Color(0XFF747474),fontSize: 20),)),
             Spacer(),
            TextField(decoration: InputDecoration(labelText: 'Enter Email ID / Phone Number', border: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(10.0)),),),
    ),
    SizedBox(height: 40,),
   Container(
     height: 60,
     width: 320,
     child: ElevatedButton(
                            onPressed: () {
                           
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0XFFF46186),
                              padding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color(0XFFF46186),
                                      width: 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(30)),
                              textStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            child: Text('Submit',style: TextStyle(color: Colors.white),),
                          ),
   ),
   Spacer(),
          ],
        ),
      )
   );
  }
}
// Column(children: [
        // Text('Forgot Password',style: TextStyle(color:Color(0XFF747474) ),),