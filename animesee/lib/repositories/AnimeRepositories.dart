import 'package:animesee/model/AnimeDetail.dart';
import 'package:animesee/model/Popular.dart';
import 'package:animesee/services/DBfirestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class AnimeRepositories {
  final dio = Dio();
  late final List returnList = [];
  late FirebaseFirestore db = DBfirestore.get();

  Future fetchPopular() async {
    final response = await dio.get("https://gogoanime.herokuapp.com/popular");
    final list = response.data as List;

    for (var json in list) {
      final model = Popular.fromJson(json);
      returnList.add(model);
    }
  }

  Future getFromApiDetail(String anime) async {
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

  getReturn() {
    return returnList;
  }
}
