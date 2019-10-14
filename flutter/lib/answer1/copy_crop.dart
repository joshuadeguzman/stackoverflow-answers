// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// SO link: https://stackoverflow.com/questions/57601908/can-we-crop-an-image-with-point-and-size-in-flutter/57601942#57601942
// Source https://github.com/brendan-duncan/image/blob/master/lib/src/image.dart
// import '../image.dart';

// Returns a cropped copy of [src].
// Image copyCrop(Image src, int x, int y, int w, int h) {
//  Image dst = Image(w, h, channels: src.channels, exif: src.exif,
//      iccp: src.iccProfile);
//
//  for (int yi = 0, sy = y; yi < h; ++yi, ++sy) {
//    for (int xi = 0, sx = x; xi < w; ++xi, ++sx) {
//      dst.setPixel(xi, yi, src.getPixel(sx, sy));
//    }
//  }
//
//  return dst;
//}
// Usage
// var croppedImage = Image copyCrop(Image sampleImageSrc, int pointX, int pointY, int desiredWidth, int desiredHeight);