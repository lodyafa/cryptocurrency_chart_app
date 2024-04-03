import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/crypto_body.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/custom_icons.dart';
import 'package:flutter/material.dart';

class CryptoInfoScreen extends StatelessWidget {
  const CryptoInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ETH / USDT",
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const CustomIcon(
            backgroundColor: AppColors.greyDark,
            iconColor: AppColors.white,
            icon: Icons.keyboard_arrow_left,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CustomIcon(
              backgroundColor: AppColors.greyDark,
              iconColor: AppColors.white,
              icon: Icons.insert_chart_outlined_rounded,
            ),
          )
        ],
      ),
      backgroundColor: AppColors.background,
      body: const CryptoBody(),
    );
  }
}
