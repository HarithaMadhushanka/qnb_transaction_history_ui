import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_tile_class.dart';

class DialogBox extends StatefulWidget {
  final Function stateChange;
  DialogBox({
    Key key,
    this.stateChange,
  }) : super(key: key);

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          children: [
            Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color(0xffEAEAEA),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 20,
                      blurRadius: 8,
                    ),
                  ],
                  border: Border.all(
                    color: Color(0xffEAEAEA),
                    width: 1,
                  ),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Image(
                        image: AssetImage('images/preview_bg.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                          alignment: Alignment.center,
                          child: ClipOval(
                            child: Image(
                              height: 120,
                              width: 120,
                              image: AssetImage(image),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                          ),
                          child: Text(
                            'Jane Doe to $payee',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage('images/arrow_down.png'),
                                    color: Colors.red,
                                    height: 35,
                                    width: 35,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'QAR $amount',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                left: 25,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textInput: 'TRACE NO: $traceNo',
                                  ),
                                  TextWidget(
                                    textInput: 'REFERENCE NO: $referenceNo',
                                  ),
                                  TextWidget(
                                    textInput: 'DATE: $date',
                                  ),
                                  TextWidget(
                                    textInput: 'TRANSACTION STATUS: $status',
                                  ),
                                  TextWidget(
                                    textInput: 'TYPE: $type',
                                  ),
                                  TextWidget(
                                    textInput: 'DESCRIPTION: $description',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 20,
                      blurRadius: 20,
                      offset: Offset(0, 20), // changes position of shadow
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                  color: Color(0xffEAEAEA),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xffB30060),
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    widget.stateChange();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String textInput;

  const TextWidget({Key key, @required this.textInput}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Text(
        textInput,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
