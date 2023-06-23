import 'dart:async';

import 'package:dd3/app/app.dart';
import 'package:dd3/bootstrap.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(bootstrap(() => const App()));
}
