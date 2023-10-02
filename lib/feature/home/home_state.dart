import 'package:dgto_test/core/model/movie.dart';
import 'package:dgto_test/core/model/movie_incoming.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final List<Movie>? movie;
  final List<Movie>? favoriteMovies;
  final List<MovieInComing>? movieIncoming;
  final bool? isLoading;
  final bool? isFavorite;

  const HomeState(
      {required this.movie,
      this.isLoading,
      this.movieIncoming,
      this.favoriteMovies,
      this.isFavorite});
  HomeState copyWith({
    bool? isLoading = false,
    bool? isFavorite = false,
    List<MovieInComing>? movieIncoming,
    List<Movie>? movie,
    List<Movie>? favariteMovies,
  }) {
    return HomeState(
        isLoading: isLoading ?? this.isLoading,
        movie: movie ?? this.movie,
        movieIncoming: movieIncoming ?? this.movieIncoming,
        isFavorite: isFavorite ?? this.isFavorite,
        favoriteMovies: favariteMovies ?? favoriteMovies);
  }

  @override
  List<Object?> get props => [
        movie?.toList().toString(),
        isLoading,
        isFavorite,
        favoriteMovies,
        movieIncoming
      ];
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState({super.movie});
}
