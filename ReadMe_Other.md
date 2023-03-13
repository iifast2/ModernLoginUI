
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










