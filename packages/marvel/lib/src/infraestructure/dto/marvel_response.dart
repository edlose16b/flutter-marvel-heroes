import 'package:marvel/src/infraestructure/dto/pagination_response.dart';

/// {@template marvel_response}
/// Marvel Generical Response
/// {@endtemplate}
class MarvelResponse {
  /// {@macro marvel_response}
  MarvelResponse({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    required this.data,
  });

  /// returns a [MarvelResponse] from a json
  factory MarvelResponse.fromJson(Map<String, dynamic> json) => MarvelResponse(
        code: json['code'] as int,
        status: json['status'] as String,
        copyright: json['copyright'] as String,
        attributionText: json['attributionText'] as String,
        attributionHtml: json['attributionHTML'] as String,
        etag: json['etag'] as String,
        data: PaginationResponse.fromJson(json['data'] as Map<String, dynamic>),
      );

  /// response status code
  int code;

  /// response status text
  String status;

  /// copyright
  String copyright;

  /// no-description
  String attributionText;

  /// no-description
  String attributionHtml;

  /// no-description
  String etag;

  /// data of the response
  PaginationResponse data;
}
