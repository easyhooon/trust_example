import '../datasource/law_remote_datasource.dart';
import '../model/law_article.dart';

class LawRepository {
  final LawRemoteDatasource _datasource;

  LawRepository(this._datasource);

  Future<List<LawSearchResult>> searchLaws({
    required String query,
    int display = 20,
    int page = 1,
  }) {
    return _datasource.searchLaws(
      query: query,
      display: display,
      page: page,
    );
  }

  Future<LawDetail> getLawDetail(String lawId) {
    return _datasource.getLawDetail(lawId);
  }
}
