// To parse this JSON data, do
//
//     final nameServiceModel = nameServiceModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NameServiceModel nameServiceModelFromJson(String str) => NameServiceModel.fromJson(json.decode(str));

String nameServiceModelToJson(NameServiceModel data) => json.encode(data.toJson());

class NameServiceModel {
    final int count;
    final String name;
    final List<Country> country;

    NameServiceModel({
        required this.count,
        required this.name,
        required this.country,
    });

    factory NameServiceModel.fromJson(Map<String, dynamic> json) => NameServiceModel(
        count: json["count"],
        name: json["name"],
        country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "country": List<dynamic>.from(country.map((x) => x.toJson())),
    };
}

class Country {
    final String countryId;
    final double probability;

    Country({
        required this.countryId,
        required this.probability,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["country_id"],
        probability: json["probability"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "probability": probability,
    };
}
