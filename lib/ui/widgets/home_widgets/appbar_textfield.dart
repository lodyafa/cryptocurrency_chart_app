import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/custom_icons.dart';
import 'package:flutter/material.dart';

class HomeAppBarTextField extends StatelessWidget {
  const HomeAppBarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Padding(
          padding: EdgeInsets.all(4),
          child: CustomIcon(
            icon: Icons.tune,
            iconColor: AppColors.greyLight,
            backgroundColor: AppColors.appBarBackground,
          ),
        ),
        hintText: "Search...",
        hintStyle: const TextStyle(color: AppColors.grey),
      ),
    );
  }
}
