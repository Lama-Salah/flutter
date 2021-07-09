import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:juiceapplication/models/payment.dart';
import 'package:juiceapplication/pages/success_payment.dart';


class PaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaymentScreenState();
  }
}

final List<Payment> cardList = [
  Payment('1234  5678 9876  5432', 'James Bone', '03/17', 0xff375ad8),
  Payment('1234  5678 9876  5432', 'James Bone', '03/17', 0xfff4c042),
  Payment('1234  5678 9876  5432', 'James Bone', '03/17', 0xffb74093),
];

final List<Widget> imageSliders = cardList
    .map((item) => Container(
          child: Container(
            width: 1000.0,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Color(cardList[cardList.indexOf(item)].color),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Text(
                          'VISA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Text(
                          '${cardList[cardList.indexOf(item)].number}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Text(
                          '${cardList[cardList.indexOf(item)].name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Text(
                          '${cardList[cardList.indexOf(item)].date}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class _PaymentScreenState extends State<PaymentScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
            onPressed: () {
              // do something
            },
          )
        ],),
      body: Column(children: [
        // Expanded( child:
        Container(
          margin: EdgeInsets.only(top: 16),
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cardList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 25.0 : 20.0,
                height: _current == entry.key ? 5.0 : 3.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    shape: BoxShape.rectangle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.grey)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Center(
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: InkWell(
                  onTap: () {
                    print('Card tapped');
                  },
                  child: Container(
                    width: 320,
                    height: 350,
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      top: 32, left: 16, right: 16, bottom: 16),
                                  child: Text(
                                    'Payment options',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Credit/Debit Card',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Payment Gateways',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Cash On Delivery',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40))),
                            padding: EdgeInsets.symmetric(
                                vertical: 30.0, horizontal: 50.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(children: [
                                        Text(
                                          'Payment Amount',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 8.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ]),
                                      Row(children: [
                                        Text(
                                          '\$150.00',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ])
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                      children: [
                                          TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return SuccessPayment();
                                          }));
                                        },
                                        child: Text(
                                          'Pay',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
