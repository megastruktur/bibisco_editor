import 'bibisco_meta.dart';

// 1
class ArticleDataArchitecture {
  String type;
  String? text;
  int characters = 0;
  int position;
  String? status;
  int words;
  String lastsave;
  BibiscoMeta meta;
  int $loki;

  ArticleDataArchitecture({
    required this.type,
    this.text,
    required this.characters,
    required this.position,
    this.status,
    required this.words,
    required this.lastsave,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataArchitecture.fromJson(Map<String, dynamic> json) =>
      ArticleDataArchitecture(
        type: json["type"],
        text: json["text"],
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
    "type": type,
    "text": text,
    "characters": characters,
    "position": position,
    "status": status,
    "words": words,
    "lastsave": lastsave,
    "meta": meta.toJson(),
    "\$loki": $loki,
  };

}