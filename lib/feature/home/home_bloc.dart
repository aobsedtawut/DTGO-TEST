import 'package:dgto_test/core/model/movie_incoming.dart';
import 'package:dgto_test/core/repository/movie_repository.dart';
import 'package:dgto_test/feature/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState> {
  final MovieRepository movieRepository;
  HomeBloc({required this.movieRepository}) : super(const HomeState(movie: []));

  Future<void> fetchMovie() async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await movieRepository.getAllData();
      emit(state.copyWith(movie: result));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> fetchMovieById(String id) async {
    try {
      final result = await movieRepository.getAllData();
      emit(state.copyWith(movie: result));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> fetchMovieInComing() async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await movieRepository.getMovieInComing();
      List<MovieInComing> test = result.results.toList();
      String asd = test.first.title;
      print(asd);
      emit(state.copyWith(movieIncoming: test));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> toggleSaved(String id) async {
    final updatedProducts = state.movie?.map((product) {
      if (product.id == id) {
        return product.copyWith(isFavorite: !product.isFavorite!);
      }
      return product;
    }).toList();

    final updatedFavoriteProducts =
        updatedProducts?.where((product) => product.isFavorite!).toList();

    final isProductFavorite = updatedProducts
        ?.firstWhere(
          (product) => product.id == id,
        )
        ?.isFavorite;
    emit(state.copyWith(
        movie: updatedProducts,
        favariteMovies: updatedFavoriteProducts,
        isFavorite: isProductFavorite));
  }
}
