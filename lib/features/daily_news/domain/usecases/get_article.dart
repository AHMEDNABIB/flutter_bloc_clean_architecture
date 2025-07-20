import 'package:flutter_bloc_clean/core/resources/data_state.dart';
import 'package:flutter_bloc_clean/core/usecases/usecase.dart';
import 'package:flutter_bloc_clean/features/daily_news/domain/entities/article.dart';
import 'package:flutter_bloc_clean/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase extends UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void article}) {
    return _articleRepository.getNewsArticles();
  }
}
