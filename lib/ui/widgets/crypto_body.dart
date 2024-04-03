import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';

class CryptoBody extends StatelessWidget {
  const CryptoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: ListView(
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 6,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(width: 15),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3,839.65",
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_drop_up_rounded,
                        color: AppColors.green,
                      ),
                      Text(
                        "105 (%0.8)",
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChartPeriodButton(text: "24H", onPressed: () {}),
                ChartPeriodButton(text: "1W", onPressed: () {}),
                ChartPeriodButton(text: "1M", onPressed: () {}),
                ChartPeriodButton(text: "1Y", onPressed: () {}),
                ChartPeriodButton(text: "All", onPressed: () {}),
              ],
            ),
          ),
          const SizedBox(
            height: 264,
            child: LineChartWidget(
              borderData: true,
              gridData: true,
              titlesData: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ChartPeriodButton extends StatelessWidget {
  const ChartPeriodButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    );
  }
}
