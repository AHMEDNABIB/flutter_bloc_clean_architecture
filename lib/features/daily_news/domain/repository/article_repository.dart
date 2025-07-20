import 'package:flutter_bloc_clean/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<List<ArticleEntity>> geNewsArticles();
}
