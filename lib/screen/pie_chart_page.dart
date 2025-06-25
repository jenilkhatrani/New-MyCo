import 'package:flutter/material.dart';

import '../custom_widgets/custom_pi_chart.dart';
import '../themes_colors/colors.dart';

class PieChartPage extends StatelessWidget {
  final bool isValueOnChart;
  const PieChartPage({required this.isValueOnChart, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Widget Testing',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Center(
        child: CustomPieChart(
          isValueOnChart: isValueOnChart,
          totalLeaves: 12.0,
          totalPaidLeave: 4.0,
          height: 400,
          segments: [
            ChartSegment(
              label: 'Sandwich',
              value: 2,
              color: const Color(0xFF08A4BB),
            ),
            ChartSegment(
              label: 'Paid',
              value: 2,
              color: const Color(0xFFFF9FEC),
            ),
            ChartSegment(
              label: 'Paid',
              value: 2,
              showShadow: false,
              color: const Color(0xFF2F648E),
            ),
            ChartSegment(
              label: 'Unpaid',
              showShadow: false,
              value: 2,
              color: const Color(0xFF2FBBA4),
            ),
            ChartSegment(
              label: 'Unpaid',
              value: 2,
              color: const Color(0xFF9FBE00),
            ),
            ChartSegment(
              label: 'Holiday',
              value: 2,
              color: const Color(0xFFFDB913),
            ),
          ],
        ),
      ),
    );
  }
}
