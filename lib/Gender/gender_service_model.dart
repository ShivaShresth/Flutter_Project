// To parse this JSON data, do
//
//     final genderServiceModel = genderServiceModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GenderServiceModel genderServiceModelFromJson(String str) => GenderServiceModel.fromJson(json.decode(str));

String genderServiceModelToJson(GenderServiceModel data) => json.encode(data.toJson());

class GenderServiceModel {
    final int count;
    final String name;
    final String gender;
    final double probability;

    GenderServiceModel({
        required this.count,
        required this.name,
        required this.gender,
        required this.probability,
    });

    factory GenderServiceModel.fromJson(Map<String, dynamic> json) => GenderServiceModel(
        count: json["count"],
        name: json["name"],
        gender: json["gender"],
        probability: json["probability"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "gender": gender,
        "probability": probability,
    };
}
