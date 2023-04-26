# Other Project Instructions 


# flutter doctor -v 

```
PS C:\Users\Barack\Documents\github\ModernLoginUI> flutter doctor -v
[√] Flutter (Channel stable, 3.3.1, on Microsoft Windows [Version 10.0.19045.2604], locale en-GB)
    • Flutter version 3.3.1 on channel stable at C:\src\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision 4f9d92fbbd (6 months ago), 2022-09-06 17:54:53 -0700
    • Engine revision 3efdf03e73
    • Dart version 2.18.0
    • DevTools version 2.15.0

Checking Android licenses is taking an unexpectedly long time...[√] Android toolchain - develop for Android devices (Android SDK version 33.0.1)
    • Android SDK at D:\Android\Sdk
    • Platform android-33, build-tools 33.0.1
    • Java binary at: C:\Program Files\Microsoft\jdk-11.0.12.7-hotspot\bin\java.exe
    • Java version OpenJDK Runtime Environment Microsoft-25199 (build 11.0.12+7)
    • All Android licenses accepted.

[√] Chrome - develop for the web
    • Chrome at C:\Program Files\Google\Chrome\Application\chrome.exe

[√] Visual Studio - develop for Windows (Visual Studio Community 2022 17.3.3)
    • Visual Studio at C:\Program Files\Microsoft Visual Studio\2022\Community
    • Visual Studio Community 2022 version 17.3.32825.248
    • Windows 10 SDK version 10.0.19041.0

[√] Android Studio (version 2021.3)
    • Android Studio at C:\Program Files\Android\Android Studio
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.13+0-b1751.21-8125866)

[!] Android Studio
    • Android Studio at C:\Program Files\Android\Android Studio\bin
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart
    X android-studio-dir = C:\Program Files\Android\Android Studio\bin
    X Unable to find bundled Java version.
    • Try updating or re-installing Android Studio.
    • Consider removing your android-studio-dir setting by running:
      flutter config --android-studio-dir=

[√] VS Code (version 1.76.0)
    • VS Code at C:\Users\Barack\AppData\Local\Programs\Microsoft VS Code
    • Flutter extension version 3.60.0

[√] Connected device (3 available)
    • Windows (desktop) • windows • windows-x64    • Microsoft Windows [Version 10.0.19045.2604]
    • Chrome (web)      • chrome  • web-javascript • Google Chrome 110.0.5481.180
    • Edge (web)        • edge    • web-javascript • Microsoft Edge 110.0.1587.63

[√] HTTP Host Availability
    • All required HTTP hosts are available

! Doctor found issues in 1 category.
```






<br/>
<br/>

## After I tested ( Screenshot blocker 02 - html2canvas ) : 
For this , check : 

Commit SS-Final 1 - Blocking screenshots (web) using html2canvas

https://github.com/iifast2/ModernLoginUI/commit/99b2092427eb2f64d50b693a8b52fd3e559d9427

### Ressources : 

https://stackoverflow.com/q/74022831/10216101

https://stackoverflow.com/questions/74022831/disable-screenshots-and-screen-recording-on-flutter-web

https://dev.to/odinachi/how-to-block-screenshot-in-your-flutter-app-18d5

https://mrgulshanyadav.medium.com/prevent-screenshot-and-video-recording-in-flutter-93839325d66c

### Issue : 
It's working but consumes too much ressources !!!
This (issue) is what I get when I run the project ! and it keeps going down #33 , #34 , ....etc 

```
Launching lib\main.dart on Chrome in debug mode...
Waiting for connection from debug service on Chrome...
This app is linked to the debug service: ws://127.0.0.1:52337/A9447k_fA6w=/ws
Debug service listening on ws://127.0.0.1:52337/A9447k_fA6w=/ws

 Running with sound null safety 
Debug service listening on ws://127.0.0.1:52337/A9447k_fA6w=/ws
Flutter Web Bootstrap: Programmatic
wasm streaming compile failed: TypeError: Could not download wasm module
falling back to ArrayBuffer instantiation
Flutter Web Bootstrap: Programmatic
#28
#29
#30
#31
#32
...
```
for this to prevent screenshots , it will keep Check for screenshots every 1000ms (1 second)
thats why keeps running in Terminal after running my app , but it will be ressources counsuming so will test this when hosting my app. 
I will remove it after *Commit SS-Final 1 - Blocking screenshots (web) using html2canvas*

https://i.imgur.com/CGxbVNr.png
 
#### More info about it :

html2canvas is a JavaScript library that takes screenshots of web page elements.
It can be used to detect attempts to take screenshots, but it won't directly prevent screenshots.
The method mentioned earlier using html2canvas is not a foolproof solution for preventing screenshots on your Flutter web app.
However, the other methods mentioned, such as disabling text selection and context menus,
can help deter casual users from taking screenshots.

To test the html2canvas library, follow these steps:

1. In your index.html file in the web folder of your Flutter project,
add the following line to the <head> section to include the html2canvas library:

