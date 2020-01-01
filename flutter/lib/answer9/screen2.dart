// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/answer9/screen1.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> someArgs =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Close Screen'),
              onPressed: () {
                Navigator.pop(
                  context,
                  Screen1Arguments(
                    {
                      "key1": "value1",
                      "key2": "value2",
                      "key3": 3,
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
