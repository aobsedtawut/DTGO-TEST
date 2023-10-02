import 'dart:convert';

import 'package:dgto_test/core/model/movie.dart';
import 'package:dgto_test/core/model/movie_detail.dart';
import 'package:dgto_test/core/model/movie_incoming.dart';
import 'package:dio/dio.dart';

class NetworkMovieResource {
  final Dio client;

  NetworkMovieResource(this.client);

  Future<List<Movie>> getAllData() async {
    client.options.headers['X-RapidAPI-Key'] =
        '1722e64645msh8705b9e8c5cf0b9p19bee0jsn6a22461cf63c';
    client.options.headers["X-RapidAPI-Host"] =
        "imdb-top-100-movies.p.rapidapi.com";
    final result = await client.get('/');
    final List<dynamic> data = result.data;
    final List<Movie> movies =
        data.map((json) => Movie.fromJson(json)).toList();
    return movies.cast();
  }

  Future<MovieDetail> getMovieDetail(String id) async {
    client.options.headers['X-RapidAPI-Key'] =
        '1722e64645msh8705b9e8c5cf0b9p19bee0jsn6a22461cf63c';
    client.options.headers["X-RapidAPI-Host"] =
        "imdb-top-100-movies.p.rapidapi.com";
    final result = await client.get(
      '/$id',
    );
    final Map<String, dynamic> jsonData = result.data;
    final movieDetail = MovieDetail.fromJson(jsonData);
    return movieDetail;
  }

  Future<MovieInComingList> getMovieInComing() async {
    client.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YmY0Mzg0OTQxNWJjZWE2M2RmYmUwN2JhOTQ1ZTlkZSIsInN1YiI6IjY1MTgyMDkxOTZlMzBiMDBjNmEwN2IzMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-3rgb4UhDu8sOywSzNDY0KcGkQbdVJ32KLYToWqAO44';
    client.options.headers["accept"] = "application/json";
    final result = await client.get(
      'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&region=US',
    );
    final Map<String, dynamic> jsonData = result.data;
    final MovieInComingList results = MovieInComingList.fromJson(jsonData);
    return results;
  }
}
