import 'package:dgto_test/core/model/movie.dart';
import 'package:dgto_test/core/model/movie_detail.dart';
import 'package:dgto_test/core/model/movie_incoming.dart';
import 'package:rxdart/rxdart.dart';

abstract class MovieRepository {
  final movieDetailStream = BehaviorSubject<MovieDetail>();
  final cacheMovieDetail = ReplaySubject<MovieDetail>();

  Future<List<Movie>> getAllData();
  Future<MovieDetail> getMovieById(String id);
  Future<MovieInComingList> getMovieInComing();
}
