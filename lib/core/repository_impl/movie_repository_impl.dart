import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:dgto_test/core/model/local_cache.dart';
import 'package:dgto_test/core/model/movie.dart';
import 'package:dgto_test/core/model/movie_detail.dart';
import 'package:dgto_test/core/model/movie_incoming.dart';
import 'package:dgto_test/core/repository/local_cache_repository.dart';
import 'package:dgto_test/core/repository/movie_repository.dart';
import 'package:dgto_test/core/resource/network_movie_resource.dart';

class MovieRepositoryImpl extends MovieRepository {
  final NetworkMovieResource networkMovieResource;
  final LocalCacheRepository cacheRepository;

  MovieRepositoryImpl(
      {required this.networkMovieResource, required this.cacheRepository});

  @override
  Future<List<Movie>> getAllData() async {
    try {
      final localCache = await getListMovieLocal();
      if (localCache.listMovieDefalut == null) {
        final List<String>? cachedData = localCache.listMovieDefalut;
        final cachedMovies =
            cachedData!.map((jsonStr) => Movie.fromString(jsonStr)).toList();
        return cachedMovies;
      }
      final results = await networkMovieResource.getAllData();
      List<String> serializedMovies = results.map((movie) {
        return json.encode(movie.toJson());
      }).toList();
      await test(serializedMovies);
      return results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieDetail> getMovieById(String id) {
    try {
      final result = networkMovieResource.getMovieDetail(id);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieInComingList> getMovieInComing() {
    try {
      final result = networkMovieResource.getMovieInComing();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> test(List<String> test) async {
    try {
      await cacheRepository!.setListMovie(test);
    } catch (e) {
      rethrow;
    }
  }

  Future<LocalCache> getListMovieLocal() async {
    try {
      final result = await cacheRepository.getLocalCache();
      final List<String>? tesdt = result.listMovieDefalut;

      return LocalCache(listMovieDefalut: tesdt);
    } catch (e) {
      rethrow;
    }
  }
}
