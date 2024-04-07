import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarButton extends StatelessWidget {
  const CustomBottomNavBarButton({
    super.key,
    this.onPressed,
    this.width = 110,
    this.height = 45,
    this.fontSize = 15,
    this.textColor = Colors.white,
  });

  final void Function()? onPressed;
  final double width;
  final double height;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.greenButtonLinearGradientColors,
              stops: const [0.4, 0.8, 1.0],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(height),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset("assets/icons/plus_icon.png"),
          ),
        ),
      ),
    );
  }
}

class CustomColoredButton extends StatelessWidget {
  const CustomColoredButton({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.color,
    this.onPressed,
  });

  final double height;
  final double width;

  final String text;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}