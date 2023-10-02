import 'package:dgto_test/core/repository/local_cache_repository.dart';
import 'package:dgto_test/core/repository/movie_repository.dart';
import 'package:dgto_test/feature/movie/movie_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Cubit<MovieDetailState> {
  final MovieRepository movieRepository;
  MovieBloc({
    required this.movieRepository,
  }) : super(const MovieDetailState(movie: null, isLoading: false));

  Future<void> fetchMovieById(String id) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await movieRepository.getMovieById(id);
      emit(state.copyWith(movie: result));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
