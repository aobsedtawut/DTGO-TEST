import 'dart:convert';

class Movie {
  int rank;
  String title;
  String thumbnail;
  String rating;
  String id;
  int year;
  String image;
  String description;
  List<String>? genre;
  bool? isFavorite;

  Movie({
    this.isFavorite = false,
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.image,
    required this.description,
    required this.genre,
  });
  Movie copyWith({
    int? rank,
    String? title,
    String? thumbnail,
    String? rating,
    String? id,
    int? year,
    String? image,
    String? description,
    List<String>? genre,
    bool? isFavorite,
  }) {
    return Movie(
      isFavorite: isFavorite ?? this.isFavorite,
      rank: rank ?? this.rank,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      rating: rating ?? this.rating,
      year: year ?? this.year,
      id: id ?? this.id,
      image: image ?? this.image,
      description: description ?? this.description,
      genre: genre ?? this.genre,
    );
  }

  factory Movie.fromString(String jsonStr) {
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    return Movie(
      rank: jsonMap['rank'],
      title: jsonMap['title'],
      thumbnail: jsonMap['thumbnail'],
      rating: jsonMap['rating'],
      id: jsonMap['id'],
      year: jsonMap['year'],
      image: jsonMap['image'],
      description: jsonMap['description'],
      genre: List<String>.from(jsonMap['genre']) ?? [],
      isFavorite: jsonMap['isFavorite'],
    );
  }
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      rank: json['rank'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      rating: json['rating'],
      id: json['id'],
      year: json['year'],
      image: json['image'],
      description: json['description'],
      genre: List<String>.from(json['genre']) ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'title': title,
      'thumbnail': thumbnail,
      'rating': rating,
      'id': id,
      'year': year,
      'image': image,
      'description': description,
      'genre': genre,
    };
  }

  List<String> toListString() {
    return [
      'Rank: $rank',
      'Title: $title',
      'Thumbnail: $thumbnail',
      'Rating: $rating',
      'ID: $id',
      'Year: $year',
      'Image: $image',
      'Description: $description',
      'Genre: ${genre?.join(', ') ?? 'N/A'}',
      'Is Favorite: $isFavorite',
    ];
  }
}
