import 'package:flutter/material.dart';

import 'list_tile_class.dart';

class MakeList extends StatelessWidget {
  final List<Map<String, String>> json = [
    {
      "image": "images/pro_pic1.png",
      "payee": "Sam",
      "time": "09:42 pm",
      "amount": "3455.00"
    },
    {
      "image": "images/pro_pic2.png",
      "payee": "Russell",
      "time": "02:24 pm",
      "amount": "5680.00"
    },
    {
      "image": "images/pro_pic3.png",
      "payee": "Jack",
      "time": "08:45 am",
      "amount": "2120.00"
    },
    {
      "image": "images/pro_pic4.png",
      "payee": "Vanessa",
      "time": "06:30 pm",
      "amount": "1360.00"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: json.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTileClass(jsonObject: json[index]);
      },
    );
  }
}
