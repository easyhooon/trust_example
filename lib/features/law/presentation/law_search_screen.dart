import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../data/model/law_article.dart';
import 'provider/law_provider.dart';

class LawSearchScreen extends ConsumerWidget {
  const LawSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(lawSearchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('법령 검색', style: AppTextStyles.subheading),
      ),
      body: Column(
        children: [
          // 검색바
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (query) {
                ref.read(lawSearchProvider.notifier).search(query);
              },
              decoration: InputDecoration(
                hintText: '법령명을 검색하세요 (예: 도시정비, 신탁)',
                hintStyle: AppTextStyles.caption,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
          // 검색 결과
          Expanded(
            child: searchState.when(
              data: (results) {
                if (results.isEmpty) {
                  return Center(
                    child: Text(
                      '검색어를 입력해주세요',
                      style: AppTextStyles.caption,
                    ),
                  );
                }
                return _SearchResultList(results: results);
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '검색 중 오류가 발생했습니다',
                        style: AppTextStyles.body,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        error.toString(),
                        style: AppTextStyles.caption,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchResultList extends StatelessWidget {
  final List<LawSearchResult> results;

  const _SearchResultList({required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: results.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final law = results[index];
        return _LawSearchCard(law: law);
      },
    );
  }
}

class _LawSearchCard extends StatelessWidget {
  final LawSearchResult law;

  const _LawSearchCard({required this.law});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          context.push('/law/detail/${law.lawId}', extra: law.lawName);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(law.lawName, style: AppTextStyles.body),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        _Tag(text: law.lawType),
                        const SizedBox(width: 8),
                        Text(
                          '시행 ${_formatDate(law.enforcementDate)}',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(String date) {
    if (date.length != 8) return date;
    return '${date.substring(0, 4)}.${date.substring(4, 6)}.${date.substring(6, 8)}';
  }
}

class _Tag extends StatelessWidget {
  final String text;

  const _Tag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppTextStyles.caption.copyWith(
          color: AppColors.primary,
          fontSize: 12,
        ),
      ),
    );
  }
}
