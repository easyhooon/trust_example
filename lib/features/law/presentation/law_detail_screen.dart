import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../data/model/law_article.dart';
import 'provider/law_provider.dart';

class LawDetailScreen extends ConsumerWidget {
  final String lawId;
  final String lawName;

  const LawDetailScreen({
    super.key,
    required this.lawId,
    required this.lawName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(lawDetailNotifierProvider(lawId));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          lawName,
          style: AppTextStyles.subheading,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: detailAsync.when(
        data: (detail) => _ArticleListView(detail: detail),
        loading: () => const Center(child: CircularProgressIndicator()),
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
                Text('조문을 불러올 수 없습니다', style: AppTextStyles.body),
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
    );
  }
}

class _ArticleListView extends StatelessWidget {
  final LawDetail detail;

  const _ArticleListView({required this.detail});

  @override
  Widget build(BuildContext context) {
    if (detail.articles.isEmpty) {
      return Center(
        child: Text('조문 정보가 없습니다', style: AppTextStyles.caption),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: detail.articles.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final article = detail.articles[index];
        return _ArticleCard(article: article);
      },
    );
  }
}

class _ArticleCard extends StatelessWidget {
  final LawArticle article;

  const _ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 조문번호 + 제목
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '제${article.articleNumber}조',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (article.articleTitle.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        article.articleTitle,
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            // 조문내용
            Text(
              article.articleContent,
              style: AppTextStyles.body.copyWith(height: 1.7),
            ),
          ],
        ),
      ),
    );
  }
}
