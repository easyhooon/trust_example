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
            // 지역 선택
            const _RegionSelector(),
            const SizedBox(height: 20),
            // 통계 카드 + 차트
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
            // 시도 드롭다운
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
            // 시군구 드롭다운
            if (selectedSido != null) _DistrictDropdown(sidoCode: selectedSido.code),
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
      data: (districts) => _DropdownField(
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
      ),
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

/// 통계 카드 + 차트
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
            _SummaryCards(stats: stats),
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

/// 요약 통계 카드
class _SummaryCards extends StatelessWidget {
  final List<RegistryStat> stats;

  const _SummaryCards({required this.stats});

  @override
  Widget build(BuildContext context) {
    final totalTransfer = stats.fold(0, (sum, s) => sum + s.transferCount);
    final totalPreservation =
        stats.fold(0, (sum, s) => sum + s.preservationCount);
    final totalMortgage = stats.fold(0, (sum, s) => sum + s.mortgageCount);

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            label: '소유권이전',
            value: _formatNumber(totalTransfer),
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            label: '소유권보존',
            value: _formatNumber(totalPreservation),
            color: AppColors.success,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            label: '근저당설정',
            value: _formatNumber(totalMortgage),
            color: AppColors.error,
          ),
        ),
      ],
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

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(label, style: AppTextStyles.caption),
            const SizedBox(height: 8),
            Text(
              value,
              style: AppTextStyles.heading.copyWith(color: color),
            ),
          ],
        ),
      ),
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
            Text('월별 추이', style: AppTextStyles.subheading),
            const SizedBox(height: 8),
            Row(
              children: [
                _LegendDot(color: AppColors.primary, label: '소유권이전'),
                const SizedBox(width: 16),
                _LegendDot(color: AppColors.success, label: '소유권보존'),
                const SizedBox(width: 16),
                _LegendDot(color: AppColors.error, label: '근저당설정'),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final labels = ['소유권이전', '소유권보존', '근저당설정'];
                        return BarTooltipItem(
                          '${labels[rodIndex]}\n${rod.toY.toInt()}건',
                          AppTextStyles.caption.copyWith(
                            color: Colors.white,
                          ),
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
                          // "202401" → "1월"
                          final month = period.length >= 6
                              ? '${int.parse(period.substring(4, 6))}월'
                              : period;
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(month, style: AppTextStyles.caption.copyWith(fontSize: 11)),
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
                          toY: s.transferCount.toDouble(),
                          color: AppColors.primary,
                          width: 6,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        BarChartRodData(
                          toY: s.preservationCount.toDouble(),
                          color: AppColors.success,
                          width: 6,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        BarChartRodData(
                          toY: s.mortgageCount.toDouble(),
                          color: AppColors.error,
                          width: 6,
                          borderRadius: BorderRadius.circular(2),
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

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}
