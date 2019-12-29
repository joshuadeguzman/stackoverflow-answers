// SO link: https://stackoverflow.com/questions/59395215/changing-screens-when-navigating-in-bottomnavigation-bar-error/59395503#59395503

// Question
// Title:
// Changing screens when navigating in bottomnavigation bar error

// Body:
// Hi Im new to flutter so please bear with me for asking too much nooby question. So I am currently developing an app, the first screen will be a Login/register screen then after a login or registration is directed, the actual **main app screen** is displayed I also set this screen as **stateless** and set a body to my ```HomePage.dart``` now on my ```HomePage.dart``` which is a **stateful** widget, which contains the **navigation bar** but for some reason, Im getting an error in
// ```
// final List<Widget> _children [
//     NavHome()
//   ];
// ```
// saying that the children is initialized. And Im confused since I followed the tutorial from medium exactly BUT with just a custom main screen (which appears after the main.dart)
// the code for the actual **main app screen** is below:
// ```
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'home.dart';
// class MainScreen extends StatelessWidget {
//   const MainScreen({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HomePage(),
//     );
//   }
// }
// ```
// the code for **Home.dart** is below which says the children variable isnt initialized
// ```
// import 'package:flutter/material.dart';
// import 'package:vmembershipofficial/screens/nav_home.dart'
// class HomePage extends StatefulWidget {
//     static final String id = 'homepage';
//   HomePage({Key key}) : super(key: key);
//   @override
//   _HomePageState createState() => _HomePageState();
// }
// class _HomePageState extends State<HomePage> {
//   int _currentTab = 2;
//   final List<Widget> _children [
//     NavHome()
//   ];
//   void onTabTapped(int index) {
//     setState(() {
//       _currentTab = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         body: _children[_currentTab],
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: onTabTapped,
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _currentTab, //makes a new variable called current Tab
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search, size: 30.0),
//               title: Text('Search', style: TextStyle(fontSize: 12.0),),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               title: Text('Favorites', style: TextStyle(fontSize: 12.0),),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               title: Text('Home', style: TextStyle(fontSize: 12.0),),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.message),
//               title: Text('Messages', style: TextStyle(fontSize: 12.0),),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle),
//               title: Text('Account', style: TextStyle(fontSize: 12.0),),
//             ),
//           ],
//         ),
//       );
//   }
// }
// ```
// > NOTE: I just want the bottom navigation bar to change to the NavHome, or NavProfile when I tapped on different tabs. I just cant seem to find a way why the _children variable isnt initialized.

// Answer:
// You're almost there!

// **What went wrong**

// ```
// final List<Widget> _children [ // Missing = sign
//    NavHome()
// ];
// ```

// **What you can do**

// Convert the code snippet above to:
// ```
// final List<Widget> _children = [ // Add = sign here
//    NavHome(),
//    NavProfile(),
//    // Add more screens here   
// ];
// ``` 

// I created a simple app for you, which mocks your use case that you need to switch between `NavHome` and `NavProfile`.

// **main.dart**
// ```dart
// import 'package:flutter/material.dart';

// void main() => runApp(ExampleApp());

// class ExampleApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Example App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   static final String id = 'homepage';
//   HomePage({Key key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentTab = 0;
//   final List<Widget> _children = [
//     RedPage(),
//     BluePage(),
//   ];

//   void onTabTapped(int index) {
//     setState(() {
//       _currentTab = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _children[_currentTab],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTabTapped,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentTab,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             title: Text(
//               'Red',
//               style: TextStyle(fontSize: 12.0),
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text(
//               'Blue',
//               style: TextStyle(fontSize: 12.0),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RedPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.red,
//       ),
//     );
//   }
// }

// class BluePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.blue,
//       ),
//     );
//   }
// }
// ```

// I have also noticed that you have 5 widgets in your bottom navigation bar, feel free to add placeholders so you won't get `RangeError` exception whenever you tap on tabs without the counterpart screen/s.

// Hope this helps.
