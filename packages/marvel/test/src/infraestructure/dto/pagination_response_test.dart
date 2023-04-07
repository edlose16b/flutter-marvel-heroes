import 'package:marvel/src/infraestructure/dto/pagination_response.dart';
import 'package:marvel/src/mock/mocks.dart';
import 'package:test/test.dart';

void main() {
  group('Pagination Response', () {
    group('Given a correct JSON', () {
      test('should return PaginationResponse', () {
        // arrange
        const json = paginationResponseJson;
        // act
        final data = PaginationResponse.fromJson(json);

        // assert
        expect(data, isA<PaginationResponse>());
        expect(json['offset'], data.offset);
        expect(json['limit'], data.limit);
        expect(json['total'], data.total);
        expect(json['count'], data.count);
      });
    });

    group('Given an incorrect JSON', () {
      test('should throws an Error', () {
        final json = {...paginationResponseJson, 'offset': 'asd'};

        expect(
          () {
            // act

            PaginationResponse.fromJson(json);
          },
          // assert

          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}
