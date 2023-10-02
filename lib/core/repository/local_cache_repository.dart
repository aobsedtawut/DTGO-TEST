import 'dart:async';

import 'package:dgto_test/core/model/local_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalCacheRepository {
  FutureOr<LocalCache> getLocalCache();
  Future<void> setListMovie(List<String> movie);
  Future<void> clear();
}

class LocalCacheKey {
  static const String DEFAULT_MOVIE_KEY = 'default_movie_key';
}

class LocalCacheRepository implements ILocalCacheRepository {
  @override
  FutureOr<LocalCache> getLocalCache() async {
    final storage = await SharedPreferences.getInstance();
    final defaultListMovie =
        storage.getStringList(LocalCacheKey.DEFAULT_MOVIE_KEY);
    storage.getStringList(
      LocalCacheKey.DEFAULT_MOVIE_KEY,
    );
    return LocalCache(listMovieDefalut: defaultListMovie);
  }

  @override
  Future<void> setListMovie(List<String> movie) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setStringList(
      LocalCacheKey.DEFAULT_MOVIE_KEY,
      movie,
    );
  }

  @override
  Future<void> clear() async {
    final storage = await SharedPreferences.getInstance();
    await storage.remove(LocalCacheKey.DEFAULT_MOVIE_KEY);
  }
}
