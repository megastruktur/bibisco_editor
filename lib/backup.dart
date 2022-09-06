import './bibisco_meta.dart';

// 14
class ArticleDataBackup {
  String filename;
  String timestamp;
  int? characters = 0;
  String lastsave;
  int position;
  String? status;
  int? words = 0;
  BibiscoMeta meta;
  int $loki;

  ArticleDataBackup({
    required this.filename,
    required this.timestamp,
    this.characters,
    required this.lastsave,
    required this.position,
    this.status,
    this.words,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataBackup.fromJson(Map<String, dynamic> json) =>
      ArticleDataBackup(
        filename: json["filename"],
        timestamp: json["timestamp"],
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
        "filename": filename,
        "timestamp": timestamp,
        "characters": characters,
        "lastsave": lastsave,
        "position": position,
        "status": status,
        "words": words,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };
}
