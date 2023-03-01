import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp(sofLocalUsersDatabase: di.sl(),));
}
