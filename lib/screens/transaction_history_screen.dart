import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qnb_transaction_history_ui/widgets/date_picker_button.dart';
import 'package:qnb_transaction_history_ui/widgets/dialog_box.dart';
import 'package:qnb_transaction_history_ui/widgets/list_view.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  int change = 0;

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
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

  dialog() {
    return DialogBox(
      stateChange: () {
        setState(() {
          if (change == 1) {
            change = 0;
          } else {
            change = 1;
          }
        });
      },
    );
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
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Color(0xffEEEEEE),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DatePickerButton(
                          text: "${selectedDate.toLocal()}".split(' ')[0],
                          onButtonPress: () {
                            _selectDate(context);
                          },
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
                          onButtonPress: () {
                            _selectDate(context);
                          },
                        ),
                        SizedBox(
                          width: 25,
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
                    child: Container(
                      child: Scaffold(
                        body: MakeList(
                          changeStateMain: () {
                            setState(() {
                              if (change == 0) {
                                change = 1;
                              } else {
                                change = 0;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          change == 1 ? dialog() : Container()
        ],
      ),
    );
  }
}
