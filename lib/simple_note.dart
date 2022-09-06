import 'bibisco_meta.dart';

class ArticleDataSimpleNote {

  int characters = 0;
  String lastsave;
  String? status;
  String? text;
  int words = 0;

  ArticleDataSimpleNote({
    required this.characters,
    required this.lastsave,
    this.status,
    this.text,
    required this.words,
  });

  factory ArticleDataSimpleNote.fromJson(Map<String, dynamic> json) =>
      ArticleDataSimpleNote(
        characters: json["characters"],
        lastsave: json["lastsave"],
        status: json["status"],
        text: json["text"],
        words: json["words"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "characters": characters,
        "lastsave": lastsave,
        "status": status,
        "text": text,
        "words": words,
      };

}
