import 'package:flutter/material.dart';
import 'package:juiceapplication/dataBase/db_helper.dart';

class Cart {
  int id;
  Icon icon;
  String liter;
  String price;
  String quality;
  int count;
  String name;

  Cart(
      {this.id,this.name, this.icon, this.liter, this.price, this.count, this.quality});

  toMap() {
    return {DBHelper.idColumn:id,DBHelper.iconColumn:icon,DBHelper.literColumn:liter,DBHelper.priceName:price,DBHelper.qualityColumn:quality,DBHelper.nameColumn:name};
  }
}
