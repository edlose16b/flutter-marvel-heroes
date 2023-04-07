import 'package:dd3/app/app.dart';
import 'package:dd3/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  

  await bootstrap(() => const App());
}
