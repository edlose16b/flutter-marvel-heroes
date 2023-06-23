import 'package:marvelheroes/app/bloc_dependencies.dart';
import 'package:marvelheroes/app/dependency_injections.dart';
import 'package:marvelheroes/app/themes.dart';
import 'package:marvelheroes/features/home/pages/home_view.dart';
import 'package:marvelheroes/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DependencyInjections(
      child: BlocDependencies(
        child: MaterialApp(
          theme: buildLightTheme(context),
          darkTheme: buildDarkTheme(context),
          themeMode: ThemeMode.dark,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomeView(),
        ),
      ),
    );
  }
}
