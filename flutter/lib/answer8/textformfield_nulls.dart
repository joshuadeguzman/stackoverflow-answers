// SO link: https://stackoverflow.com/questions/59406140/datas-from-textformfields-is-null-in-firebase-database/59409379#59409379

// Question
// Title:
// Datas from TextFormFields is null in Firebase database

// Body:
// I am having a hard time figuring this one out (im still new to flutter btw), I created a new screen with form that lets the user fill it out with information and after filling them out, there is a ```validator``` and ```onSaved:``` on **EACH** ```TextFormField()``` as of the moment, I just want the textform fields to have the datas saved to Firebase Database.

// **EDIT:** I managed to make it work somehow using this code BUT the data Ive input in is ```nulled``` in Firebase database (second pic):

// ```
//                       child: FlatButton(
//                         color: Colors.blue,
//                         child: Text("Confirm", style: TextStyle(color: Colors.white)),
//                         onPressed: () async {
//                           await db.collection("createdoffers").add(
//                             {
//                               'name': offerName,
//                               'type': offerType,
//                               'start': start,
//                               'end': end,
//                             }
//                           );
//                         },
//                       ),
// ```

// > Ive also watched some tutorial but Im having trouble making it work since its kind of a bit different to what Im trying to do (I guess its a beginners problem, Im new to programming and I fell in love with flutter lol)
// > 
// > 
// > Now on my Firebase console, I created a new collection with some new
// > dummy data just to fill in (mind you, I still dont save INPUTS from
// > the app, just created a collection and put in some dummy data)

// The image of my firebase is below:
// [![][1]][1]

// ```NULLED``` data
// [![enter image description here][2]][2]

// my code is below for the screen form that I am trying to save data from INPUTS in the TextFormField and saving it all to my database by clicking the ```FlatButton```

// > My target for this is: **1. Save the data to firebase 2. Read that data and display it to a Container widget, I just want the C and R in CRUD for now**

