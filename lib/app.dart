import 'package:dgto_test/common/theme.dart';
import 'package:dgto_test/core/repository/local_cache_repository.dart';
import 'package:dgto_test/core/repository/movie_repository.dart';
import 'package:dgto_test/core/repository_impl/movie_repository_impl.dart';
import 'package:dgto_test/core/resource/network_movie_resource.dart';
import 'package:dgto_test/feature/app_shell_bloc.dart';
import 'package:dgto_test/feature/home/home_bloc.dart';
import 'package:dgto_test/router.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DTGOApp extends StatelessWidget {
  const DTGOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...coreProviders, ..._featureProvider],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: dtgoTheme(
          context,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}

final _featureProvider = [
  BlocProvider<AppShellBloc>(
    create: (context) => AppShellBloc(
      movieRepository: context.read<MovieRepository>(),
    ),
  ),
  BlocProvider<HomeBloc>(
    create: (context) => HomeBloc(
      movieRepository: context.read<MovieRepository>(),
    ),
  ),
];

final coreProviders = [
  ..._resources,
  ..._repositories,
];

final _client = Dio(
  BaseOptions(
    baseUrl: 'https://imdb-top-100-movies.p.rapidapi.com',
  ),
);

final _resources = [
  RepositoryProvider<LocalCacheRepository>(
    create: (context) => LocalCacheRepository(),
  ),
  RepositoryProvider<NetworkMovieResource>(
    create: (context) => NetworkMovieResource(_client),
  ),
];

final _repositories = [
  RepositoryProvider<MovieRepository>(
    create: (context) => MovieRepositoryImpl(
      cacheRepository: context.read<LocalCacheRepository>(),
      networkMovieResource: context.read<NetworkMovieResource>(),
    ),
  ),
];
