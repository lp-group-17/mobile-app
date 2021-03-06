import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        alignment: BarChartAlignment.spaceAround,
        maxY: 6,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.y.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff7589a2),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 1,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Mood';
              case 1:
                return 'Anger';
              case 2:
                return 'Anxiety';
              case 3:
                return 'Suicide';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              y: 2,
              colors: [Colors.lightBlueAccent, Colors.greenAccent],
            ),
          ],
          // showingTooltipIndicators: [0], //number above bar
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              y: 3,
              colors: [Colors.lightBlueAccent, Colors.greenAccent],
            ),
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              y: 4,
              colors: [Colors.lightBlueAccent, Colors.greenAccent],
            ),
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              y: 5,
              colors: [Colors.lightBlueAccent, Colors.greenAccent],
            ),
          ],
        ),
      ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: const _BarChart(),
      ),
    );
  }
}
