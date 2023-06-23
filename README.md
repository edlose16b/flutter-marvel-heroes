# Marvel Heroes

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Generated by the [Very Good CLI][very_good_cli_link] 🤖

A Very Good Project created by Very Good CLI.

---

## Demo it 📱

```sh
# crear .env and complete it using your variables
cp .env.example .env
# Install dependencies 
$ flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
# run project
flutter run --flavor development --target lib/main_development.dart
```
## Demo
![marvel-api](https://user-images.githubusercontent.com/58694638/230679979-db5242fd-312c-4541-8f23-b1bd619d0901.gif)


## Preguntas y Respuestas


<details>
  <summary>Por qué very_good_cli?</summary>
  
  Para este reto use very_good_cli porque estoy acostumbrado a usar esta herramienta en mis proyectos de Flutter, porque me da lo necesario para comenzar un proyecto.
Me ayuda a trabajar con flavors, traducciones y además que usa FlutterBloc.
 
</details>

<details>
  <summary>Por qué separarlo en subpaquetes?</summary>
  
El concepto de un paquete es que haga algo en especifico, en este caso el paquete `marvel` es el encargado de hacer la comunicación con el backend.
Entonces en mi proyecto flutter, yo utilizo el paquete `marvel` y soy agnostico a lo que suceda interiormente.
 
</details>

<details>
  <summary>Por qué Flutter BLoC</summary>
  Aunque hay muchas opciones, y además del ser usado por defecto por very_good_cli, considero a Flutter BLoC mi preferido por la facilidad del testeo que tengo al usar `bloc_test`.
</details>




[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
