import 'package:flutter_bloc_clean/features/daily_news/data/models/article.dart';

class NewsResponse {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((article) =>
              ArticleModel.fromJson(article as Map<String, dynamic>))
          .toList(),
    );
  }
}
