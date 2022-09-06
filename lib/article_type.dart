import 'bibisco_events.dart';
import 'article_data_all.dart';

class ArticleType {
  String name;
  List<dynamic>? data;
  // List of ids in data if applicable
  List? idIndex;
  Map binaryIndices;
  String? constraints; // @todo Check the type!!!
  List? uniqueNames; // @todo Check the type!!!
  Map transforms;
  String objType;
  bool dirty;
  int? cachedIndex; // @todo Check the type!!!
  int? cachedBinaryIndex; // @todo Check the type!!!
  int? cachedData; // @todo Check the type!!!
  bool adaptiveBinaryIndices;
  bool transactional;
  bool cloneObjects;
  String cloneMethod;
  bool asyncListeners;
  bool disableMeta;
  bool disableChangesApi;
  bool disableDeltaChangesApi;
  bool autoupdate;
  bool serializableIndices;
  bool disableFreeze;
  int? ttl;
  int maxId;
  List? DynamicViews; // @todo Create Class
  BibiscoEvents events;
  List? changes; // @todo Check the type!!!
  List? dirtyIds;
  bool isIncremental;


  ArticleType({
    required this.name,
    required this.data,
    this.idIndex,
    required this.binaryIndices,
    this.constraints,
    this.uniqueNames,
    required this.transforms,
    required this.objType,
    required this.dirty,
    this.cachedIndex,
    this.cachedBinaryIndex,
    this.cachedData,
    required this.adaptiveBinaryIndices,
    required this.transactional,
    required this.cloneObjects,
    required this.cloneMethod,
    required this.asyncListeners,
    required this.disableMeta,
    required this.disableChangesApi,
    required this.disableDeltaChangesApi,
    required this.autoupdate,
    required this.serializableIndices,
    required this.disableFreeze,
    this.ttl,
    required this.maxId,
    this.DynamicViews,
    required this.events,
    this.changes,
    this.dirtyIds,
    required this.isIncremental
  });

  factory ArticleType.fromJson(Map<String, dynamic> json) => ArticleType(
      name: json["name"],
      data: json["data"] == null ? null : getArticleData(json["name"], json["data"]),
      idIndex: json["idIndex"] == null ? null : List<dynamic>.from(json["idIndex"].map((x) => x)),
      binaryIndices: Map.from(json["binaryIndices"].map((k, v) => MapEntry<String, dynamic>(k, v))),
      constraints: json["constraints"],
      uniqueNames: json["uniqueNames"] == null ? null : List<dynamic>.from(json["uniqueNames"].map((x) => x)),
      transforms: Map<String, dynamic>.from(json["transforms"].map((x, i) => MapEntry<String, dynamic>(x, json["transforms"][i]))),
      objType: json["objType"],
      dirty: json["dirty"],
      cachedIndex: json["cachedIndex"],
      cachedBinaryIndex: json["cachedBinaryIndex"],
      cachedData: json["cachedData"],
      adaptiveBinaryIndices: json["adaptiveBinaryIndices"],
      transactional: json["transactional"],
      cloneObjects: json["cloneObjects"],
      cloneMethod: json["cloneMethod"],
      asyncListeners: json["asyncListeners"],
      disableMeta: json["disableMeta"],
      disableChangesApi: json["disableChangesApi"],
      disableDeltaChangesApi: json["disableDeltaChangesApi"],
      autoupdate: json["autoupdate"],
      serializableIndices: json["serializableIndices"],
      disableFreeze: json["disableFreeze"],
      ttl: json["ttl"],
      maxId: json["maxId"],
      DynamicViews: json["DynamicViews"] == null ? null : List<dynamic>.from(json["DynamicViews"].map((x) => x)),
      events: BibiscoEvents.fromJson(json["events"]),
      changes: json["changes"] == null ? null : List<dynamic>.from(json["changes"].map((x) => x)),
      dirtyIds: json["dirtyIds"] == null ? null : List<dynamic>.from(json["dirtyIds"].map((x) => x)),
      isIncremental: json["isIncremental"]
  );

