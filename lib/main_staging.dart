import 'dart:async';

import 'package:marvelheroes/app/app.dart';
import 'package:marvelheroes/bootstrap.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(bootstrap(() => const App()));
}
