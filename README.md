# MODERN LOGIN / SIGN UP UI x FLUTTER

* Modern UI
* Firebase Authentication with e-mail & password
* E-mail verification when user sign-up ( user needs to activate his account when he sign-up , an e-mail will be sent to him )
* Anonymous Login
*

### ✌&ensp;Preview

![Image](https://i.imgur.com/jUuQWM1.png)


![Image](https://i.imgur.com/8JHEdN0.png)


![Image](https://i.imgur.com/TAZCin0.png)



<br/>



### Email Verification ( on sign-up ) / Notification !

this will only sign you in and redirects you to the homepage if you do verification

![Image](https://i.imgur.com/Cjn3vuh.png)

![Image](https://i.imgur.com/f8tWels.png)

![Image](https://i.imgur.com/d6lUwC1.png)

![Image](https://i.imgur.com/HUKqlKo.png)



![72692840-4960-4603-B21E-3BC8442AA19F](https://user-images.githubusercontent.com/29016489/206952739-29d2403c-c26b-472f-9f4d-fdc0e1458326.JPG)

<br/>



### Config Google Sign-in for android :


![Image](https://i.imgur.com/GGpEh1n.png)



![Image](https://i.imgur.com/6oWnT0f.png)

https://console.firebase.google.com/u/2/project/authtutorial-c1a70/settings/general/android:com.example.modernlogintute

https://console.cloud.google.com/apis/credentials



![Image](https://i.imgur.com/xdsGDwa.png)

https://developers.google.com/android/guides/client-auth?authuser=2&hl=en


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
