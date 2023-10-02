import 'dart:async';

import 'package:dgto_test/core/repository/movie_repository.dart';
import 'package:dgto_test/feature/app_shell_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppShellBloc extends Cubit<AppShellState> {
  final MovieRepository movieRepository;

  AppShellBloc({required this.movieRepository}) : super(AppShellState());

  Future<void> startGettingData() async {
    movieRepository.getAllData();
  }
}
