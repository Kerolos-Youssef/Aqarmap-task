class APIUrls {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String popularMoviesUrl = 'movie/popular';
  static String imageUrl(String imagePath) =>
      'https://image.tmdb.org/t/p/original$imagePath';

  static const String apiKey = 'f1e325b4bc2a5fef048afb11a0331b30';
  static const String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWUzMjViNGJjMmE1ZmVmMDQ4YWZiMTFhMDMzMWIzMCIsInN1YiI6IjY1ZTgzZmY2M2ZlMTYwMDE3YjVkNmQ4MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N_8fxJGDTmdO0UoxOP1PMz-pRnNT21DfrymXCI1m3Ro';
}
