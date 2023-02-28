import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
