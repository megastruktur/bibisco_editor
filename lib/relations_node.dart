import 'bibisco_meta.dart';

// 11
class ArticleDataRelationsNode {
  String id;
  int x;
  int y;
  String label;
  String group;
  String color;
  String shape;
  BibiscoMeta meta;
  int $loki;

  ArticleDataRelationsNode({
    required this.id,
    required this.x,
    required this.y,
    required this.label,
    required this.group,
    required this.color,
    required this.shape,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataRelationsNode.fromJson(Map<String, dynamic> json) =>
      ArticleDataRelationsNode(
        id: json["id"],
        x: json["x"],
        y: json["y"],
        label: json["label"],
        group: json["group"],
        color: json["color"],
        shape: json["shape"],
        meta: BibiscoMeta.fromJson(json["meta"]),
        $loki: json["\$loki"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "id": id,
        "x": x,
        "y": y,
        "label": label,
        "group": group,
        "color": color,
        "shape": shape,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };

}
