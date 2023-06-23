import 'package:marvelheroes/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:marvel/marvel.dart';

class MarvelApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    final hash = generateMarvelApiHash(
      Constants.publicKey,
      Constants.privateKey,
      timestamp,
    );

    options.queryParameters.addAll({'apikey': Constants.publicKey, 'hash': hash, 'ts': timestamp});

    return handler.next(options);
  }
}
