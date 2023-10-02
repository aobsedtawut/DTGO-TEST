import 'package:dgto_test/core/repository/local_cache_repository.dart';
import 'package:dgto_test/core/repository/movie_repository.dart';
import 'package:dgto_test/feature/home/home_screen.dart';
import 'package:dgto_test/feature/app_shell.dart';
import 'package:dgto_test/feature/movie/movie_detail_bloc.dart';
import 'package:dgto_test/feature/movie/movie_detail_screen.dart';
import 'package:dgto_test/feature/saved/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navShell) {
        return AppShell(navShell: navShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  builder: (context, state) {
                    final id = state.pathParameters['id']!;
                    return _movieDetailScreen(id);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/saved',
              builder: (context, state) {
                return _savedScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

Widget _movieDetailScreen(String id) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => MovieBloc(
          movieRepository: context.read<MovieRepository>(),
        ),
      ),
    ],
    child: MovieDetailScreen(
      id: id,
    ),
  );
}

Widget _savedScreen() {
  return BlocProvider(
    create: (context) => MovieBloc(
      movieRepository: context.read<MovieRepository>(),
    ),
    child: const SavedScreen(),
  );
}
