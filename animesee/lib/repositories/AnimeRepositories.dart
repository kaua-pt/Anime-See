import 'package:animesee/model/AnimeDetail.dart';
import 'package:animesee/model/Popular.dart';
import 'package:dio/dio.dart';

class AnimeRepositories {
  final dio = Dio();

  Future<List<Popular>> fetchPopular() async {
    final response = await dio.get("https://gogoanime.herokuapp.com/popular");
    final list = response.data as List;

    List<Popular> returnList = [];
    for (var json in list) {
      final model = Popular.fromJson(json);
      returnList.add(model);
    }

    return returnList;
  }

  Future<List<AnimeDetail>> fetchDetail(String anime) async {
    final response =
        await dio.get("https://gogoanime.herokuapp.com/anime-details/$anime");
    final list = response.data as List;

    List<AnimeDetail> returnList = [];
    for (var json in list) {
      final model = AnimeDetail.fromJson(json);
      returnList.add(model);
    }
    return returnList;
  }
}
