class ArticleDefaultTextWithStatus {
  int characters = 0;
  String? status;
  String? text;
  int words = 0;

  ArticleDefaultTextWithStatus({
    required this.characters,
     this.status,
    this.text,
    required this.words,
  });

  factory ArticleDefaultTextWithStatus.fromJson(Map<String, dynamic> json) =>
      ArticleDefaultTextWithStatus(
    characters: json["characters"],
    status: json["status"],
    text: json["text"],
    words: json["words"],
  );

  // toJson
  Map<String, dynamic> toJson() => {
    "characters": characters,
    "status": status,
    "text": text,
    "words": words,
  };
}
