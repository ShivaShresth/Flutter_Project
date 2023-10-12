// To parse this JSON data, do
//
//     final newsServiceModel = newsServiceModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<NewsServiceModel> newsServiceModelFromJson(String str) => List<NewsServiceModel>.from(json.decode(str).map((x) => NewsServiceModel.fromJson(x)));

String newsServiceModelToJson(List<NewsServiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsServiceModel {
    final String id;
    final String title;
    final String date;
    final String image;
    final String video;
    final String introText;
    final String description;

    NewsServiceModel({
        required this.id,
        required this.title,
        required this.date,
        required this.image,
        required this.video,
        required this.introText,
        required this.description,
    });

    factory NewsServiceModel.fromJson(Map<String, dynamic> json) => NewsServiceModel(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        image: json["image"],
        video: json["video"],
        introText: json["intro_text"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date": date,
        "image": image,
        "video": video,
        "intro_text": introText,
        "description": description,
    };
}
