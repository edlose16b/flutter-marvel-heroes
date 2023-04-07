import 'dart:convert';

import 'package:crypto/crypto.dart';

/// generate a hash necesary to comunicate with Marvel api
String generateMarvelApiHash(String public, String private, int timestamp) {
  final hash =
      md5.convert(utf8.encode(timestamp.toString() + private + public));

  return hash.toString();
}
