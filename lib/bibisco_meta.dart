class BibiscoMeta {
  int revision;
  int created;
  int version;
  int? updated;

  BibiscoMeta({
    required this.revision,
    required this.created,
    required this.version,
    required this.updated
  });

  factory BibiscoMeta.fromJson(Map<String, dynamic> json) => BibiscoMeta(
    revision: json["revision"],
    created: json["created"],
    version: json["version"],
    updated: json["updated"],
  );

  // toJson
  Map<String, dynamic> toJson() => {
    "revision": revision,
    "created": created,
    "version": version,
    "updated": updated,
  };
}
