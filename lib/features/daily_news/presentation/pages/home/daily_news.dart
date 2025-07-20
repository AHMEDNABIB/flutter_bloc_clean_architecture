import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daily News'),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticlesState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemoteArticlesError) {
        return Center(child: Icon(Icons.refresh));
      }

      if (state is RemoteArticlesDone) {
        return ListView.builder(
          itemCount: state.articles!.length,
          itemBuilder: (context, index) {
            final article = state.articles![index];
            return ListTile(
              title: Text(article.title ?? 'No Title'),
              subtitle: Text(article.description ?? 'No Description'),
              leading: article.urlToImage != null
                  ? Image.network(article.urlToImage!)
                  : null,
              onTap: () {
                // Handle article tap
              },
            );
          },
        );
      }

      return const SizedBox();
    });
  }
}