```
<script src="path/to/html2canvas.min.js"></script>
```

2. Replace path/to/ with the actual path to the html2canvas.min.js file in your project.

Add the following JavaScript code to your index.html file inside the <body> section, just before the closing </body> tag:

```
<script>
  document.addEventListener('keydown', function (event) {
    if (event.key === 'PrintScreen') {
      html2canvas(document.body).then(function (canvas) {
        // Do something with the screenshot, like displaying a warning or logging the event
        console.log('Screenshot attempt detected');
      });
    }
  });
</script>
```

This code listens for the 'PrintScreen' key event and uses html2canvas to take a screenshot of the document body
when the key is pressed. In this example, it logs a message to the console, but you can replace the console.
log line with your own logic, such as displaying a warning message.


Keep in mind that this method is not foolproof and won't prevent users from taking screenshots
using other methods like browser extensions or third-party tools. It can only help you detect when
a user attempts to take a screenshot using the 'PrintScreen' key.


---

You should execute the npm install html2canvas command in your project terminal or any command-line interface (CMD, PowerShell, or Git Bash) that has Node.js and npm installed. Make sure you navigate to your Flutter project's root folder before executing the command.

To install the html2canvas library using the terminal in your Flutter project, follow these steps:

Open your Flutter project in your preferred IDE (e.g., Android Studio, Visual Studio Code, etc.).
Open the terminal within your IDE, usually located at the bottom of the IDE window. If you can't find it, you can check the IDE's documentation or use an external terminal like CMD or PowerShell.
In the terminal, navigate to your Flutter project's root folder (if you're not already there).
Run the command npm install html2canvas.


If you prefer using an external terminal (CMD, PowerShell, or Git Bash), open the terminal, navigate to your project's root folder, and run the command npm install html2canvas.


Please note that you need to have Node.js and npm installed on your system to use these commands. If you don't have them installed, you can download and install Node.js (which includes npm) from the official website: https://nodejs.org/

---

https://github.com/flutter/flutter/issues/36626


<br/>
<br/>
<br/>

---

<br/>
<br/>
<br/>



## Screenshot Protection For android devices ( using `flutter_windowmanager` and `utils.dart` )
This code provides screenshot protection for Android users in Flutter.
[ you can test this in APK version 3]

If you want to try this using a toggle button for it, you can check the `Mobile_screenshot_blocker.dart` page.

## Home Page

The `HomePage` class is a `StatefulWidget` that displays the currently logged in user and provides a button to navigate to the `MobileScreenshotBlockerPage`. The `MobileScreenshotBlockerPage` is a `StatelessWidget` that displays the `MobileScreenshotBlocker` widget.

The `_HomePageState` class includes a `signUserOut` method that allows the user to log out of the app and an `initState` method that enables screenshot protection through the `Utils` class.

## Utils

The `Utils` class includes two static methods: `enableScreenshotProtection` and `disableScreenshotProtection`. The `enableScreenshotProtection` method uses the `FlutterWindowManager` package to add the `FlutterWindowManager.FLAG_SECURE` flag to the window, preventing screenshots from being taken. The `disableScreenshotProtection` method clears the `FlutterWindowManager.FLAG_SECURE` flag.

These methods are only enabled on Android platforms.
















<br/>
<br/>
<br/>





---

<br/>
<br/>
<br/>
<br/>

## Cloud FireStore Rules (user CRUD )

/*
in the register_page.dart : 

the _emailController has an underscore prefix,
making it a private variable within the class.
In contrast, the passwordController is a public variable.

As for the disposal, you are correct that only _emailController is being disposed
of in the dispose() method. You should also dispose of the other
TextEditingController instances to prevent memory leaks.
To do this, update the dispose() method as follows:

By adding these lines, you ensure that all TextEditingController instances are
properly disposed of when the widget is removed from the widget tree.
*/



<p align="center">
  <img src="https://i.imgur.com/UkBEJlw.png" width="600">
</p>


before modifying it :

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
  }
}
```

Error : 

Verification email sent to vmail...@gmail.com
Error: [cloud_firestore/permission-denied] Missing or insufficient permissions.

The error you are getting, "Missing or insufficient permissions," indicates that your app is trying
to read or write to Firestore without the proper permissions set. To fix this, you need to update your Firestore security rules.

Based on your current Firestore rules, all read and write operations are denied. To allow read and 
write access only to authenticated users, you can update your rules to the following:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}

```

These rules allow read and write access only if the request is authenticated.

As for your RegisterPage code, it seems like you are already adding user details to Firestore. 
However, you may want to consider adding more fields to your Firestore document such as a timestamp4
to track when the user was registered.

Additionally, you should ensure that the FirebaseAuth and Firestore libraries are imported correctly at the top of your file.

Overall, it's important to make sure that your Firestore rules match the intended behavior of your app,
and to thoroughly test your app to ensure that everything is working as expected.







---

<br/>
<br/>
<br/>
<br/>



### Users Roles : 


