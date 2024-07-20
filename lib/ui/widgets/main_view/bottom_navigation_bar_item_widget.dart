import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';

class BottomNavigationBarItemWidget extends StatelessWidget {
  final String svgAssetPath;
  final bool isSelected;
  const BottomNavigationBarItemWidget({super.key,required this.svgAssetPath, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(svgAssetPath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            colorFilter: isSelected
                ? const ColorFilter.mode(white, BlendMode.srcIn)
                : const ColorFilter.mode(grey, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
