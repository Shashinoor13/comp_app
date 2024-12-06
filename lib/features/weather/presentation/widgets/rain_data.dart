import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RainData extends StatelessWidget {
  const RainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chances Of Rain",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Heavy Rainy",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7589a2),
                    ),
                  ),
                  Text(
                    "Rainy",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7589a2),
                    ),
                  ),
                  Text(
                    "Rain",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7589a2),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        enabled: false,
                      ),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (value, meta) {
                              String text;
                              switch (value.toInt()) {
                                case 0:
                                  text = 'Sun';
                                  break;
                                case 1:
                                  text = 'Mon';
                                  break;
                                case 2:
                                  text = 'Tue';
                                  break;
                                case 3:
                                  text = 'Wed';
                                  break;
                                case 4:
                                  text = 'Thu';
                                  break;
                                case 5:
                                  text = 'Fri';
                                  break;
                                case 6:
                                  text = 'Sat';
                                  break;
                                default:
                                  text = '';
                                  break;
                              }
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                space: 4,
                                child: Text(
                                  text,
                                  style: const TextStyle(
                                    color: Color(0xff7589a2),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
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
                      gridData: FlGridData(
                        show: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                              toY: 10,
                              color: const Color(0xffb9d4f1),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              toY: 30,
                              color: const Color(0xffb9d4f1),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              toY: 20,
                              color: const Color(0xffb9d4f1),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                              toY: 40,
                              color: const Color(0xffb9d4f1),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                              toY: 40,
                              color: const Color(0xffb9d4f1),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barRods: [
                            BarChartRodData(
                              toY: 10,
                              color: const Color(0xff0392ff),
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barRods: [
                            BarChartRodData(
                              toY: 20,
                              color: const Color(0xffb9d4f1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
