import 'package:flutter_bloc_clean/core/resources/data_state.dart';
import 'package:flutter_bloc_clean/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
