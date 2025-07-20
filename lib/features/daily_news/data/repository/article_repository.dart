import 'package:flutter_bloc_clean/features/daily_news/domain/entities/article.dart';
import 'package:flutter_bloc_clean/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<List<ArticleEntity>> geNewsArticles() {
    // Implementation of fetching news articles will go here.
    // This is just a placeholder for now.
    throw UnimplementedError();
  }
}
