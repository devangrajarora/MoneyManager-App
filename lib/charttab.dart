import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'indicator.dart';

class ChartTab extends StatefulWidget {
  @override
  _ChartTabState createState() => _ChartTabState();
}

class _ChartTabState extends State<ChartTab> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalBoxSmall,
          Text(
            'Monthly Breakdown',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalBoxSmall,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              final desiredTouch = pieTouchResponse.touchInput
                                      is! PointerExitEvent &&
                                  pieTouchResponse.touchInput
                                      is! PointerUpEvent;
                              if (desiredTouch &&
                                  pieTouchResponse.touchedSection != null) {
                                touchedIndex = pieTouchResponse
                                    .touchedSection!.touchedSectionIndex;
                              } else {
                                touchedIndex = -1;
                              }
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections()),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Indicator(
                        color: Color(0xff0293ee),
                        text: 'Food',
                        isSquare: true,
                        textColor:
                            touchedIndex == 0 ? Colors.white : Colors.grey,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Color(0xfff8b250),
                        text: 'Groceries',
                        isSquare: true,
                        textColor:
                            touchedIndex == 1 ? Colors.white : Colors.grey,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Color(0xff845bef),
                        text: 'Travel',
                        isSquare: true,
                        textColor:
                            touchedIndex == 2 ? Colors.white : Colors.grey,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Color(0xff13d38e),
                        text: 'Others',
                        isSquare: true,
                        textColor:
                            touchedIndex == 3 ? Colors.white : Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalBoxSmall,
          Row(
            children: [
              Text(
                'History',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
              SizedBox(width: 5.0),
              Text(
                '(in hundreds)',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontFamily: 'OpenSans'),
              )
            ],
          ),
          verticalBoxSmall,
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10.0)),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 50,
                barTouchData: BarTouchData(
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
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => const TextStyle(
                        color: Color(0xff7589a2),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    margin: 20,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Jan';
                        case 1:
                          return 'Feb';
                        case 2:
                          return 'Mar';
                        case 3:
                          return 'Apr';
                        case 4:
                          return 'May';
                        case 5:
                          return 'Jun';
                        case 6:
                          return 'Jul';
                        case 7:
                          return 'Aug';
                        case 8:
                          return 'Sep';
                        case 9:
                          return 'Oct';
                        case 10:
                          return 'Nov';
                        case 11:
                          return 'Dec';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(showTitles: false),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(y: 22, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(y: 33, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(y: 18, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(y: 26, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(y: 24, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 5,
                    barRods: [
                      BarChartRodData(y: 40, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 6,
                    barRods: [
                      BarChartRodData(y: 29, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 7,
                    barRods: [
                      BarChartRodData(y: 17, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 8,
                    barRods: [
                      BarChartRodData(y: 30, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 9,
                    barRods: [
                      BarChartRodData(y: 19, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 10,
                    barRods: [
                      BarChartRodData(y: 27, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                  BarChartGroupData(
                    x: 11,
                    barRods: [
                      BarChartRodData(y: 43, colors: [kBgColorOne, kBgColorTwo])
                    ],
                    showingTooltipIndicators: [0],
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
