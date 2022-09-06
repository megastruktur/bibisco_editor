import 'bibisco_meta.dart';

// 8
class ArticleDataNote {
  String? description;
  String name;
  List? images;
  int? characters = 0;
  String lastsave;
  int position;
  int? words = 0;
  BibiscoMeta meta;
  int $loki;

  ArticleDataNote({
    this.description,
    required this.name,
    this.images,
    this.characters,
    required this.lastsave,
    required this.position,
    this.words,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataNote.fromJson(Map<String, dynamic> json) =>
      ArticleDataNote(
        description: json["description"],
        name: json["name"],
        images: json["images"] == null ? null : List<dynamic>.from(json["images"].map((x) => x)),
        characters: json["characters"],
        lastsave: json["lastsave"],
        position: json["position"],
        words: json["words"],
        meta: BibiscoMeta.fromJson(json["meta"]),
        $loki: json["\$loki"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "description": description,
        "name": name,
        "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "characters": characters,
        "lastsave": lastsave,
        "position": position,
        "words": words,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };

}
