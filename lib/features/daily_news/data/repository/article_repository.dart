import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean/core/constants/constants.dart';
import 'package:flutter_bloc_clean/core/resources/data_state.dart';
import 'package:flutter_bloc_clean/features/daily_news/data/data_resources/remote/news_api_service.dart';
import 'package:flutter_bloc_clean/features/daily_news/data/models/article.dart';
import 'package:flutter_bloc_clean/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(
    this._newsApiService,
  );

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: apiKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
