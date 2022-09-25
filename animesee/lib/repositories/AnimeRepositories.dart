import 'package:animesee/config/utils.dart';
import 'package:animesee/model/AnimeDetail.dart';
import 'package:animesee/model/Popular.dart';
import 'package:dio/dio.dart';

class AnimeRepositories {
  final dio = Dio();
  final List returnListPopular = [];
  final List returnListGenre = [];
  final List<AnimeDetail> returnAnime = [];
  final List returnListMovies = [];

  Future fetchPopular() async {
    final response = await dio.get(URLPOPULAR);
    final list = response.data as List;

    for (var json in list) {
      final model = Popular.fromJson(json);
      returnListPopular.add(model);
    }
  }

  Future fetchMovies() async {
    final response = await dio.get(URLMOVIES);
    final list = response.data as List;

    for (var json in list) {
      final model = Popular.fromJson(json);
      returnListMovies.add(model);
    }
  }

  Future fetchGenre(String genre) async {
    final response = await dio.get(URLGENRE + genre);
    final list = response.data as List;
    for (var json in list) {
      final model = Popular.fromJson(json);
      returnListGenre.add(model);
    }
  }

  Future fetchDetail(String anime) async {
    final response = await dio.get(URLDETAIL + anime);
    final list = response.data;
    returnAnime.add(AnimeDetail.fromJson(list));
  }

  Future<String> getAnimeId(String animeName) async {
    return "aa";
  }

  getReturn() {
    return returnListPopular;
  }

  getGenre() {
    return returnListGenre;
  }

  getDetail() {
    return returnAnime;
  }

  getMovies() {
    return returnListMovies;
  }
}
