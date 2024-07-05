import 'package:newscleanarch/core/resources/data_state.dart';
import 'package:newscleanarch/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
