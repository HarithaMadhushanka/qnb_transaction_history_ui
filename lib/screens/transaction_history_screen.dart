import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qnb_transaction_history_ui/widgets/date_picker_button.dart';
import 'package:qnb_transaction_history_ui/widgets/list_view.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xffffffff),
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        backgroundColor: Color(0xffB30060),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              CupertinoIcons.back,
              color: Color(0xffffffff),
            ),
            Text(
              'Back',
              style: TextStyle(
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
        middle: Text(
          'Transaction History',
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color(0xffEEEEEE),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: DatePickerButton(
                        text: "${selectedDate.toLocal()}".split(' ')[0],
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xffB30060),
                      size: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    DatePickerButton(
                      text: "${selectedDate.toLocal()}".split(' ')[0],
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RaisedButton(
                      onPressed: () {}, //onPressed Function
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey),
                      ),
                      child: Text(
                        'Credit',
                        style: TextStyle(
                          color: Color(0xffB30060),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25,
                width: 80,
                margin: EdgeInsets.fromLTRB(30, 20, 0, 20),
                child: RaisedButton(
                  color: Color(0xffB30060),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.grey),
                  ),
                  child: Text(
                    'Today',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Scaffold(
                  body: Container(
                    child: MakeList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
