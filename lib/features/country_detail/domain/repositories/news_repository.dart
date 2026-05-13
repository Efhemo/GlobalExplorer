import '../../../../core/errors/either.dart';
import '../../../../core/errors/failures.dart';
import '../entities/news_article.dart';

abstract interface class NewsRepository {
  Future<Either<Failure, List<NewsArticle>>> getCountryNews(
    String cca2,
    String countryName,
  );
}
