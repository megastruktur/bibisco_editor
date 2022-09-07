import 'dart:convert';
import 'dart:io';
import 'globals.dart' as globals;
import 'bibisco_events.dart';
import 'article_type.dart';
import 'project.dart';
import 'architecture.dart';
import 'scene.dart';

class Book {
  String filename;
  List<ArticleType> collections;
  double databaseVersion;
  double engineVersion;
  bool autosave;
  int? autosaveinterval;
  String? autosaveHandle; // @todo Check the type!!!
  bool throttledSaves;
  BookOptions options;
  String persistenceMethod;
  String? persistenceAdapter;
  bool verbose;
  BibiscoEvents events;
  String ENV;
  bool isIncremental;

  ArticleDataProject get project => collections[0].data![0];
  ArticleDataArchitecture get premise => collections[1].data![0];
  ArticleDataArchitecture get fabula => collections[1].data![1];
  ArticleDataArchitecture get setting => collections[1].data![2];
  ArticleDataArchitecture get globalnotes => collections[1].data![3];

  // List of ArticleDataScene
  List? get scenes => collections[4].data;

  // List of ArticleDataChapter
  List? get chapters => collections[3].data;

  // getSceneById
  ArticleDataScene? getSceneById(int id) {
    for (var scene in scenes!) {
      if (scene.$loki == id) {
        return scene;
      }
    }
    return null;
  }
  // setSceneById
  setSceneById(int id, ArticleDataScene scene) {
    for (var i = 0; i < collections[4].data!.length; i++) {
      if (collections[4].data![i].$loki == id) {
        collections[4].data![i] = scene;
      }
    }
  }

  Book({
    required this.filename,
    required this.collections,
    required this.databaseVersion,
    required this.engineVersion,
    required this.autosave,
    this.autosaveinterval,
    this.autosaveHandle,
    required this.throttledSaves,
    required this.options,
    required this.persistenceMethod,
    this.persistenceAdapter,
    required this.verbose,
    required this.events,
    required this.ENV,
    required this.isIncremental,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    filename: json["filename"],
    collections: List<ArticleType>.from(json["collections"].map((x) => ArticleType
        .fromJson(x))),
    databaseVersion: json["databaseVersion"] == null ? 0.0 : json["databaseVersion"].toDouble(),
    engineVersion: json["engineVersion"] == null ? 0.0 : json["engineVersion"].toDouble(),
    autosave: json["autosave"],
    autosaveinterval: json["autosaveinterval"],
    autosaveHandle: json["autosaveHandle"],
    throttledSaves: json["throttledSaves"],
    options: BookOptions.fromJson(json["options"]),
    persistenceMethod: json["persistenceMethod"],
    persistenceAdapter: json["persistenceAdapter"],
    verbose: json["verbose"],
    events: BibiscoEvents.fromJson(json["events"]),
    ENV: json["ENV"],
    isIncremental: json["isIncremental"],
  );

  factory Book.toJson(Book book) => Book(
    filename: book.filename,
    collections: book.collections,
    databaseVersion: book.databaseVersion,
    engineVersion: book.engineVersion,
    autosave: book.autosave,
    autosaveinterval: book.autosaveinterval,
    autosaveHandle: book.autosaveHandle,
    throttledSaves: book.throttledSaves,
    options: book.options,
    persistenceMethod: book.persistenceMethod,
    persistenceAdapter: book.persistenceAdapter,
    verbose: book.verbose,
    events: book.events,
    ENV: book.ENV,
    isIncremental: book.isIncremental,
  );

  // toJson method
  Map<String, dynamic> toJson() => {
    "filename": filename,
    "collections": List<dynamic>.from(collections.map((x) => x.toJson())),
    "databaseVersion": databaseVersion,
    "engineVersion": engineVersion,
    "autosave": autosave,
    "autosaveinterval": autosaveinterval,
    "autosaveHandle": autosaveHandle,
    "throttledSaves": throttledSaves,
    "options": options.toJson(),
    "persistenceMethod": persistenceMethod,
    "persistenceAdapter": persistenceAdapter,
    "verbose": verbose,
    "events": events.toJson(),
    "ENV": ENV,
    "isIncremental": isIncremental,
  };

  Future<bool> save() async {
    try {
      String json = jsonEncode(this);
      File file = File(globals.bookFilePath);
      file.writeAsString(json);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  void addScene(ArticleDataScene scene) {
    collections[4].maxId++;
    scene.$loki = collections[4].maxId;
    collections[4].data!.add(scene);
  }
}

// Function to Load the book from the assets folder into global variable book
Future<Book> loadBookToGlobals() async {
  try {
    if (globals.bookFilePath != '') {
      String jsonString = await File(globals.bookFilePath).readAsString();
      return Book.fromJson(jsonDecode(jsonString));
    } else {
      print('No book file path');
      return Book.fromJson({});
    }
  } catch (e) {
    rethrow;
  }
}

class BookOptions {
  String adapter; // @todo Check the type!!!
  String serializationMethod;
  String destructureDelimiter;

  BookOptions({
    required this.adapter,
    required this.serializationMethod,
    required this.destructureDelimiter,
  });

  factory BookOptions.fromJson(Map<String, dynamic> json) => BookOptions(
    adapter: json["adapter"] ?? '',
    serializationMethod: json["serializationMethod"] ?? '',
    destructureDelimiter: json["destructureDelimiter"] ?? '',
  );

  Map<String, dynamic> toJson() => {
        adapter: adapter,
        serializationMethod: serializationMethod,
        destructureDelimiter: destructureDelimiter,
      };
}
