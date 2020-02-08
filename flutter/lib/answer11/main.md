LINK: https://stackoverflow.com/questions/59980509/share-firebase-auth-with-embedded-flutter-module/60128161#60128161

As far as how I can see it, you should be able to help yourself using [platform channels](https://flutter.dev/docs/development/platform-integration/platform-channels).

Based on our experience dealing with embedded Flutter views, we pass the authentication tokens via platform channels by using the `MethodChannel`.

Given that you are using Flutter's Add-to-App, I'm assuming that what you have is already a working app in native code before. In that case, you should be able to authenticate the user using Firebase Auth for the Android and iOS side, **separately**.

For example:

Assuming that you are using Kotlin, here's how you pass the token to Dart after authenticating the user using Android code.

**firebase_login.kt**
```kotlin
// Method to authenticate your user in Android
fun firebaseLogin() {
    ... 
    // Some callbacks from the Android side
    this.authenticateUserInFlutter("someTokenFromFirebase")
}

// @param token Can also be in a form of JSON object
func authenticateUserInFlutter(token: String) {
    val methodName = "authenticateUser"
    channel.invokeMethod(methodName, token, object: MethodChannel.Result {
        override fun success(result: Any?) {
            Log.i("MSG", "$result")
        }
        override fun error(code: String?, msg: String?, details: Any?) {
            Log.e("MSG", "$methodName failed: $msg")
        }
        override fun notImplemented() {
            Log.e("MSG", "$methodName not implemented")
        }
    })
}
```

And if you are using Swift for the iOS part.

**FirebaseLogin.swift**

```swift
func firebaseLogin() {
    ... 
    // Some callbacks from the iOS side
    self.authenticateUserInFlutter("someTokenFromFirebase")
}

fun authenticateUserInFlutter(token: String) {
    let methodName = "authenticateUser"
    channel.invokeMethod(methodName, arguments: value) {
    (result: Any?) -> Void in
        if let error = result as? FlutterError {
            os_log("%@ failed: %@", type: .error, methodName, error.message!)
        } else if FlutterMethodNotImplemented.isEqual(result) {
            os_log("%@ not implemented", type: .error, methodName)
        } else {
            os_log("%@", type: .info, result as! NSObject)
        }
    }
}
```

Finally, you should be able to capture the existing login tokens from the native side in your Dart code. You can use it to authenticate your user using [firebase_auth](https://pub.dev/packages/firebase_auth) for Flutter.

**my_platform_channels_handler.dart**
```dart
channel.setMethodCallHandler((MethodCall call) async {
    switch (call.method) {
    case 'authenticateUser':
        val token = "${call.arguments}"; // You can also receive JSON arguments here

        // Start authenticating the user
        final AuthCredential credential = GoogleAuthProvider.getCredential(
            accessToken: token,
            idToken: ...,
        );
        final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
        
        // Be able to reply to catch the errors here
        return null;
    case 'someMethodFromNative':
        print("someMethodFromNative method invoked from the native code!")
        return null;
    default:
        throw MissingPluginException();
    }
});
```

NOTE: You should be able to store and manage the tokens on both ends properly, native and Dart, so that the user experience will be seamless whenever your user is switching between the native views and the embedded Flutter views.

![diagram](https://user-images.githubusercontent.com/20706361/74087109-43d06e00-4ac4-11ea-819f-d63c90e03156.png)

More on:

- https://pub.dev/packages/firebase_auth
- https://flutter.dev/docs/development/platform-integration/platform-channels
- https://medium.com/flutter/flutter-platform-channels-ce7f540a104e