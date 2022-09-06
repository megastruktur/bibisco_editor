import 'bibisco_meta.dart';
import 'editable.dart';
import 'scene_revision.dart';

// 4
class ArticleDataScene implements Editable {

  String title;
  int chapterid;
  int revision;
  List<ArticleDataSceneRevision> revisions;
  int characters = 0;
  String lastsave;
  int position;
  String? status;
  int words = 0;
  BibiscoMeta meta;
  int $loki;

  ArticleDataScene({
    required this.title,
    required this.chapterid,
    required this.revision,
    required this.revisions,
    required this.characters,
    required this.lastsave,
    required this.position,
    this.status,
    required this.words,
    required this.meta,
    required this.$loki,
  });

  factory ArticleDataScene.fromJson(Map<String, dynamic> json) =>
      ArticleDataScene(
        title: json["title"],
        chapterid: json["chapterid"],
        revision: json["revision"],
        revisions: List<ArticleDataSceneRevision>.from(json["revisions"].map((x) => ArticleDataSceneRevision.fromJson(x))),
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
        "chapterid": chapterid,
        "revision": revision,
        "revisions": List<dynamic>.from(revisions.map((x) => x.toJson())),
        "characters": characters,
        "lastsave": lastsave,
        "position": position,
        "status": status,
        "words": words,
        "meta": meta.toJson(),
        "\$loki": $loki,
      };

  @override
  String? getTextEditField() {
    return revisions[0].text;
  }

  @override
  String? getTextName() {
    return title;
  }

  @override
  void setTextEditField(String? newValue) {
    revisions[0].text = newValue ?? '';
  }

  @override
  void setTextName(String newValue) {
    // TODO: implement setTextName
  }
}
