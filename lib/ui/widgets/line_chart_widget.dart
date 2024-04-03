import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    super.key,
    this.borderData = false,
    this.gridData = false,
    this.titlesData = false,
  });

  final bool borderData;
  final bool gridData;
  final bool titlesData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      mainData(),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: gridData,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
      ),
      titlesData: FlTitlesData(
        show: titlesData,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
            sideTitles: SideTitles(
          showTitles: false,
        )),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: borderData,
        border: Border.all(color: AppColors.grey.withOpacity(0.8)),
      ),
      minX: 0,
      maxX: 9,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9, 3),
          ],
          isCurved: true,
          color: AppColors.green,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: AppColors.greenLinearGradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const daysNamesStyle = TextStyle(
      fontSize: 10,
      color: AppColors.white,
    );
    const daysNumbersStyle = TextStyle(
      fontSize: 12,
      color: AppColors.grey,
    );

    final List<String> dayNames = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
      "Mon"
    ];
    final List<int> dayNumbers = [15, 16, 17, 18, 19, 20, 21, 22];

    int index = value.toInt() - 1;
    if (index < 0 || index >= dayNames.length) {
      return SideTitleWidget(axisSide: meta.axisSide, child: const Text(''));
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Column(
        children: [
          Text(dayNames[index], style: daysNamesStyle),
          Text('${dayNumbers[index]}', style: daysNumbersStyle),
        ],
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      color: AppColors.white,
    );

    final Map<int, String> titles = {
      1: '10K',
      3: '30K',
      5: '50K',
    };

    String? text = titles[value.toInt()];
    if (text == null) {
      return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
