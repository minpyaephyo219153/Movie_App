class Movie {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;


  Movie(
    {
      required this.title,
      required this.backDropPath,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
    });

    factory Movie.fromJason(Map<String, dynamic> jason) {
      return Movie(
        title: jason['title'],
        backDropPath: jason['backdrop_path'],
        originalTitle: jason['original_title'],
        overview: jason['overview'],
        posterPath: jason['poster_path'],
        releaseDate: jason['release_date'],
        voteAverage: jason['vote_average'],
      );
    }
}