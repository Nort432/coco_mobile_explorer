import 'package:coco_mobile_explorer/src/features/home/presentation/page/home_page.dart';
import 'package:coco_mobile_explorer/src/injector.dart';
import 'package:flutter/material.dart';

Future main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
