import 'package:marvel/marvel.dart';
import 'package:test/test.dart';

void main() {
  test('should get a marvel hash from params', () {
    final hash = generateMarvelApiHash('a', 'b', 1);
    expect(hash, '323839261ec89d64d6fa6eca9afe5195');
  });
}
