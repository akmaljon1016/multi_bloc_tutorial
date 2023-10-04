import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            MaterialButton(
              onPressed: () async {
                bool dontAllow =
                    await Permission.camera.shouldShowRequestRationale;
                print(dontAllow);
                PermissionStatus status = await Permission.camera.request();
                if (status.isGranted) {
                } else if (status.isPermanentlyDenied && dontAllow==false) {
                  openAppSettings();
                }
              },
              color: Colors.green,
              child: const Text("Take permission"),
            )
          ],
        ),
      ),
    );
  }
}
