import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';

class UserPortfolioCard extends StatelessWidget {
  const UserPortfolioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.cardLinearGradientColors,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PortfolioValueInfo(),
            const SizedBox(height: 10),
            const DividerWidget(),
            const SizedBox(height: 9),
            GestureDetector(
              onTap: () {},
              child: const SeeAllButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class PortfolioValueInfo extends StatelessWidget {
  const PortfolioValueInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Portfolio value",
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "\$47,412.65",
              style: TextStyle(
                fontSize: 24,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_drop_up_rounded,
                  color: AppColors.green,
                ),
                Text(
                  "\$453.85(+1.6%)",
                  style: TextStyle(
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 100),
        SizedBox(
          width: 85,
          height: 35,
          child: LineChartWidget(),
        ),
      ],
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.dividerLinearGradientColors,
        ),
      ),
    );
  }
}

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      height: 25,
      width: double.infinity,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "See All",
            style: TextStyle(color: AppColors.grey),
          ),
          SizedBox(width: 5),
          Icon(
            Icons.arrow_forward_ios,
            size: 13,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
