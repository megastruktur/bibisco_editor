import 'bibisco_meta.dart';

// 13
class ArticleDataWordsWrittenPerDay {
  int? day;
  int? words;
  BibiscoMeta meta;
  int $loki;

  ArticleDataWordsWrittenPerDay({
    this.day,
    this.words,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataWordsWrittenPerDay.fromJson(Map<String, dynamic> json) =>
      ArticleDataWordsWrittenPerDay(
        day: json["day"],
        words: json["words"],
        meta: BibiscoMeta.fromJson(json["meta"]),
        $loki: json["\$loki"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "day": day,
        "words": words,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };

}
