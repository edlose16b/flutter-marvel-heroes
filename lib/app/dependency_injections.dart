// ignore_for_file: avoid_redundant_argument_values

import 'package:dd3/core/constants.dart';
import 'package:dd3/core/interceptors/marvel_api_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/marvel.dart';

class DependencyInjections extends StatelessWidget {
  const DependencyInjections({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const apiUri = Constants.apiUri;
    assert(apiUri.isNotEmpty, 'ENV.API_URI must not be null');

    final dio = Dio(BaseOptions(baseUrl: apiUri));
    dio.interceptors.add(MarvelApiInterceptor());
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CharactersRemoteDataSource>(
          create: (context) => CharactersMarvelDataSource(dio: dio),
        ),
        RepositoryProvider<CharactersRepository>(
          create: (context) => CharactersRepositoryImpl(
            dataSource: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
