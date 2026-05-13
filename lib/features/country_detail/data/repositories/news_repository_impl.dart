import '../../../../core/errors/either.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl(this._datasource);

  final NewsRemoteDatasource _datasource;

  @override
  Future<Either<Failure, List<NewsArticle>>> getCountryNews(
    String cca2,
    String countryName,
  ) async {
    try {
      final dtos = await _datasource.getCountryNews(cca2, countryName);
      return Right(dtos.map((d) => d.toDomain()).toList());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    }
  }
}
