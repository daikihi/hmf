import 'package:flutter/material.dart';
import 'package:hmf/prefecture/index.dart';

class TopIndex extends StatelessWidget {
  final String text;
  TopIndex({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(children: <Widget>[
        Center(child: Text(text)),
        TextButton(
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrefecturesIndex(),
                ))
          },
          child: Text('to prefectrures'),
        )
      ]),
    ));
  }
}
