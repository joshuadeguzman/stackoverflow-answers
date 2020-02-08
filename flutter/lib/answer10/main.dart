// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAppScreen(),
    );
  }
}

class MyAppScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppScreenState();
  }
}

class MyAppScreenState extends State<MyAppScreen> {
  Future _futureData;
  TextEditingController _textEditingController;
  int countChange = 0;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _futureData = _loadPhobias();
  }

  Future<List<String>> _loadPhobias() async =>
      await rootBundle.loadString('lib/answer10/phobia.txt').then((phobias) {
        List _listOfAllPhobias = [];
        List<String> _listOfSortedPhobias = [];
        _textEditingController.addListener(() {});
        return _listOfSortedPhobias;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textEditingController,
          onChanged: (text) {
            setState(() {
              _futureData = _loadPhobias();
            });
          },
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: _futureData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print("with data");
              // Do whatever you want after succesfully loading the data
              return Container(
                child: Text("Data succesfully loaded!..."),
              );
            } else {
              print("no data");
              return Container(
                child: Text("No data found..."),
              );
            }
          },
        ),
      ),
    );
  }
}
