import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';
import 'package:pixelfield_test_app/models/wine/wine.dart';

class WineGridItem extends StatelessWidget {
  final Wine wine;

  const WineGridItem({super.key, required this.wine});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cardBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: 189,
                width: 136,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(wine.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: Text(
             '${wine.name}\n${wine.code}',
              style: const TextStyle(
            fontFamily: 'EBGaramond',
            fontSize: 22,
            color: whiteTextColor_1,
            fontWeight: FontWeight.w500),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
            child: Text(
              wine.description,
              style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 12,
                  color: whiteTextColor_3,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
        ],
      ),
    );
  }
}