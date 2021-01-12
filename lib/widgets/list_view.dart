import 'package:flutter/material.dart';

import 'list_tile_class.dart';

class MakeList extends StatelessWidget {
  final Function changeStateMain;
  final List<Map<String, String>> json = [
    {
      "image": "images/pro_pic1.png",
      "payee": "Sam",
      "time": "09:42 pm",
      "amount": "3455.00",
      "trace_no": "1348378",
      "reference_no": "137856786",
      "date": "2020.12.15",
      "status": "COMPLETED",
      "type": "DEBIT",
      "description": "MOLI CARE",
    },
    {
      "image": "images/pro_pic2.png",
      "payee": "Russell",
      "time": "02:24 pm",
      "amount": "5680.00",
      "trace_no": "2785678676",
      "reference_no": "27867867853",
      "date": "2020.12.15",
      "status": "COMPLETED",
      "type": "CREDIT",
      "description": "Facebook",
    },
    {
      "image": "images/pro_pic3.png",
      "payee": "Jack",
      "time": "08:45 am",
      "amount": "2120.00",
      "trace_no": "37867867",
      "reference_no": "3786786786",
      "date": "2020.12.15",
      "status": "COMPLETED",
      "type": "CREDIT",
      "description": "Instagram",
    },
    {
      "image": "images/pro_pic4.png",
      "payee": "Vanessa",
      "time": "06:30 pm",
      "amount": "1360.00",
      "trace_no": "47863753753",
      "reference_no": "478675373",
      "date": "2020.12.15",
      "status": "NOT COMPLETED",
      "type": "DEBIT",
      "description": "Paypal",
    },
  ];

  MakeList({
    this.changeStateMain,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: json.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTileClass(
          jsonObject: json[index],
          changeState: changeStateMain,
        );
      },
    );
  }
}
