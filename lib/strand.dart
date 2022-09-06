import 'bibisco_meta.dart';

// 2
class ArticleDataStrand {
  String? description;
  String name;
  int? characters = 0;
  int? position;
  String? status;
  int? words;
  String lastsave;
  BibiscoMeta meta;
  int $loki;

  ArticleDataStrand({
    this.description,
    required this.name,
    this.characters,
    this.position,
    this.status,
    this.words,
    required this.lastsave,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataStrand.fromJson(Map<String, dynamic> json) =>
      ArticleDataStrand(
        description: json["description"],
        name: json["name"],
        characters: json["characters"],
        position: json["position"],
        status: json["status"],
        words: json["words"],
        lastsave: json["lastsave"],
        meta: BibiscoMeta.fromJson(json["meta"]),
        $loki: json["\$loki"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "description": description,
        "name": name,
        "characters": characters,
        "position": position,
        "status": status,
        "words": words,
        "lastsave": lastsave,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };

}
