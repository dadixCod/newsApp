import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newscleanarch/config/theme/app_theme.dart';
import 'package:newscleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:newscleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:newscleanarch/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:newscleanarch/injection_container.dart';

void main() async {
  await initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
