import 'package:marvelheroes/app/app.dart';
import 'package:marvelheroes/bootstrap.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await bootstrap(() => const App());
}
