import 'package:animesee/model/Anime.dart';

class AnimeDetail extends Anime {
  String? type;
  String? status;
  List<String>? genres;
  String? synopsis;
  String? totalEpisodes;

  AnimeDetail(
      {super.animeTitle,
      this.type,
      super.releasedDate,
      this.status,
      this.genres,
      this.synopsis,
      super.animeImg,
      this.totalEpisodes});

  AnimeDetail.fromJson(Map<String, dynamic> json) {
    animeTitle = json['animeTitle'];
    type = json['type'];
    releasedDate = json['releasedDate'];
    status = json['status'];
    genres = json['genres'].cast<String>();
    synopsis = json['synopsis'];
    animeImg = json['animeImg'];
    totalEpisodes = json['totalEpisodes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animeTitle'] = this.animeTitle;
    data['type'] = this.type;
    data['releasedDate'] = this.releasedDate;
    data['status'] = this.status;
    data['genres'] = this.genres;
    data['synopsis'] = this.synopsis;
    data['animeImg'] = this.animeImg;
    data['totalEpisodes'] = this.totalEpisodes;
    return data;
  }

  String getGender() {
    String gender = "";
    for (String element in genres!) {
      gender = gender + element + " ";
    }
    return gender;
  }
}
