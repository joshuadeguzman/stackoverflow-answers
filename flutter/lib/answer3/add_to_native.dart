// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// SO Link: https://stackoverflow.com/questions/59069053/android-native-to-flutter-not-working-in-master-channel


// Question:
// Android Native to Flutter not working in master channel

// Description:
// I am integrating **Flutter** app module in Native Android and IOS applications. I am facing issue with `master channel` with **Android to Flutter**. `io.flutter.facade.Flutter` is not generating in master channel working fine in stable channel. In IOS, code working fine in master channel.

// Answer:
// `io.flutter.facade.Fluter` packages is now deprecated in the latest master channel. Please see https://github.com/flutter/flutter/wiki/Upgrading-pre-1.12-Android-projects.
// Also, I think since this is an issue with an SDK, please consider filing an issue in [Flutter](https://github.com/flutter/flutter/issues) repo on Github if you have any more concerns.