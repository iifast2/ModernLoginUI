import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class MobileScreenshotBlocker extends StatefulWidget {
  final VoidCallback onSecureModeChanged;

  MobileScreenshotBlocker({required this.onSecureModeChanged});

  @override
  _MobileScreenshotBlockerState createState() => _MobileScreenshotBlockerState();
}

class _MobileScreenshotBlockerState extends State<MobileScreenshotBlocker> {
  bool isSecureMode = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Text(
            'Toggle the button below to enable/disable secure mode (Screenshot Blocker):',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          buildButton(
            title: 'Secure Mode: ${isSecureMode ? 'ON' : 'OFF'}',
            icon: isSecureMode ? Icons.lock : Icons.lock_open,
            onClicked: toggleSecureMode,
          ),
        ],
      ),
    );
  }

  Future toggleSecureMode() async {
    if (!Platform.isAndroid) return;

    setState(() => isSecureMode = !isSecureMode);

    if (isSecureMode) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    } else {
      await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    }

    widget.onSecureModeChanged(); // Notify the parent widget about the change
  }

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.white, minimumSize: Size.fromHeight(64),
          textStyle: TextStyle(fontSize: 20),
        ),

        onPressed: onClicked,
        child: Row(
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 16),
            Text(title),
          ],
        ),
      );
}



