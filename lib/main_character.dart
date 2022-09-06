import './bibisco_meta.dart';
import './main_character_data.dart';
import './article_default_text_with_status.dart';

// 5
class ArticleDataMainCharacter {

  String? description;
  String name;
  ArticleDataMainCharacterData personaldata;
  ArticleDataMainCharacterData physionomy;
  ArticleDataMainCharacterData behaviors;
  ArticleDataMainCharacterData sociology;
  ArticleDataMainCharacterData psychology;
  ArticleDataMainCharacterData ideas;
  ArticleDefaultTextWithStatus lifebeforestorybeginning;
  ArticleDefaultTextWithStatus conflict;
  ArticleDefaultTextWithStatus evolutionduringthestory;
  List? images;
  int? characters = 0;
  String lastsave;
  String? status;
  int position;
  int? words = 0;
  BibiscoMeta meta;
  int $loki;

  ArticleDataMainCharacter({
    this.description,
    required this.name,
    required this.personaldata,
    required this.physionomy,
    required this.behaviors,
    required this.sociology,
    required this.psychology,
    required this.ideas,
    required this.lifebeforestorybeginning,
    required this.conflict,
    required this.evolutionduringthestory,
    this.images,
    this.characters,
    required this.lastsave,
    this.status,
    required this.position,
    this.words,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataMainCharacter.fromJson(Map<String, dynamic> json) =>
      ArticleDataMainCharacter(
        description: json["description"],
        name: json["name"],
        personaldata: ArticleDataMainCharacterData.fromJson(json["personaldata"]),
        physionomy: ArticleDataMainCharacterData.fromJson(json["physionomy"]),
        behaviors: ArticleDataMainCharacterData.fromJson(json["behaviors"]),
        sociology: ArticleDataMainCharacterData.fromJson(json["sociology"]),
        psychology: ArticleDataMainCharacterData.fromJson(json["psychology"]),
        ideas: ArticleDataMainCharacterData.fromJson(json["ideas"]),
        lifebeforestorybeginning: ArticleDefaultTextWithStatus.fromJson(json["lifebeforestorybeginning"]),
        conflict: ArticleDefaultTextWithStatus.fromJson(json["conflict"]),
        evolutionduringthestory: ArticleDefaultTextWithStatus.fromJson(json["evolutionduringthestory"]),
        images: json["images"] == null ? null : List<dynamic>.from(json["images"].map((x) => x)),
        characters: json["characters"],
        lastsave: json["lastsave"],
        status: json["status"],
        position: json["position"],
        words: json["words"],
        meta: BibiscoMeta.fromJson(json["meta"]),
        $loki: json["\$loki"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "description": description,
        "name": name,
        "personaldata": personaldata.toJson(),
        "physionomy": physionomy.toJson(),
        "behaviors": behaviors.toJson(),
        "sociology": sociology.toJson(),
        "psychology": psychology.toJson(),
        "ideas": ideas.toJson(),
        "lifebeforestorybeginning": lifebeforestorybeginning.toJson(),
        "conflict": conflict.toJson(),
        "evolutionduringthestory": evolutionduringthestory.toJson(),
        "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "characters": characters,
        "lastsave": lastsave,
        "status": status,
        "position": position,
        "words": words,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };
}
