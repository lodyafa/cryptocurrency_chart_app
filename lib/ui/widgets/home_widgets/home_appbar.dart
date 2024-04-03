import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/home_widgets/appbar_textfield.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/custom_icons.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.userName,
    required this.userPhotoPath,
  });

  final String userName;
  final String userPhotoPath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: AppColors.appBarBackground,
      toolbarHeight: 185,
      title: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.greyLight,
                              width: 2,
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 21,
                            backgroundColor: AppColors.grey,
                            backgroundImage:
                                AssetImage("assets/images/avatar.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyLight,
                        ),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIcon(
                        backgroundColor: AppColors.background,
                        iconColor: AppColors.greyLight,
                        icon: Icons.wallet,
                      ),
                      SizedBox(width: 8),
                      CustomIcon(
                        backgroundColor: AppColors.background,
                        iconColor: AppColors.greyLight,
                        icon: Icons.qr_code_scanner_sharp,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 18),
              const SizedBox(
                height: 48,
                width: double.infinity,
                child: HomeAppBarTextField(),
              ),
              const SizedBox(height: 12),
              Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.appBarDash,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 180);
}
