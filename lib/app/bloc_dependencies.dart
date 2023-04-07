import 'package:flutter/material.dart';

class BlocDependencies extends StatelessWidget {
  const BlocDependencies({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
