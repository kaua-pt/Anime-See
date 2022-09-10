import 'package:animesee/model/Anime.dart';

class Popular extends Anime {
  String? animeId;
  String? animeUrl;

  Popular(
      {this.animeId,
      super.animeTitle,
      super.animeImg,
      super.releasedDate,
      this.animeUrl});

  Popular.fromJson(Map<String, dynamic> json) {
    animeId = json['animeId'];
    animeTitle = json['animeTitle'];
    animeImg = json['animeImg'];
    releasedDate = json['releasedDate'];
    animeUrl = json['animeUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animeId'] = this.animeId;
    data['animeTitle'] = this.animeTitle;
    data['animeImg'] = this.animeImg;
    data['releasedDate'] = this.releasedDate;
    data['animeUrl'] = this.animeUrl;
    return data;
  }
}
