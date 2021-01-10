import 'package:flutter/material.dart';

class ListTileClass extends StatefulWidget {
  final Map<String, String> jsonObject;

  ListTileClass({this.jsonObject});

  @override
  _ListTileClassState createState() => _ListTileClassState();
}

class _ListTileClassState extends State<ListTileClass> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        child: Row(
          children: makeWidgetChildren(widget.jsonObject),
        ),
      ),
    );
  }

  List<Widget> makeWidgetChildren(jsonObject) {
    List<Widget> children = [];
    bool _count = true;
    jsonObject.keys.forEach(
      (key) => {
        setState(() {
          if (_count == true) {
            children.add(
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipOval(
                        child: Image(
                          height: 55,
                          width: 55,
                          image: AssetImage('${jsonObject['image']}'),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.68,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Transferred to ${jsonObject['payee']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Today ${jsonObject['time']}',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'QAR ${jsonObject['amount']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
            _count = false;
          }
        }),
      },
    );
    return children;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
