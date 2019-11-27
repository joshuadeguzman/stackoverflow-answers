// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// SO Link: https://stackoverflow.com/questions/59065836/flutter-google-maps-polyline-the-argument-type-latlng-cant-be-assigned-to-t/
// Question:
// Flutter Google Maps Polyline - The argument type 'LatLng' can't be assigned to the parameter type 'List<LatLng>'
//
// Body
// I am using Google Maps within my Flutter project. I am trying to parse two JSON files in my assets so that I can use their latitudes and longitudes in a Polyline and markers. The markers work fine but now I am adding another future to my `Future` builder for the polylines and I receive the following error: 

// > The argument type `LatLng` can't be assigned to the parameter type `List<LatLng>`.

// ```dart
// Future _future;

// Future _futuree;

// Future<String> loadString() async => await rootBundle.loadString('assets/busStops/stops_${widget.selectStation}.json');
// List<Marker> allMarkers = [];
// GoogleMapController _controller;

// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();

//   //future 1
//   _future = loadString();

//   //future 2
//   _futuree = loadMyCoord();

// }

// Future<String> loadMyCoord() async {
//   var x = await rootBundle
//       .loadString('assets/route/coords_Centurion.json');
//   return x;
// }

// @override
// Widget build(BuildContext context) {
//   createMarker(context);
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Bus Routes"),
//       centerTitle: true,
//       backgroundColor: Color.fromRGBO(59, 62, 64, 1),
//       actions: <Widget>[
//         FlatButton(
//           textColor: Colors.white,
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => busStationList()),
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       ],
//     ),
//     body: Stack(children: [
//       Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: FutureBuilder(

//           // Futures
//           future: Future.wait(
//             [
//               //[0]
//               _future,

//               //[1]
//               _futuree,
//             ]
//           ),

//           builder: (
//                   context, 
//                   AsyncSnapshot<List<dynamic>> snapshot,
//           ) {
//             // Check hasData once for all futures.
//             if (!snapshot.hasData) {
//               return CircularProgressIndicator();
//             }
            
//             List<dynamic> parsedJson = jsonDecode(snapshot.data[0]);
//             allMarkers = parsedJson.map((element) {
//               return Marker(
//                   icon: customIcon,
//                   markerId: MarkerId(element["Latitude"].toString()),
//                   position: LatLng(element['Latitude'] ?? 0.0,
//                       element['Longitude'] ?? 0.0));
//             }).toList();

//             List<dynamic> parseJson = jsonDecode(snapshot.data[1]);
//             List<Polyline> allPolylinesByPosition = [];
//             parseJson.forEach((element){
//               List<dynamic> coords = element["coords"];

//               coords.forEach((i) {
//                 double lat = double.tryParse(i["latitude"]);
//                 double lng = double.tryParse(i["longitude"]);

//                 allPolylinesByPosition.add(Polyline(
//                   polylineId: PolylineId('lines'),
//                   points: points: LatLng(lat ?? 0.0, lng ?? 0.0);
//                   visible: true,
//                   color: Colors.red

//                 ));
//               }

//               );
//             });

//             return GoogleMap(
//               initialCameraPosition: CameraPosition(
//                   target: LatLng(-26.1711459, 27.9002758), zoom: 9.0),
//               markers: Set.from(allMarkers),
//               onMapCreated: mapCreated,
//               polylines: Set.from(allPolylinesByPosition),
//             );
//           },
//         ),
//       ),
//     ]),
//   );
// }

// void mapCreated(controller) {
//   setState(() {
//     _controller = controller;
//   });
// }
// ```

// Answer:
// Few things to note, `points` parameter of `Polyline` only accepts list of `LatLng` (`List<LatLng>`) and not `LatLng`. 

// This line should be changed in your code. Try adding a list of `LatLng` instead of passing a single `LatLng` instance in the `points` parameter.

// ```dart
// points: LatLng(lat ?? 0.0, lng ?? 0.0);
// ```

// **Polyline.dart**
// ```dart
// class Polyline {
//   const Polyline({
//     @required this.polylineId,
//     this.consumeTapEvents = false,
//     this.color = Colors.black,
//     this.endCap = Cap.buttCap,
//     this.geodesic = false,
//     this.jointType = JointType.mitered,
//     this.points = const <LatLng>[],
//     this.patterns = const <PatternItem>[],
//     this.startCap = Cap.buttCap,
//     this.visible = true,
//     this.width = 10,
//     this.zIndex = 0,
//     this.onTap,
//   });
// ```