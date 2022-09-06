import 'bibisco_meta.dart';

// 7
class ArticleDataLocation {
  String? description;
  String? city;
  String location;
  String? nation;
  String? state;
  List? images;
  int? characters = 0;
  String lastsave;
  int position;
  int? words = 0;
  BibiscoMeta meta;
  int $loki;

  ArticleDataLocation({
    this.description,
    this.city,
    required this.location,
    this.nation,
    this.state,
    this.images,
    this.characters,
    required this.lastsave,
    required this.position,
    this.words,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataLocation.fromJson(Map<String, dynamic> json) =>
      ArticleDataLocation(
        description: json["description"],
        city: json["city"],
        location: json["location"],
        nation: json["nation"],
        state: json["state"],
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
        "city": city,
        "location": location,
        "nation": nation,
        "state": state,
        "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "characters": characters,
        "lastsave": lastsave,
        "position": position,
        "words": words,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };

}
