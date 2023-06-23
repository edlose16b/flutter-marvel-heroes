import 'package:flutter/material.dart';
import 'package:marvelheroes/app/app.dart';
import 'package:marvelheroes/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootstrap(() => const App());
}
