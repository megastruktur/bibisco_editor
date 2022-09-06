import 'editable.dart';
import 'globals.dart' as globals;

class ArticleDataSceneRevision implements Editable {

  int? characters = 0;
  int? locationid;
  String? povid;
  String? povcharacterid;
  List? scenecharacters;
  List? sceneobjects;
  List? scenestrands;
  String text;
  String? time;
  bool? timegregorian;
  int? words = 0;

  ArticleDataSceneRevision({
    this.characters,
    this.locationid,
    this.povid,
    this.povcharacterid,
    this.scenecharacters,
    this.sceneobjects,
    this.scenestrands,
    required this.text,
    this.time,
    this.timegregorian,
    this.words,
  });

  factory ArticleDataSceneRevision.fromJson(Map<String, dynamic> json) =>
      ArticleDataSceneRevision(
        characters: json["characters"],
        locationid: json["locationid"],
        povid: json["povid"],
        povcharacterid: json["povcharacterid"],
        scenecharacters: json["scenecharacters"],
        sceneobjects: json["sceneobjects"],
        scenestrands: json["scenestrands"],
        text: json["text"],
        time: json["time"],
        timegregorian: json["timegregorian"],
        words: json["words"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "characters": characters,
        "locationid": locationid,
        "povid": povid,
        "povcharacterid": povcharacterid,
        "scenecharacters": scenecharacters,
        "sceneobjects": sceneobjects,
        "scenestrands": scenestrands,
        "text": text,
        "time": time,
        "timegregorian": timegregorian,
        "words": words,
      };


  @override
  String getTextName() {
    // TODO: implement getTextName
    throw UnimplementedError();
  }

  @override
  void setTextName(String newValue) {
    // TODO: implement setTextName
  }

  @override
  String getTextEditField() {
    return text;
  }

  @override
  void setTextEditField(String? newValue) {
    // super execute
    text = newValue ?? '';
    words = text.split(' ').length;
  }

}