// ```
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AddOffer extends StatefulWidget {
//   AddOffer({Key key}) : super(key: key);

//   @override
//   _AddOfferState createState() => _AddOfferState();
// }

// class _AddOfferState extends State<AddOffer> {
//   String offerName;
//   String offerType;
//   String start;
//   String end;
//   bool allBranches = false;
//   bool selectedBranches = false;
//   final db = Firestore.instance;
//   final _formKey = GlobalKey<FormState>();


//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListView(
//           children: <Widget>[
//             Container(
//               color: Color(0xFF707070),
//               height: 200.0,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         Navigator.pop(context);
//                       });
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
//                       child: Icon(Icons.arrow_back,
//                           color: Colors.white, size: 25.0),
//                     ),
//                   ),
//                   Center(
//                     child: Padding(
//                       padding: EdgeInsets.all(80.0),
//                       child: Text(
//                         "DEAL IMAGE",
//                         style: TextStyle(
//                             fontSize: 20.0,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Form(
//               key: _formKey,
//               child:  Padding(
//                         padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
//                 child: Column(
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Text(
//                           "Name",
//                           style: TextStyle(
//                               color: Color(0xFF707070),
//                               fontSize: 17.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(hintText: 'Enter Offer Name'),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                         }
//                         return 'Please Enter Offer Name';
//                       },
//                       onSaved: (value) => offerName = value,
//                     ),
//                     SizedBox(height: 30.0),
//                     Row(
//                       children: <Widget>[
//                         Text(
//                           "Type",
//                           style: TextStyle(
//                               color: Color(0xFF707070),
//                               fontSize: 17.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(hintText: 'Enter Offer Type'),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                         }
//                         return 'Please Enter Offer Type';
//                       },
//                       onSaved: (value) => offerType = value,
//                     ),
//                     SizedBox(height: 60.0),
//                     Row(
//                       children: <Widget>[
//                         Text(
//                           "Start",
//                           style: TextStyle(
//                               color: Color(0xFF707070),
//                               fontSize: 17.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     TextFormField(
//                       decoration:
//                           InputDecoration(hintText: 'Enter Offer Start Date'),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                         }
//                         return 'Please Enter Offer Start Date';
//                       },
//                       onSaved: (value) => offerName = value,
//                     ),
//                     SizedBox(height: 30.0),
//                     Row(
//                       children: <Widget>[
//                         Text(
//                           "End",
//                           style: TextStyle(
//                               color: Color(0xFF707070),
//                               fontSize: 17.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     TextFormField(
//                       decoration:
//                           InputDecoration(hintText: 'Enter Offer End Date'),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                         }
//                         return 'Please Enter Offer End Date';
//                       },
//                       onSaved: (value) => offerName = value,
//                     ),
//                     SizedBox(height: 60.0),
//                     Row(
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[
//                             Text(
//                               "Valid Until",
//                               style: TextStyle(
//                                   color: Color(0xFF707070),
//                                   fontSize: 17.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 5.0),
//                             Text(
//                               "01/01/20",
//                               style: TextStyle(
//                                   color: Color(0xFF707070), fontSize: 17.0),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30.0),
//                     Row(
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Time of Active",
//                               style: TextStyle(
//                                   color: Color(0xFF707070),
//                                   fontSize: 17.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 5.0),
//                             Text(
//                               "12/12/19",
//                               style: TextStyle(
//                                   color: Color(0xFF707070), fontSize: 17.0),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 60.0),
//                     Row(
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Max people (optional)",
//                               style: TextStyle(
//                                   color: Color(0xFF707070),
//                                   fontSize: 17.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 5.0),
//                             Text(
//                               "5",
//                               style: TextStyle(
//                                   color: Color(0xFF707070), fontSize: 17.0),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20.0),
//                     Row(
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Max redemption  per member (optional)",
//                               style: TextStyle(
//                                   color: Color(0xFF707070),
//                                   fontSize: 17.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 5.0),
//                             Text(
//                               "5",
//                               style: TextStyle(
//                                   color: Color(0xFF707070), fontSize: 17.0),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20.0),
//                     Row(
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Number of redemption",
//                               style: TextStyle(
//                                   color: Color(0xFF707070),
//                                   fontSize: 17.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 5.0),
//                             Text(
//                               "5",
//                               style: TextStyle(
//                                   color: Color(0xFF707070), fontSize: 17.0),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 60.0),
//                     Row(
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Branches",
//                               style: TextStyle(
//                                   color: Color(0xFF707070),
//                                   fontSize: 17.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 5.0),
//                             Row(
//                               children: <Widget>[
//                                 Checkbox(
//                                   value: allBranches,
//                                   onChanged: (bool value) {
//                                     setState(() {
//                                       allBranches = value;
//                                     });
//                                   },
//                                 ),
//                                 Text(
//                                   "All Branches",
//                                   style: TextStyle(
//                                       color: Color(0xFF707070), fontSize: 17.0),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: <Widget>[
//                                 Checkbox(
//                                   value: selectedBranches,
//                                   onChanged: (bool value) {
//                                     setState(() {
//                                       selectedBranches = value;
//                                     });
//                                   },
//                                 ),
//                                 Text(
//                                   "Selected Branches",
//                                   style: TextStyle(
//                                       color: Color(0xFF707070), fontSize: 17.0),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30.0),
//                     Container(
//                       width: 250.0,
//                       child: FlatButton(
//                         color: Colors.blue,
//                         child: Text("Confirm", style: TextStyle(color: Colors.white)),
//                         onPressed: () {
//                         },
//                       ),
//                     ),
//                     SizedBox(height: 30.0),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// ```

// **WHAT I TRIED SO FAR**
// ```
//                       child: FlatButton(
//                         color: Colors.blue,
//                         child: Text("Confirm", style: TextStyle(color: Colors.white)),
//                         onPressed: ()  {
//                           setState(() async{
//                             await db.collection("createdoffers").add(
//                             {
//                               'name': offerName,
//                               'type': offerType,
//                               'start': start,
//                               'end': end,
//                             }
//                           );
//                           }
//                           );
//                         }
//                       )
// ```


//   [1]: https://i.stack.imgur.com/RZ5sh.png
//   [2]: https://i.stack.imgur.com/vXJLh.png

// Answer
// **What Went Wrong**

// ```dart
// child: FlatButton(
//                         color: Colors.blue,
//                         child: Text("Confirm", style: TextStyle(color: Colors.white)),
//                         onPressed: () async {
//                           await db.collection("createdoffers").add(
//                             {
//                               'name': offerName, // This is null, try to change the way you save data via setState
//                               'type': offerType,
//                               'start': start,
//                               'end': end,
//                             }
//                           );
//                         },
//                       ),
// ```

// **What you can do**

// If you are continuing with this implementation, please do try `TextEditingController`.

// ```dart
// // Declaration
// TextEditingController _offerNameTextController = TextEditingController();

// // Usage
// TextFormField(
//    controller: _offerNameTextController,
//    ...
// )

// // Retrieving data from the input field
// FlatButton(
//    onPressed: () {
//       // Utilize the value (eg. on your Firebase saving method
//      print(_offerNameTextController.text);
//    }
// )
// ```

// **Further reading**

// * https://api.flutter.dev/flutter/widgets/TextEditingController-class.html