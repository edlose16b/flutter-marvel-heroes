import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel/marvel.dart';

class MarvelApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final publicKey = dotenv.env['MARVEL_PUBLIC_KEY']!;
    final privateKey = dotenv.env['MARVEL_PRIVATE_KEY']!;

    final timestamp = DateTime.now().millisecondsSinceEpoch;

    final hash = generateMarvelApiHash(publicKey, privateKey, timestamp);

    options.queryParameters
        .addAll({'apikey': publicKey, 'hash': hash, 'ts': timestamp});

    return handler.next(options);
  }
}