  // toJson
  Map<String, dynamic> toJson() => {
    "name": name,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x)),
    "idIndex": idIndex == null ? null : List<dynamic>.from(idIndex!.map((x) => x)),
    "binaryIndices": Map.from(binaryIndices.map((k, v) => MapEntry<String, dynamic>(k, v))),
    "constraints": constraints,
    "uniqueNames": uniqueNames == null ? null : List<dynamic>.from(uniqueNames!.map((x) => x)),
    "transforms": Map<String, dynamic>.from(transforms.map((x, i) => MapEntry<String, dynamic>(x, transforms[x]))),
    "objType": objType,
    "dirty": dirty,
    "cachedIndex": cachedIndex,
    "cachedBinaryIndex": cachedBinaryIndex,
    "cachedData": cachedData,
    "adaptiveBinaryIndices": adaptiveBinaryIndices,
    "transactional": transactional,
    "cloneObjects": cloneObjects,
    "cloneMethod": cloneMethod,
    "asyncListeners": asyncListeners,
    "disableMeta": disableMeta,
    "disableChangesApi": disableChangesApi,
    "disableDeltaChangesApi": disableDeltaChangesApi,
    "autoupdate": autoupdate,
    "serializableIndices": serializableIndices,
    "disableFreeze": disableFreeze,
    "ttl": ttl,
    "maxId": maxId,
    "DynamicViews": DynamicViews == null ? null : List<dynamic>.from(DynamicViews!.map((x) => x)),
    "events": events.toJson(),
    "changes": changes == null ? null : List<dynamic>.from(changes!.map((x) => x)),
    "dirtyIds": dirtyIds,
    "isIncremental": isIncremental
  };

//Types
// 0 - project
// 1 - architecture
// 2 - strands
// 3 - chapters
// 4 - scenes
// 5 - maincharacters
// 6 - secondarycharacters
// 7 - locations
// 8 - notes
// 9 - objects
// 10 - parts
// 11 - relationsnodes
// 12 - relationsedges
// 13 - wordswrittenperday
// 14 - backups
  static List<dynamic> getArticleData(String article_type_name, List data) {
    switch(article_type_name) {
      // 0 - project
      case "project": {
        return List<ArticleDataProject>.from(data.map((x) =>
            ArticleDataProject.fromJson(x)));
      }
      // 1 - architecture
      case "architecture": {
        return List<ArticleDataArchitecture>.from(data.map((x) =>
            ArticleDataArchitecture.fromJson(x)));
      }
      // 2 - strands
      case "strands": {
        return List<ArticleDataStrand>.from(data.map((x) =>
            ArticleDataStrand.fromJson(x)));
      }
      // 3 - chapters
      case "chapters": {
        return List<ArticleDataChapter>.from(data.map((x) =>
            ArticleDataChapter.fromJson(x)));
      }
      // 4 - scenes
      case "scenes": {
        return List<ArticleDataScene>.from(data.map((x) =>
            ArticleDataScene.fromJson(x)));
      }
      // 5 - maincharacters
      case "maincharacters": {
        return List<ArticleDataMainCharacter>.from(data.map((x) =>
            ArticleDataMainCharacter.fromJson(x)));
      }
      // 6 - secondarycharacters
      case "secondarycharacters": {
        return List<ArticleDataSecondaryCharacter>.from(data.map((x) =>
            ArticleDataSecondaryCharacter.fromJson(x)));
      }
      // 7 - locations
      case "locations": {
        return List<ArticleDataLocation>.from(data.map((x) =>
            ArticleDataLocation.fromJson(x)));
      }
      // 8 - notes
      case "notes": {
        return List<ArticleDataNote>.from(data.map((x) =>
            ArticleDataNote.fromJson(x)));
      }
      // 9 - objects
      case "objects": {
        return List<ArticleDataObject>.from(data.map((x) =>
            ArticleDataObject.fromJson(x)));
      }
      // // 10 - parts
      // case "parts": {
      //   return List<ArticleDataPart>.from(data.map((x) =>
      //       ArticleDataPart.fromJson(x)));
      // }
      // 11 - relationsnodes
      case "relationsnodes": {
        return List<ArticleDataRelationsNode>.from(data.map((x) =>
            ArticleDataRelationsNode.fromJson(x)));
      }
      // 12 - relationsedges
      case "relationsedges": {
        return List<ArticleDataRelationsEdge>.from(data.map((x) =>
            ArticleDataRelationsEdge.fromJson(x)));
      }
      // 13 - wordswrittenperday
      case "wordswrittenperday": {
        return List<ArticleDataWordsWrittenPerDay>.from(data.map((x) =>
            ArticleDataWordsWrittenPerDay.fromJson(x)));
      }
      // 14 - backups
      case "backups": {
        return List<ArticleDataBackup>.from(data.map((x) =>
            ArticleDataBackup.fromJson(x)));
      }

      default: {
        return List<dynamic>.from(data.map((x) => x));
      }
    }
  }

}