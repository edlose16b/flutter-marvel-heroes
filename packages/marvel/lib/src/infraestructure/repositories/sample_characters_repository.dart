import 'package:dartz/dartz.dart';
import 'package:marvel/marvel.dart';

/// {@template characters_repository_implementation}
/// Implementation sample of [CharactersRepository]
/// {@endtemplate}
class SampleCharactersRepository implements CharactersRepository {
  @override
  Future<Either<Failure, List<Character>>> fetchCharacters({
    int? offset,
  }) async {
    return Right([
      Character(
        id: 1,
        name: 'Spiderman',
        description: 'Spiderman es mi mejor personaje del MCU favorito.',
        modified: DateTime.now(),
        thumbnail: 'https://m.media-amazon.com/images/I/61-rozyeQQL._AC_SL1000_.jpg',
      ),
      Character(
        id: 2,
        name: 'Hulk',
        description: 'Spiderman es mi mejor personaje del MCU favorito.',
        modified: DateTime.now(),
        thumbnail: 'https://es.web.img3.acsta.net/pictures/14/05/05/12/48/358728.jpg',
      ),
      Character(
        id: 3,
        name: 'Ironman',
        description: 'Spiderman es mi mejor personaje del MCU favorito.',
        modified: DateTime.now(),
        thumbnail: 'https://i.blogs.es/a48e71/iron-20man-20es-20internacional/450_1000.jpg',
      ),
    ]);
  }

  @override
  Future<Either<Failure, List<Comic>>> fetchComics(int characterId) async {
    return Right([
      Comic(
        id: 1,
        digitalId: 2312,
        title: 'title',
        issueNumber: 13231,
        variantDescription: 'variantDescription',
        description: 'description',
        modified: DateTime.now(),
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/9/50/57ed5bc9040e3.jpg',
      ),
      Comic(
        id: 2,
        digitalId: 2312,
        title: 'title 2',
        issueNumber: 13231,
        variantDescription: 'variantDescription',
        description: 'description',
        modified: DateTime.now(),
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/9/50/57ed5bc9040e3.jpg',
      ),
    ]);
  }

  @override
  Future<Either<Failure, List<Event>>> fetchEvents(int characterId) async {
    return Right([
      Event(
        id: 1,
        title: 'Evento 1',
        description: 'description',
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/f/20/5109a003a9112.jpg',
        modified: DateTime.now(),
        start: DateTime.now(),
        end: DateTime.now(),
      ),
      Event(
        id: 2,
        title: 'Evento 2',
        description: 'description',
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/f/20/5109a003a9112.jpg',
        modified: DateTime.now(),
        start: DateTime.now(),
        end: DateTime.now(),
      ),
      Event(
        id: 3,
        title: 'Evento 3',
        description: 'description',
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/f/20/5109a003a9112.jpg',
        modified: DateTime.now(),
        start: DateTime.now(),
        end: DateTime.now(),
      ),
    ]);
  }

  @override
  Future<Either<Failure, List<Serie>>> fetchSeries(int characterId) async {
    return Right([
      Serie(
        id: 1,
        title: 'Serie 1',
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/6/00/5130f06bd981b.jpg',
        startYear: 1998,
        endYear: 2014,
        rating: 'T+',
        type: 'ongoing',
        modified: DateTime.now(),
        description: 'description',
      ),
      Serie(
        id: 2,
        title: 'Serie 2',
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/6/00/5130f06bd981b.jpg',
        startYear: 1998,
        endYear: 2014,
        rating: 'T+',
        type: 'ongoing',
        modified: DateTime.now(),
        description: 'description',
      ),
      Serie(
        id: 3,
        title: 'Serie 3',
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/6/00/5130f06bd981b.jpg',
        startYear: 1998,
        endYear: 2014,
        rating: 'T+',
        type: 'ongoing',
        modified: DateTime.now(),
        description: 'description',
      ),
      Serie(
        id: 4,
        title: 'Serie 4',
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/6/00/5130f06bd981b.jpg',
        startYear: 1998,
        endYear: 2014,
        rating: 'T+',
        type: 'ongoing',
        modified: DateTime.now(),
        description: 'description',
      ),
      Serie(
        id: 5,
        title: 'Serie 5',
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/6/00/5130f06bd981b.jpg',
        startYear: 1998,
        endYear: 2014,
        rating: 'T+',
        type: 'ongoing',
        modified: DateTime.now(),
        description: 'description',
      ),
    ]);
  }

  @override
  Future<Either<Failure, List<Story>>> fetchStories(int characterId) async {
    return Right([
      Story(
        id: 1,
        title: 'Story 1',
        description: 'description',
        type: 'type',
        modified: DateTime.now(),
        // thumbnail: null,
      ),
      Story(
        id: 1,
        title: 'Story 1',
        description: 'description',
        type: 'type',
        modified: DateTime.now(),
        thumbnail: 'http://i.annihil.us/u/prod/marvel/i/mg/6/00/5130f06bd981b.jpg',
      )
    ]);
  }
}
