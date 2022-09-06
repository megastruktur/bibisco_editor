import './main_character_question.dart';

class ArticleDataMainCharacterData {

  int? freetextcharacters = 0;
  String? freetext;
  bool freetextenabled;
  String? status;
  int freetextwords = 0;
  List<ArticleDataMainCharacterQuestion> questions;

  ArticleDataMainCharacterData({
    this.freetextcharacters,
    this.freetext,
    required this.freetextenabled,
    this.status,
    required this.freetextwords,
    required this.questions,
  });

  factory ArticleDataMainCharacterData.fromJson(Map<String, dynamic>? json) =>
      ArticleDataMainCharacterData(
        freetextcharacters: json!["freetextcharacters"],
        freetext: json["freetext"],
        freetextenabled: json["freetextenabled"],
        status: json["status"],
        freetextwords: json["freetextwords"],
        questions: List<ArticleDataMainCharacterQuestion>.from(json["questions"].map((x) => ArticleDataMainCharacterQuestion.fromJson(x))),
      );

  // toJson
  Map<String, dynamic> toJson() => {
        "freetextcharacters": freetextcharacters,
        "freetext": freetext,
        "freetextenabled": freetextenabled,
        "status": status,
        "freetextwords": freetextwords,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };

}
