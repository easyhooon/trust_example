import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../data/model/registry_stat.dart';
import 'provider/registry_provider.dart';

class RegistryScreen extends ConsumerWidget {
  const RegistryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('등기 통계', style: AppTextStyles.subheading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _RegionSelector(),
            const SizedBox(height: 20),
            const _StatsContent(),
          ],
        ),
      ),
    );
  }
}

/// 시도/시군구 드롭다운
class _RegionSelector extends ConsumerWidget {
  const _RegionSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSido = ref.watch(selectedSidoProvider);
    final regionsAsync = ref.watch(regionsProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('지역 선택', style: AppTextStyles.subheading),
            const SizedBox(height: 16),
            regionsAsync.when(
              data: (regions) => _DropdownField(
                hint: '시/도 선택',
                value: selectedSido?.code,
                items: regions
                    .map((r) => DropdownMenuItem(
                          value: r.code,
                          child: Text(r.name),
                        ))
                    .toList(),
                onChanged: (code) {
                  final region = regions.firstWhere((r) => r.code == code);
                  ref.read(selectedSidoProvider.notifier).select(region);
                },
              ),
              loading: () => const _DropdownSkeleton(),
              error: (_, __) => Text(
                '시도 목록을 불러올 수 없습니다',
                style: AppTextStyles.caption,
              ),
            ),
            const SizedBox(height: 12),
            if (selectedSido != null)
              _DistrictDropdown(sidoCode: selectedSido.code),
          ],
        ),
      ),
    );
  }
}

class _DistrictDropdown extends ConsumerWidget {
  final String sidoCode;

  const _DistrictDropdown({required this.sidoCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSigungu = ref.watch(selectedSigunguProvider);
    final districtsAsync = ref.watch(districtsProvider(sidoCode));

    return districtsAsync.when(
      data: (districts) {
        if (districts.isEmpty) return const SizedBox.shrink();
        return _DropdownField(
          hint: '시/군/구 선택',
          value: selectedSigungu?.code,
          items: districts
              .map((r) => DropdownMenuItem(
                    value: r.code,
                    child: Text(r.name),
                  ))
              .toList(),
          onChanged: (code) {
            final region = districts.firstWhere((r) => r.code == code);
            ref.read(selectedSigunguProvider.notifier).select(region);
          },
        );
      },
      loading: () => const _DropdownSkeleton(),
      error: (_, __) => Text(
        '시군구 목록을 불러올 수 없습니다',
        style: AppTextStyles.caption,
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String hint;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;

  const _DropdownField({
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint, style: AppTextStyles.caption),
          value: value,
          items: items,
          onChanged: onChanged,
          style: AppTextStyles.body,
          dropdownColor: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class _DropdownSkeleton extends StatelessWidget {
  const _DropdownSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

/// 통계 콘텐츠
class _StatsContent extends ConsumerWidget {
  const _StatsContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(registryStatsProvider);

    return statsAsync.when(
      data: (stats) {
        if (stats.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                '지역을 선택하면 통계가 표시됩니다',
                style: AppTextStyles.caption,
              ),
            ),
          );
        }
        return Column(
          children: [
            _SummaryCard(stats: stats),
            const SizedBox(height: 20),
            _StatsChart(stats: stats),
          ],
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.only(top: 40),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Text(
            '통계를 불러올 수 없습니다',
            style: AppTextStyles.caption,
          ),
        ),
      ),
    );
  }
}

/// 총 매매 건수 요약 카드
class _SummaryCard extends StatelessWidget {
  final List<RegistryStat> stats;

  const _SummaryCard({required this.stats});

  @override
  Widget build(BuildContext context) {
    final totalCount = stats.fold(0, (sum, s) => sum + s.count);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('소유권이전(매매) 신청 건수', style: AppTextStyles.caption),
            const SizedBox(height: 8),
            Text(
              _formatNumber(totalCount),
              style: AppTextStyles.heading.copyWith(
                color: AppColors.primary,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '최근 ${stats.length}개월 합계',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 10000) {
      return '${(number / 10000).toStringAsFixed(1)}만';
    }
    return number.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
        );
  }
}

/// 월별 추이 차트
class _StatsChart extends StatelessWidget {
  final List<RegistryStat> stats;

  const _StatsChart({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('월별 매매 추이', style: AppTextStyles.subheading),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY.toInt()}건',
                          AppTextStyles.caption.copyWith(color: Colors.white),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= stats.length) {
                            return const SizedBox.shrink();
                          }
                          final period = stats[index].period;
                          // "2025-11" → "11월" 또는 "202511" → "11월"
                          String month;
                          if (period.contains('-') && period.length >= 7) {
                            month = '${int.parse(period.split('-')[1])}월';
                          } else if (period.length >= 6) {
                            month = '${int.parse(period.substring(4, 6))}월';
                          } else {
                            month = period;
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              month,
                              style: AppTextStyles.caption.copyWith(fontSize: 11),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  barGroups: stats.asMap().entries.map((entry) {
                    final i = entry.key;
                    final s = entry.value;
                    return BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: s.count.toDouble(),
                          color: AppColors.primary,
                          width: 16,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
