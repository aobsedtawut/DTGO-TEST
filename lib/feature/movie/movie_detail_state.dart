import 'package:dgto_test/core/model/movie_detail.dart';
import 'package:equatable/equatable.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movie;
  final bool? isLoading;

  const MovieDetailState({required this.movie, this.isLoading});
  MovieDetailState copyWith({
    bool? isLoading = false,
    MovieDetail? movie,
  }) {
    return MovieDetailState(
      isLoading: isLoading ?? this.isLoading,
      movie: movie ?? this.movie,
    );
  }

  @override
  List<Object?> get props => [
        movie,
        isLoading,
      ];
}

class HomeLoadingState extends MovieDetailState {
  const HomeLoadingState({super.movie, required super.isLoading});
}
