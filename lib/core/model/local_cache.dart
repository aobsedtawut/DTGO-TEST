class LocalCache {
  final List<String>? listMovieDefalut;

  LocalCache({
    required this.listMovieDefalut,
  });

  factory LocalCache.fromJson(Map<String, dynamic> json) {
    return LocalCache(
      listMovieDefalut: json['list_movie_defalut'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'list_movie_defalut': listMovieDefalut,
      };
}
