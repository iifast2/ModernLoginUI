<h1 align="center"> Flutter Authentication x Firebase x Modern UI</h1>
<h3 align="center"> Web - Android - IOS </h3>

<br/> 
 
<div align="center">
  
  <a href="https://github.com/iifast2/ModernLoginUI/tree/3-Google-Sign-in-(web)">
    <img src="https://i.imgur.com/Cl3REuU.png" alt="Logo" width="80" height="80">
  </a>
  
<a href="https://github.com/iifast2/ModernLoginUI/tree/3-Google-Sign-in-(web)">
    <img src="https://i.imgur.com/rTRrlFb.png" alt="Logo" width="80" height="80">
  </a>
</div>

- Project info :
  - project name : ModernLoginUI
  - Package : com.example.modernlogintute


* Modern UI ( Mainly focused on web and android for this version )
* Firebase Authentication with e-mail & password
* E-mail verification when user sign-up ( user needs to activate his account when he sign-up , an e-mail will be sent to him )
* Anonymous Login
* Google Sign in ( web & android SHA1 SHA2) : works on web and android [apk generated using https://flutlab.io/editor] 
* 

### ✌&ensp;Preview

<p align="center">
  <img src="https://i.imgur.com/ZoDexFA.jpg" >
</p>
  <br/><br/>
 
<p align="center">
  <img src="https://i.imgur.com/sAjKGfZ.png" width="300">
  <img src="https://i.imgur.com/Aoc1Xvl.png" width="300">
</p>
<br/>


<br/>



### Email Verification ( on sign-up ) / Notification !

this will only sign you in and redirects you to the homepage if you do verification

<p align="center">

<img src="https://i.imgur.com/ER180d3.png" width="300">

<img src="https://i.imgur.com/u57r4e9.png" width="300">

<img src="https://i.imgur.com/Y1kasu5.png" width="300">

 <br/>
 
<img src="https://i.imgur.com/8gy3iOO.png" width="300">

<img src="https://i.imgur.com/0ic8n18.png" width="300">

</p>

<br/>
<br/>

---

### Config Google Sign-in for ios :

https://pub.dev/packages/google_sign_in

https://stackoverflow.com/questions/64443888/flutter-cocoapodss-specs-repository-is-too-out-of-date-to-satisfy-dependencies


### Config Google Sign-in for web and android :

<p align="center">
<img src="https://i.imgur.com/4y7CwiK.png" width="300">
</p>


<p align="center">
<img src="https://i.imgur.com/81OEu6E.png" width="300">
<img src="https://i.imgur.com/RnoWMBj.png" width="300">
</p>


<p align="center">
<img src="https://i.imgur.com/5Jc4hMN.png" width="600">
</p>



https://console.firebase.google.com/u/2/project/authtutorial-c1a70/settings/general/android:com.example.modernlogintute

https://console.cloud.google.com/apis/credentials


<p align="center">
<img src="https://i.imgur.com/0AaUDsA.png" width="600">
</p>


https://developers.google.com/android/guides/client-auth?authuser=2&hl=en


<p align="center">
<img src="https://i.imgur.com/Afvci4e.png" width="600">
</p>

https://console.cloud.google.com/apis/api/people.googleapis.com/overview?project=846946449640

* 

<br/> 
<br/> 


CMD (SHA1 & SHA256 ) :
Password : android

```
keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
```



```
C:\Users\Barack\Documents\github\ModernLoginUI>keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
Enter keystore password:
Alias name: androiddebugkey
Creation date: 17 Nov 2022
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Thu Nov 17 05:36:01 WAT 2022 until: Sat Nov 09 05:36:01 WAT 2052
Certificate fingerprints:
         SHA1: 3E:6A:9C:C7:88:E2:D3:6D:C0:3C:B7:66:9B:99:E0:90:B3:3D:CA:6F
         SHA256: 11:A3:86:25:F1:4F:06:0E:9B:2F:37:89:17:3B:F4:74:D8:CA:D6:FB:0C:2B:20:5A:47:21:F7:BB:13:70:29:C9
Signature algorithm name: SHA1withRSA (weak)
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1

Warning:
The certificate uses the SHA1withRSA signature algorithm which is considered a security risk. This algorithm will be disabled in a future update.
```

<br/>

---

<br/>

### Other Config for this project : 

Issue : Consume Ressources 

For `<!--Screenshot blocker 02 - html2canvas -->` using `html2canvas`
Add the html2canvas library to your project using npm or yarn:

```
npm install html2canvas
```

or 

```
yarn add html2canvas
```

then add 2 tags to your `web\index.html` :

Check : Commit SS-Final 1 - Blocking screenshots (web) using html2canvas :
https://github.com/iifast2/ModernLoginUI/commit/99b2092427eb2f64d50b693a8b52fd3e559d9427  


## For `flutter_windowmanager: ^0.2.0`

In ios i'll try soon:

https://mrgulshanyadav.medium.com/prevent-screenshot-and-video-recording-in-flutter-93839325d66c



<br/>
<br/>

---

<br/>
<br/>


# Run your App  

### using Terminal 



https://pub.dev/packages/google_sign_in_web

```
flutter run -d chrome --web-hostname localhost --web-port 5000
```


### using android studio config 



<p align="center">
<img src="https://i.imgur.com/ufngYUf.png" width="600">
</p>


### using online IDE 

https://flutlab.io/

http://zapp.run/

### Download APK 

[APK files](https://github.com/iifast2/ModernLoginUI/blob/3-Google-Sign-in-(web)/APK-testing-android/APK-Android-for-testing.md)




