import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MarvelApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final publicKey = dotenv.env['MARVEL_PUBLIC_KEY']!;
    final privateKey = dotenv.env['MARVEL_PRIVATE_KEY']!;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash =
        md5.convert(utf8.encode(timestamp.toString() + privateKey + publicKey));

    options.queryParameters
        .addAll({'apikey': publicKey, 'hash': hash, 'ts': timestamp});

    log('adding new params');
    inspect(options.queryParameters);
    return handler.next(options);
  }
}
