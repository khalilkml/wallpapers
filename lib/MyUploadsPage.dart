import 'package:flutter/material.dart';


class MyUploadsPage extends StatelessWidget {
  const MyUploadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: const Text('Uploads Screen'),
        ),
      ),
    );
  }
}