// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
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
  StreamController<List<String>> _phobiasStream;

  final TextEditingController _textEditingController = TextEditingController();

  void _loadPhobias() async =>
      await rootBundle.loadString('lib/answer10/phobia.txt').then((phobias) {
        List<String> _listOfSortedPhobias = [];
        for (String i in LineSplitter().convert(phobias)) {
          for (String t in _textEditingController.text.split('')) {
            if (i.split('-').first.toString().contains(t)) {
              _listOfSortedPhobias.add(i);
            }
          }
        }
        _phobiasStream.add(_listOfSortedPhobias);
      });

  @override
  void initState() {
    super.initState();
    _phobiasStream = StreamController<List<String>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textEditingController,
          onChanged: (text) {
            print("Text $text");
            _loadPhobias();
          },
        ),
      ),
      body: StreamBuilder(
        stream: _phobiasStream.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      print("Data ${snapshot.data[index]}");
                      return Text(snapshot.data[index]);
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
