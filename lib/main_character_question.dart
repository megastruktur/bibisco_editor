class ArticleDataMainCharacterQuestion {
  int? characters = 0;
  String? text;
  int? words = 0;

  ArticleDataMainCharacterQuestion({
    this.characters,
    this.text,
    this.words,
  });

  factory ArticleDataMainCharacterQuestion.fromJson(Map<String, dynamic> json) =>
      ArticleDataMainCharacterQuestion(
        characters: json["characters"],
        text: json["text"],
        words: json["words"],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "characters": characters,
        "text": text,
        "words": words,
      };
}
