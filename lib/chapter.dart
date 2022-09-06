import './bibisco_meta.dart';
import './simple_note.dart';

// 3
class ArticleDataChapter {
  String title;
  ArticleDataSimpleNote reason;
  ArticleDataSimpleNote notes;
  int characters = 0;
  String lastsave;
  int position;
  String? status;
  int words = 0;
  BibiscoMeta meta;
  int $loki;

  ArticleDataChapter({
    required this.title,
    required this.reason,
    required this.notes,
    required this.characters,
    required this.lastsave,
    required this.position,
    this.status,
    required this.words,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataChapter.fromJson(Map<String, dynamic> json) =>
      ArticleDataChapter(
        title: json["title"],
        reason: ArticleDataSimpleNote.fromJson(json["reason"]),
        notes: ArticleDataSimpleNote.fromJson(json["notes"]),
        characters: json["characters"],
        lastsave: json["lastsave"],
        position: json["position"],
        status: json["status"],
        words: json["words"],
        meta: BibiscoMeta.fromJson(json["meta"]),
        $loki: json["\$loki"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "title": title,
        "reason": reason.toJson(),
        "notes": notes.toJson(),
        "characters": characters,
        "lastsave": lastsave,
        "position": position,
        "status": status,
        "words": words,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };

}
