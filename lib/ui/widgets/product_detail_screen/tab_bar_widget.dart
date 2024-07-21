import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';

enum TabBarEnum { details, tastingNotes, history }

class TabBarWidget extends StatelessWidget {
  final TabBarEnum tabBarEnum;
  final Function(TabBarEnum) onTabTap;

  const TabBarWidget(
      {super.key, required this.tabBarEnum, required this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: screensBackgroundColor,
        borderRadius: BorderRadius.circular(
          6.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: InkWell(
                  onTap: () => onTabTap(TabBarEnum.details),
                  splashColor: transparent,
                  highlightColor: transparent,
                  child: tab(tabBarEnum == TabBarEnum.details,'Details'))),
          Expanded(
              child: InkWell(
                  onTap: () => onTabTap(TabBarEnum.tastingNotes),
                  splashColor: transparent,
                  highlightColor: transparent,
                  child: tab(tabBarEnum == TabBarEnum.tastingNotes,'Tasting notes'))),
          Expanded(
              child: InkWell(
                  onTap: () => onTabTap(TabBarEnum.history),
                  splashColor: transparent,
                  highlightColor: transparent,
                  child: tab(tabBarEnum == TabBarEnum.history,'History')))
        ],
      ),
    );
  }

  Widget tab(bool isSelected,String text) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? orangeColor_1 : transparent,
        borderRadius: BorderRadius.circular(
          6.0,
        ),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 12,
              color: isSelected ? brandMainColor : grey_2,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

}
