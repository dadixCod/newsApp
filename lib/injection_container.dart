import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newscleanarch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:newscleanarch/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:newscleanarch/features/daily_news/domain/repository/article_repository.dart';
import 'package:newscleanarch/features/daily_news/domain/usecases/get_article.dart';
import 'package:newscleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';



//Factory registration will create a new instance each time you call it
//Singleton registration will get you the same instance in the lifetime of the app

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependecies --regestration
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(
      sl(),
    ),
  );

  //Use Cases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(
      sl(),
    ),
  );

  //Blocs

  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(sl())
  );
}
