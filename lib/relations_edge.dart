import 'bibisco_meta.dart';

// 12
class ArticleDataRelationsEdge {
  String from;
  String to;
  String id;
  String label;
  BibiscoMeta meta;
  int $loki;

  ArticleDataRelationsEdge({
    required this.from,
    required this.to,
    required this.id,
    required this.label,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataRelationsEdge.fromJson(Map<String, dynamic> json) =>
      ArticleDataRelationsEdge(
        from: json["from"],
        to: json["to"],
        id: json["id"],
        label: json["label"],
        meta: BibiscoMeta.fromJson(json["meta"]),
        $loki: json["\$loki"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "id": id,
        "label": label,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };

}
