import 'package:ecash/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    ));
  });
}
