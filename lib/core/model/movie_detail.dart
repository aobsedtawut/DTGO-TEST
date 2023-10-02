class MovieDetail {
  int rank;
  String title;
  String thumbnail;
  String rating;
  String id;
  int year;
  String image;
  String description;
  String? trailer;
  List<String>? genre;
  List<String>? director;
  List<String>? writers;
  String imdbid;

  MovieDetail({
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.image,
    required this.description,
    required this.trailer,
    required this.genre,
    required this.director,
    required this.writers,
    required this.imdbid,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      rank: json['rank'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      rating: json['rating'].toString(), // Convert to String
      id: json['id'],
      year: json['year'],
      image: json['image'],
      description: json['description'],
      trailer: json['trailer'] != null
          ? json['trailer'].toString()
          : null, // Convert to String or null
      genre: json['genre'] != null
          ? List<String>.from(json['genre'])
          : [], // Handle null
      director: json['director'] != null
          ? List<String>.from(json['director'])
          : [], // Handle null
      writers: json['writers'] != null
          ? List<String>.from(json['writers'])
          : [], // Handle null
      imdbid: json['imdbid'],
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
      'trailer': trailer,
      'genre': genre,
      'director': director,
      'writers': writers,
      'imdbid': imdbid,
    };
  }
}
