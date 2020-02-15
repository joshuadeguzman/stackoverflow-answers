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
      title: 'Flutter Questions',
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
  List<String> _questions = [];

  Future<List<String>> _loadQuestions() async {
    List<String> questions = [];
    await rootBundle.loadString('lib/answer12/questions.txt').then((q) {
      for (String i in LineSplitter().convert(q)) {
        questions.add(i);
      }
    });
    return questions;
  }

  @override
  void initState() {
    _setup();
    super.initState();
  }

  _setup() async {
    // Request for the questions (Processed in the background)
    List<String> questions = await _loadQuestions();

    // Update the UI based on the questions retrieved in the frontend
    setState(() {
      _questions = questions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Questions")),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: _questions.length,
            itemBuilder: (context, index) {
              return Text(_questions[index]);
            },
          ),
        ),
      ),
    );
  }
}
