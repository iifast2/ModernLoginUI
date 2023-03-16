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





**LoginPage.dart**


```

import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'lib/images/google.png'),

                    SizedBox(width: 20),

                    // apple button
                    SquareTile(imagePath: 'lib/images/apple.png'),
                    
                  ],
                ),

                const SizedBox(height: 30),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



```


<br/>



---


**my old home_page.dart** 


```

import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';

class HomePage extends StatelessWidget {
const HomePage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[300],
body: SafeArea(
child: SingleChildScrollView(
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.home,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // Welcome to our HomePage !
                Text(
                  'Welcome to our HomePage !',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 30,
                  ),
                ),

                const SizedBox(height: 50),

                // You are Logged in ~ Text!
                const Text(
                  'You are Logged in !!!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                  ),
                ),


                const SizedBox(height: 30),


              ],
            ),
          ),
        ),
      ),
    );




}
}


```

# IOS config for firebase and Google Sign in :



output without config 
```
Launching lib/main.dart on iPhone 12 in debug mode...

Updating minimum iOS deployment target to 11.0.

Upgrading project.pbxproj

Upgrading AppFrameworkInfo.plist

Upgrading Podfile

Upgrading Info.plist

Running pod install...                                           1,087ms

CocoaPods' output:

↳

Error output from CocoaPods:

↳

Error: CocoaPods's specs repository is too out-of-date to satisfy dependencies.

To update the CocoaPods specs, run:

Error running pod install

Error launching application on iPhone 12.

 🏁 Build finished at Monday, March 13th 2023, 7:50:44PM +01:00 🏁 

 ❌ Build failed. Check the logs above 

      Preparing

    Analyzing dependencies

    Inspecting targets to integrate

      Using `ARCHS` setting to build architectures of target `Pods-Runner`: (``)

    Fetching external sources

    -> Fetching podspec for `Flutter` from `Flutter`

    -> Fetching podspec for `firebase_auth` from `.symlinks/plugins/firebase_auth/ios`

    firebase_auth: Using Firebase SDK version '10.3.0' defined in 'firebase_core'

    -> Fetching podspec for `firebase_core` from `.symlinks/plugins/firebase_core/ios`

    firebase_core: Using Firebase SDK version '10.3.0' defined in 'firebase_core'

    -> Fetching podspec for `google_sign_in_ios` from `.symlinks/plugins/google_sign_in_ios/ios`

    Resolving dependencies of `Podfile`

      CDN: trunk Relative path: CocoaPods-version.yml exists! Returning local because checking is only performed in repo update

      CDN: trunk Relative path: all_pods_versions_0_3_5.txt exists! Returning local because checking is only performed in repo update

      CDN: trunk Relative path: Specs/0/3/5/Firebase/10.0.0/Firebase.podspec.json exists! Returning local because checking is only performed in repo update

      CDN: trunk Relative path: all_pods_versions_d_4_0.txt exists! Returning local because checking is only performed in repo update

      CDN: trunk Relative path: Specs/d/4/0/GoogleSignIn/6.2.4/GoogleSignIn.podspec.json exists! Returning local because checking is only performed in repo update

    [!] CocoaPods could not find compatible versions for pod "Firebase/Auth":

      In Podfile:

        firebase_auth (from `.symlinks/plugins/firebase_auth/ios`) was resolved to 4.2.10, which depends on

          Firebase/Auth (= 10.3.0)

    None of your spec sources contain a spec satisfying the dependency: `Firebase/Auth (= 10.3.0)`.

    You have either:

     * out-of-date source repos which you can update with `pod repo update` or with `pod install --repo-update`.

     * mistyped the name or version.

     * not added the source repo that hosts the Podspec to your Podfile.

    /Users/flutlab/.gem/ruby/2.6.0/gems/molinillo-0.8.0/lib/molinillo/resolution.rb:317:in `raise_error_unless_state'

    /Users/flutlab/.gem/ruby/2.6.0/gems/molinillo-0.8.0/lib/molinillo/resolution.rb:299:in `block in unwind_for_conflict'

    /Users/flutlab/.gem/ruby/2.6.0/gems/molinillo-0.8.0/lib/molinillo/resolution.rb:297:in `tap'

    /Users/flutlab/.gem/ruby/2.6.0/gems/molinillo-0.8.0/lib/molinillo/resolution.rb:297:in `unwind_for_conflict'

    /Users/flutlab/.gem/ruby/2.6.0/gems/molinillo-0.8.0/lib/molinillo/resolution.rb:257:in `process_topmost_state'

    /Users/flutlab/.gem/ruby/2.6.0/gems/molinillo-0.8.0/lib/molinillo/resolution.rb:182:in `resolve'

    /Users/flutlab/.gem/ruby/2.6.0/gems/molinillo-0.8.0/lib/molinillo/resolver.rb:43:in `resolve'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/resolver.rb:94:in `resolve'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/installer/analyzer.rb:1078:in `block in resolve_dependencies'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/user_interface.rb:64:in `section'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/installer/analyzer.rb:1076:in `resolve_dependencies'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/installer/analyzer.rb:124:in `analyze'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/installer.rb:416:in `analyze'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/installer.rb:241:in `block in resolve_dependencies'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/user_interface.rb:64:in `section'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/installer.rb:240:in `resolve_dependencies'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/installer.rb:161:in `install!'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/command/install.rb:52:in `run'

    /Users/flutlab/.gem/ruby/2.6.0/gems/claide-1.1.0/lib/claide/command.rb:334:in `run'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/lib/cocoapods/command.rb:52:in `run'

    /Users/flutlab/.gem/ruby/2.6.0/gems/cocoapods-1.11.3/bin/pod:55:in `<top (required)>'

    /Users/flutlab/.gem/ruby/2.6.0/bin/pod:23:in `load'

    /Users/flutlab/.gem/ruby/2.6.0/bin/pod:23:in `<main>'

    [!] Automatically assigning platform `iOS` with version `11.0` on target `Runner` because no platform was specified. Please specify a platform for this target in your Podfile. See `https://guides.cocoapods.org/syntax/podfile.html#platform`.

  pod repo update

No branch

```










