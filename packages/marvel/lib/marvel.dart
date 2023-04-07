/// A Very Good Project created by Very Good CLI.
library marvel;

export 'package:marvel/src/core/failures.dart';
export 'package:marvel/src/domain/entities/character.dart';
export 'package:marvel/src/domain/entities/comic.dart';
export 'package:marvel/src/domain/entities/event.dart';
export 'package:marvel/src/domain/entities/serie.dart';
export 'package:marvel/src/domain/entities/story.dart';
export 'package:marvel/src/domain/repositories/characters_repository.dart';
export 'package:marvel/src/infraestructure/datasources/characters_remote_datasource.dart';
export 'package:marvel/src/infraestructure/datasources/remote_datasource.dart';
export 'package:marvel/src/infraestructure/dto/marvel_response.dart';
export 'package:marvel/src/infraestructure/dto/pagination_response.dart';
export 'package:marvel/src/infraestructure/repositories/characters_repository_impl.dart';
export 'package:marvel/src/infraestructure/repositories/sample_characters_repository.dart';

export 'src/mock/mocks.dart';
