import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean/features/daily_news/data/data_resources/remote/news_api_service.dart';
import 'package:flutter_bloc_clean/features/daily_news/data/repository/article_repository.dart';
import 'package:flutter_bloc_clean/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_bloc_clean/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_bloc_clean/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> intializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl()),
  );

  sl.registerFactory(() => RemoteArticleBloc(sl()));
}
