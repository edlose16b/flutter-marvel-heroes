# Marvel Heroes
---

## How to run  📱

```sh
# crear .env and complete it using your variables
cp .env.example.json .env.dev.json
# Install dependencies 
$ flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
# run project
flutter run --flavor development --target lib/main_development.dart --dart-define-from-file .env.dev.json
```
## Demo
![marvel-api](https://user-images.githubusercontent.com/58694638/230679979-db5242fd-312c-4541-8f23-b1bd619d0901.gif)
