import '../../domain/entities/quote.dart';

class RandomQuoteModel extends Quote {

  const RandomQuoteModel({
    required String author,
    required int id,
    required String content,
  }) : super(
          id: id,
          author: author,
          content: content,
        );

  factory RandomQuoteModel.fromJson(Map<String, dynamic> json) => RandomQuoteModel(
    id: json["_id"],
    content: json["content"],
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "author": author,
    };
}
