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
                PermissionStatus status = await Permission.camera.status;
                if (status.isGranted) {
                  setState(() {
                    text = "Granted";
                  });
                } else if (status.isDenied) {
                  setState(() {
                    text="Denied";
                  });
                  await Permission.camera.request();
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
