import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean/core/resources/data_state.dart';
import 'package:flutter_bloc_clean/features/daily_news/domain/entities/article.dart';
import 'package:flutter_bloc_clean/features/daily_news/domain/usecases/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(_onGetArticles);
  }

  void _onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emit) async {
    emit(const RemoteArticlesLoading());

    final dataState = await _getArticleUseCase();

    print('Data State: $dataState');

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      print('Error occurred: ${dataState.error}');
      print('Error message: ${dataState.error?.message}');
      print('Error type: ${dataState.error?.type}');
      print('Response status code: ${dataState.error?.response?.statusCode}');
      print('Response data: ${dataState.error?.response?.data}');
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
