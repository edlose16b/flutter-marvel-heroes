import 'package:marvel/src/infraestructure/dto/marvel_response.dart';
import 'package:marvel/src/mock/mocks.dart';
import 'package:test/test.dart';

void main() {
  group('MarvelResponse', () {
    group('Given a correct JSON', () {
      test('should return MarvelResponse', () {
        // arrange
        const json = marvelResponse;
        // act
        final data = MarvelResponse.fromJson(json);

        // assert
        expect(data, isA<MarvelResponse>());
        expect(json['code'], data.code);
        expect(json['status'], data.status);
      });
    });

    group('Given an incorrect JSON', () {
      test('should throws an Error', () {
        final json = {...marvelResponse, 'status': 300};

        expect(
          () {
            // act
            MarvelResponse.fromJson(json);
          },
          // assert

          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}
