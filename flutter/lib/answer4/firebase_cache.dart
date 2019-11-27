// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// SO Link: https://stackoverflow.com/questions/59068459/flutter-firestore-cache-stream/59069756#59069756
// Question:
// Flutter Firestore cache stream
//
// Description: 
// I have a flutter chat that displays newest messages when the user arrives at the end of the list.
// This is done by setting a listener on the firestore, with a limit of 10 messages (limit (10)), and when I reach the end of the message list I increase the limit of the stream by 10.
// ``` 
// // LISTENER QUERY MESSAGES
// limitdocuments = 10;
// StreamBuilder(
//     stream: Firestore.instance
//             .collection('groups')
//             .document(groupId)
//             .collection("messages")
//             .orderBy('sentTime', descending: true)
//             .limit(limitdocuments)
//             .snapshots(),
//             builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                       child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(themeColor)));
//                 } else {           
//                   return ListView.builder(
//                     itemBuilder: (context, index) {
//                         buildItem(index, snapshot.data.documents[index],true)
//                     },
//                     itemCount: snapshot.data.documents.length,
//                     reverse: true,
//                     controller: listScrollController,
//                   ); 
//                 }
//              },
//            ),
// ```
// ```
// // END OF THE LIST, INCREASE THE LIMIT BY 10
// if(listScrollController.position.atEdge){
//     if(listScrollController.position.pixels == 0){
//         setState(() {
//             limitdocuments= limitdocuments+ 10;
//         });
//     }
// }
// ```
// **My question is, does firestore re-download all messages from the database ( including old messages ) or old ones are taken from the cache?**
// Thanks

// Answer:
// **First of all**
// 
// * Ensure that your stream is called in `initState()` so that you are certain that it's just called upon widget instantiation. Otherwise, it will always attempt to create new set of streams.
//
// **Next is to test**
// Try printing logs manually to see if the behavior you're expecting is correct.
// ```
// for (int i = 0; i < snapshot.data.documents.length; i++) {
//    DocumentSnapshot doc = snapshot.data.documents.elementAt(i); 
//    // Check manually if the data you're referring to is coming from the cache.
//    print(doc.metadata.isFromCache ? "Cached" : "Not Cached");
// }
// ```
//
// **Lastly, yes--it's supposed to be cached.**
// From the Firebase [documentation](https://firebase.google.com/docs/firestore/manage-data/enable-offline):
// > Cloud Firestore supports offline data persistence. This feature caches a copy of the Cloud Firestore data that your app is actively using, so your app can access the data when the device is offline. You can write, read, listen to, and query the cached data. When the device comes back online, Cloud Firestore synchronizes any local changes made by your app to the Cloud Firestore backend.
// As far as I know, Flutter Firestore or Realtime Database plugins should follow the same architecture and behavior we have for the native and web counterpart SDKs.