**Why are the roles in firestore Database are saved like this ( role : UserRole.user ) ?** 


```
Yes, that is correct. In the User constructor, the default value for the role parameter is set to UserRole.user,

which means that if no value is provided for the role field when creating a new User,

its value will be set to UserRole.user. So when you create a new user without specifying a role,

the role will be set to UserRole.user.

```


**shouldn't that be like this ( role : user ) ?**


```
The way the toMap() method is implemented in your User class,

the value of the role field will be stored as a string with the format "UserRole.<role>",

where <role> is one of the enum values (i.e. "admin", "trainer", "contentManager", or "user").

So, when you create a new user and don't specify a value for the role field, it will default to UserRole.user,

and then be stored in the Firestore database as "UserRole.user".

Therefore, when you retrieve the user from the database using the fromMap() method,

it correctly converts the stored string value back into an enum value of UserRole.user.
 
```


---

<br/>
<br/>
<br/>
<br/>


## solving Google Sign in issue 


```
[GSI_LOGGER-OAUTH2_CLIENT]: Checking popup closed.
[GSI_LOGGER-TOKEN_CLIENT]: Handling response. {"access_token":"ya29.a0AVvZVsrcCHvPH7kSO3zhMCX9SjGMrHlmDUM2MzzN_DiTQlbDVzohccblwxEnzVg6tOaj-Z52k2Vrx3NnxOZlWCGoyGd7Cp_cXti80K91KUY707DX4zsXtAg0JAsa9PzmhFLcN8ZZyKCzEwRELjKLvbsucImrsgaCgYKAfYSARASFQGbdwaIyj1nEMFtUdCPHIp0WZY5fg0165","token_type":"Bearer","expires_in":3599,"scope":"email profile https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email openid","authuser":"0","prompt":"none"}
[GSI_LOGGER-OAUTH2_CLIENT]: Popup timer stopped.
[GSI_LOGGER-TOKEN_CLIENT]: Trying to set gapi client token.
[GSI_LOGGER-TOKEN_CLIENT]: The OAuth token was not passed to gapi.client, since the gapi.client library is not loaded in your page.
Error signing in with Google: {
  "error": {
    "code": 403,
    "message": "People API has not been used in project 846946449640 before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/people.googleapis.com/overview?project=846946449640 then retry. If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry.",
    "status": "PERMISSION_DENIED",
    "details": [
      {
        "@type": "type.googleapis.com/google.rpc.Help",
        "links": [
          {
            "description": "Google developers console API activation",
            "url": "https://console.developers.google.com/apis/api/people.googleapis.com/overview?project=846946449640"
          }
        ]
      },
      {
        "@type": "type.googleapis.com/google.rpc.ErrorInfo",
        "reason": "SERVICE_DISABLED",
        "domain": "googleapis.com",
        "metadata": {
          "consumer": "projects/846946449640",
          "service": "people.googleapis.com"
        }
      }
    ]
  }
}

```

How to fix  : 

```
Access blocked: FlutterGoogleAuthTute has not completed the Google verification process
admin@gmail.com
FlutterGoogleAuthTute has not completed the Google verification process. The app is currently being tested,
and can only be accessed by developer-approved testers. If you think you should have access, contact the developer.
```

**Solution :**  https://youtu.be/bkZns_VOB6I 


https://console.cloud.google.com/welcome?hl=fr&project=authtutorial-c1a70



<p align="center">
  <img src="https://i.imgur.com/aydWII4.png" width="300"> 
</p>
<br/>

---

<br/>

---

## Manage users ( users CRUD )


https://pub.dev/packages/build_runner/install


```
dart pub add build_runner --dev
```
after creating `user_model.dart`  run the following command :

```
flutter packages pub run build_runner build
```

Run the command flutter packages pub run build_runner build in your terminal to generate the necessary user_model.g.dart file.

``` 

PS C:\Users\Barack\Documents\github\ModernLoginUI> flutter packages pub run build_runner build
Could not find a file named "pubspec.yaml" in "C:\src\flutter\.pub-cache\hosted\pub.dartlang.org\_fe_analyzer_shared-50.0.0".
pub finished with exit code 66

---

PS C:\Users\Barack\Documents\github\ModernLoginUI> flutter packages pub run build_runner build
[INFO] Generating build script...
[INFO] Generating build script completed, took 334ms

[INFO] Precompiling build script......
[INFO] Precompiling build script... completed, took 6.7s

[SEVERE] Nothing can be built, yet a build was requested.
[INFO] Initializing inputs
[INFO] Building new asset graph...
[INFO] Building new asset graph completed, took 1.0s

[INFO] Checking for unexpected pre-existing outputs....
[INFO] Checking for unexpected pre-existing outputs. completed, took 0ms

[INFO] Running build...
[INFO] Running build completed, took 2ms

[INFO] Caching finalized dependency graph...
[INFO] Caching finalized dependency graph completed, took 34ms

[INFO] Succeeded after 46ms with 0 outputs (0 actions)





```



