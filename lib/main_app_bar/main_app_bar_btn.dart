import 'package:flutter/material.dart';

class MainAppBarBtn extends StatelessWidget {
  const MainAppBarBtn(
    this.icon, {
    required this.onTap,
    this.color = Colors.white,
    this.size = 25,
    super.key,
  });
  final IconData icon;
  final Color? color;
  final double? size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(
            icon,
            size: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
