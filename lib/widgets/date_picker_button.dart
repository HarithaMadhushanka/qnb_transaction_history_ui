import 'package:flutter/material.dart';

class DatePickerButton extends StatelessWidget {
  final String text;
  final Function onButtonPress;

  const DatePickerButton({@required this.text, @required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey),
      ),
      onPressed: onButtonPress,
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xffB30060),
          fontSize: 15,
        ),
      ),
    );
  }
}
