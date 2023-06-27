// To parse this JSON data, do
//
//     final samplePost = samplePostFromJson(jsonString);

import 'dart:convert';

List<SamplePost> samplePostFromJson(String str) =>
    List<SamplePost>.from(json.decode(str).map((x) => SamplePost.fromJson(x)));

String samplePostToJson(List<SamplePost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamplePost {
  SamplePost({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory SamplePost.fromJson(Map<String, dynamic> json) => SamplePost(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}