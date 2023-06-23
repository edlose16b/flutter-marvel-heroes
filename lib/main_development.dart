import 'package:dd3/app/app.dart';
import 'package:dd3/bootstrap.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootstrap(() => const App());
}
