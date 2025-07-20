import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean/core/constants/constants.dart';
import 'package:flutter_bloc_clean/features/daily_news/data/models/news_response.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<NewsResponse>> getNewsArticles({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
