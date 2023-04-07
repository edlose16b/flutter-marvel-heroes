/// {@template pagination_response}
/// Generical Pagination Response
/// {@endtemplate}
class PaginationResponse {
  /// {@macro pagination_response}
  PaginationResponse({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  /// returns a [PaginationResponse] from a json
  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      PaginationResponse(
        offset: json['offset'] as int,
        limit: json['limit'] as int,
        total: json['total'] as int,
        count: json['count'] as int,
        results: json['results'],
      );

  /// started at
  int offset;

  /// total items per response
  int limit;

  /// total items in whole response
  int total;

  /// count of this items response
  int count;

  /// data
  dynamic results;
}
