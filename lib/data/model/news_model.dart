// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String status;
  int totalResults;
  List<Result> results;
  String nextPage;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  String articleId;
  String title;
  String link;
  List<String>? keywords;
  List<String>? creator;
  dynamic videoUrl;
  String? description;
  String content;
  String pubDate;
  String? imageUrl;
  String sourceId;
  int sourcePriority;
  List<String>? country;
  List<Category> category;
  Language language;

  Result({
    required this.articleId,
    required this.title,
    required this.link,
    required this.keywords,
    required this.creator,
    required this.videoUrl,
    required this.description,
    required this.content,
    required this.pubDate,
    required this.imageUrl,
    required this.sourceId,
    required this.sourcePriority,
    required this.country,
    required this.category,
    required this.language,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        articleId: json["article_id"],
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
        creator: json["creator"] == null
            ? []
            : List<String>.from(json["creator"]!.map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: json["content"],
        //pubDate: DateTime.parse(json["pubDate"]),
        pubDate: DateFormat.yMMMd().format(DateTime.parse(json['pubDate'])),
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        sourcePriority: json["source_priority"],
        country: List<String>.from(json["country"].map((x) => x)),
        category: List<Category>.from(
            json["category"].map((x) => categoryValues.map[x]!)),
        language: languageValues.map[json["language"]]!,
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "title": title,
        "link": link,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "creator":
            creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate,
        "image_url": imageUrl,
        "source_id": sourceId,
        "source_priority": sourcePriority,
        //"country": List<dynamic>.from(country.map((x) => x)),
        "country": country == null
            ? ["No Country"]
            : List<dynamic>.from(country!.map((x) => x)),
        "category":
            List<dynamic>.from(category.map((x) => categoryValues.reverse[x])),
        "language": languageValues.reverse[language],
      };
}

enum Category { SPORTS, TOP }

final categoryValues =
    EnumValues({"sports": Category.SPORTS, "top": Category.TOP});

enum Language { PORTUGUESE, SPANISH }

final languageValues = EnumValues(
    {"portuguese": Language.PORTUGUESE, "spanish": Language.SPANISH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
