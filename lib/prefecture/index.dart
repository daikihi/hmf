import 'dart:async'; //非同期処理用

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrefecturesIndex extends StatelessWidget {
  Future<Text> getPrefectures() async {
    String protocol = "http://";
    String hostName = "localhost:8080";
    String address = "/api/v1/prefectures";
    String url = protocol + hostName + address;

    print(url); // for debugging
    final http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        // encoding to utf8
        return (Text(utf8.decode(response.bodyBytes)));
      } else {
        return (Text(response.toString()));
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Center(
              child: FutureBuilder<Text>(
            future: getPrefectures(),
            builder: ((BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return snapshot.data;
              } else {
                return Text(snapshot.error.toString());
              }
            }),
          )),
        ],
      ),
    );
  }
}
