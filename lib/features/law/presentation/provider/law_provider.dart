import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasource/law_remote_datasource.dart';
import '../../data/model/law_article.dart';
import '../../data/repository/law_repository.dart';

part 'law_provider.g.dart';

// build_runner가 @riverpod 어노테이션으로부터 provider 코드를 자동 생성
@riverpod
LawRepository lawRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return LawRepository(LawRemoteDatasource(dio));
}

@riverpod
class LawSearch extends _$LawSearch {
  Timer? _debounceTimer;

  @override
  AsyncValue<List<LawSearchResult>> build() {
    ref.onDispose(() => _debounceTimer?.cancel());
    return const AsyncData([]);
  }

  /// 디바운스 적용 검색
  void search(String query) {
    _debounceTimer?.cancel();

    if (query.trim().isEmpty) {
      state = const AsyncData([]);
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _performSearch(query);
    });
  }

  Future<void> _performSearch(String query) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(lawRepositoryProvider);
      final results = await repository.searchLaws(query: query);
      state = AsyncData(results);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

@riverpod
class LawDetailNotifier extends _$LawDetailNotifier {
  @override
  Future<LawDetail> build(String lawId) async {
    final repository = ref.read(lawRepositoryProvider);
    return repository.getLawDetail(lawId);
  }
}
