import 'bibisco_meta.dart';

// 0
class ArticleDataProject {

  String id;
  String name;
  String language;
  String author;
  String bibiscoVersion;
  String? lastScenetimeTag; // @todo Check the type
  String lastsave;
  BibiscoMeta meta;
  int $loki;

  ArticleDataProject({
    required this.id,
    required this.name,
    required this.language,
    required this.author,
    required this.bibiscoVersion,
    this.lastScenetimeTag,
    required this.lastsave,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataProject.fromJson(Map<String, dynamic> json) =>
      ArticleDataProject(
        id: json["id"],
        name: json["name"],
        language: json["language"],
        author: json["author"],
        bibiscoVersion: json["bibiscoVersion"],
        lastScenetimeTag: json["lastScenetimeTag"],
        lastsave: json["lastsave"],
        meta: BibiscoMeta.fromJson(json["meta"]),
        $loki: json["\$loki"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "language": language,
        "author": author,
        "bibiscoVersion": bibiscoVersion,
        "lastScenetimeTag": lastScenetimeTag,
        "lastsave": lastsave,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };

}
