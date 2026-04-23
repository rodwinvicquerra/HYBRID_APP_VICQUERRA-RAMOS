import 'package:flutter/material.dart';

void main() {
  runApp(const MissingFlashDriveApp());
}

class MissingFlashDriveApp extends StatelessWidget {
  const MissingFlashDriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Missing Flash Drive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('The Missing Flash Drive'),
        ),
      ),
    );
  }
}
