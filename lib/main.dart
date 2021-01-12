import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qnb_transaction_history_ui/screens/transaction_history_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      theme: CupertinoThemeData(
        primaryColor: Color(0xffffffff),
      ),
      home: TransactionHistoryScreen(),
    );
  }
}
