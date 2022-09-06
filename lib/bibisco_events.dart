class BibiscoEvents {
  List? init;
  List? loaded;
  List? flushChanges;
  List? close;
  List? changes;
  List? warning;

  BibiscoEvents({
    this.init,
    this.loaded,
    this.flushChanges,
    this.close,
    this.changes,
    this.warning,
  });

  factory BibiscoEvents.fromJson(Map<String, dynamic> json) => BibiscoEvents(
    init: json["init"] == null ? null : List<dynamic>.from(json["init"].map
      ((x) => x)),
    loaded: json["loaded"] == null ? null : List<dynamic>.from(json["loaded"].map((x) => x)),
    flushChanges: json["flushChanges"] == null ? null : List<dynamic>.from(json["flushChanges"].map((x) => x)),
    close: json["close"] == null ? null : List<dynamic>.from(json["close"].map((x) => x)),
    changes: json["changes"] == null ? null : List<dynamic>.from(json["changes"].map((x) => x)),
    warning: json["warning"] == null ? null : List<dynamic>.from(json["warning"].map((x) => x)),
  );

  // toJson
  Map<String, dynamic> toJson() => {
    "init": init == null ? null : List<dynamic>.from(init!.map((x) => x)),
    "loaded": loaded == null ? null : List<dynamic>.from(loaded!.map((x) => x)),
    "flushChanges": flushChanges == null ? null : List<dynamic>.from(flushChanges!.map((x) => x)),
    "close": close == null ? null : List<dynamic>.from(close!.map((x) => x)),
    "changes": changes == null ? null : List<dynamic>.from(changes!.map((x) => x)),
    "warning": warning == null ? null : List<dynamic>.from(warning!.map((x) => x)),
  };
}