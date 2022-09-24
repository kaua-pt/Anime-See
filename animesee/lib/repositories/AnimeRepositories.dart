import 'package:animesee/config/utils.dart';
import 'package:animesee/model/AnimeDetail.dart';
import 'package:animesee/model/Popular.dart';
import 'package:dio/dio.dart';

class AnimeRepositories {
  final dio = Dio();
  final List returnListPopular = [];
  final List<AnimeDetail> returnAnime = [];

  Future fetchPopular() async {
    final response = await dio.get(URLPOPULAR);
    final list = response.data as List;

    for (var json in list) {
      final model = Popular.fromJson(json);
      returnListPopular.add(model);
    }
  }

  Future fetchDetail(String anime) async {
    final response = await dio.get(URLDETAIL + anime);
    final list = response.data;
    returnAnime.add(AnimeDetail.fromJson(list));
  }

  getReturn() {
    return returnListPopular;
  }

  getDetail() {
    return returnAnime;
  }
}
