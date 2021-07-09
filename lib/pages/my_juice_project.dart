import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:juiceapplication/widgets/infos_widget.dart';

import 'package:juiceapplication/models/infos_model.dart';

class MyJuiceApp extends StatefulWidget {
  @override
  _MyJuiceAppState createState() => _MyJuiceAppState();
}

class _MyJuiceAppState extends State<MyJuiceApp>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  myMethod() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myMethod();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          centerTitle: true,
          leading: Icon(Icons.arrow_back),
          actions: [
            Icon(Icons.notifications),
          ],
          title: Text(
            'JuiceBar',
            style: TextStyle(
                color: Color(0XFFA4A4A4),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Text(
                  'Smoothies',
                  style: TextStyle(
                      color: Color(0XFFA4A4A4),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Tab(
                  child: Text(
                'Pastry',
                style: TextStyle(
                    color: Color(0XFFA4A4A4),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )),
              Tab(
                  child: Text(
                'IceMix',
                style: TextStyle(
                    color: Color(0XFFA4A4A4),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ))
            ],
          )),
      body: TabBarView(
        controller: tabController,
        children: [
          Row(children: [
            SizedBox(
              height: 950,
              width: 390,
              child: ListView.builder(
                  itemCount: InfosModel.info.length,
                  itemBuilder: (context, index) {
                    return InfosWidget(
                      fruit: InfosModel.info[index].fruit,
                      price: InfosModel.info[index].price,
                      color: InfosModel.info[index].color,
                      imageUrl: InfosModel.info[index].imageUrl,
                      gradientColor: InfosModel.info[index].gradientColor,
                      index: index,
                    );
                  }),
            ),
          ]),
          Row(children: [
            SizedBox(
              height: 950,
              width: 390,
              child: ListView.builder(
                  itemCount: InfosModel.pastryiInfo.length,
                  itemBuilder: (context, index) {
                    return InfosWidget(
                      fruit: InfosModel.pastryiInfo[index].fruit,
                      price: InfosModel.pastryiInfo[index].price,
                      color: InfosModel.pastryiInfo[index].color,
                      imageUrl: InfosModel.pastryiInfo[index].imageUrl,
                      gradientColor: InfosModel.pastryiInfo[index].gradientColor,
                    );
                  }),
            ),
          ]),
          Row(children: [
            SizedBox(
              height: 950,
              width: 390,
              child: ListView.builder(
                  itemCount: InfosModel.info.length,
                  itemBuilder: (context, index) {
                    return InfosWidget(
                      fruit: InfosModel.info[index].fruit,
                      price: InfosModel.info[index].price,
                      color: InfosModel.info[index].color,
                      imageUrl: InfosModel.info[index].imageUrl,
                      gradientColor: InfosModel.info[index].gradientColor,
                    );
                  }),
            ),
          ])
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          tabController.animateTo(index);
          this.index = index;
          setState(() {
                      
                    });
        },
        currentIndex: index,
        fixedColor: Color(0XFFA4A4A4),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ' '),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ' '),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user),label: ' '),
        ],
      ),
    );
  }
}
        
        
        
        
        
  
        // body: Row(
        //   children: [
        
        //      Column(
        //        children: [
        //          SizedBox(
        //            height: 600,
        //            child: Expanded(
        //              child: ListView.builder(
        //                   itemCount: InfosModel.info.length,
        //                   itemBuilder: (context, index) {
        //                     return InfosWidget(
        //                         fruit: InfosModel.info[index].fruit,
        //                         price: InfosModel.info[index].price,
        //                         color: InfosModel.info[index].color);
        //                   }),
        //            ),
        //          ),
        //        ],
        //      )  ,
 
        //   Column(
        //     children: [
        //     SizedBox(
        //       height: 600,
        //        child: Expanded(
        //           child: ListView.builder(
        //                     itemCount: ImagesModel.images.length,
        //                     scrollDirection: Axis.vertical,
        //                     itemBuilder: (context, index) {
        //                       return ImagesWidget(
        //                         imageUrl: ImagesModel.images[index].imageUrl,
        //                       );
                    
        //                      } ),
        //         ),
        //      ),
        //     ],
        //   )
        //   ],
        // ));
 
  
