import '../models/news_article_dto.dart';

abstract interface class NewsRemoteDatasource {
  Future<List<NewsArticleDto>> getCountryNews(String cca2, String countryName);
}
