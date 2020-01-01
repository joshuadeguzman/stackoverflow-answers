// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/answer9/screen2.dart';

class Screen1Arguments {
  Map<String, dynamic> someMapVariable;

  Screen1Arguments(this.someMapVariable);
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Open Second Screen'),
              onPressed: () async {
                final Screen1Arguments args = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2(),
                  ),
                );
                print("args ${args.someMapVariable}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
