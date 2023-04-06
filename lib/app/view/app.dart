import 'package:dd3/app/themes.dart';
import 'package:dd3/features/home/pages/home_view.dart';
import 'package:dd3/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildLightTheme(context),
      darkTheme: buildDarkTheme(context),
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomeView(),
    );
  }
}
