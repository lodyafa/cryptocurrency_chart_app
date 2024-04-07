import 'package:cryptocurrency_chart_app/domain/models/crypto_model.dart';
import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CryptoInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CryptoInfoAppBar({
    super.key,
    required this.cryptoModel,
  });

  final CryptoModel cryptoModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(
        "${cryptoModel.symbol} / ${cryptoModel.usdPrice}",
        style: const TextStyle(color: AppColors.white),
      ),
      centerTitle: true,
      backgroundColor: AppColors.background,
      leading: IconButton(
        onPressed: () {
          context.pop();
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
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
