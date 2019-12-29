// SO link: https://stackoverflow.com/questions/59395594/tabbar-with-unique-actions-per-tab/59395909#59395909

// Question

// Title: 
// Tabbar with unique actions per tab

// Body: 
// I have a `Tabbar` with two tabs. The `Tabbar` has its own `Appbar` which is used by both tabs. How do I have the sort button run custom (set state) functions inside each tab's stateful widget? Alternatively, is it possible for each tab to have its own unique `Appbar`? I am not sure what best approach is here.
// [![enter image description here][1]][1] 
//   [1]: https://i.stack.imgur.com/KdCme.png
// *Example method inside one of the tabs:*
// ```dart
// class _TabAState extends State<TabA> {
//   void sort() {
//     setState(() {
//     myList.sort((a, b) => b.dueDate.compareTo(a.dueDate));
//     });
//   }
// ...
// ```
// *Sort button:*
// ```dart
// IconButton(
//   icon: Icon(Icons.sort),
//   onPressed: () => DefaultTabController.of(context).index == 0
// 	  ? TabA.sort() // Does not work
// 	  : TabB.sort(), // Does not work
// ),
// ```


// Answer:
// Regarding your concern if this approach is the best approach:
// **From the documentation**
// > The Scaffold was designed to be the single top level container for a MaterialApp and it's typically not necessary to nest scaffolds.
// Based from this statement, I suggest that it's probably not a good idea to nest multiple `Scaffold` inside another `Scaffold`. This is related to your concern, whether to have nested `AppBar` inside a `Scaffold`, given that you can only have one `AppBar` per `Scaffold`.
// I personally **do not recommend** the calling static or non static method from **other** Flutter `Widget` classes (eg. widget that serves as a standalone screen for your app) for executing the business logic of your application. Perhaps, you can continue implementing the business logic of your application using widgets such as `ScopedModel` and architectural patterns such as BloC, Redux or Mobx.
// **Further reading:**
// * https://api.flutter.dev/flutter/material/Scaffold-class.html
// * https://www.didierboelens.com/2019/04/bloc---scopedmodel---redux---comparison/
// * https://stackoverflow.com/questions/52549440/how-to-call-method-from-another-class-in-flutterdart
