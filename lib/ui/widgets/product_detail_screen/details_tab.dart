import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';

class DetailsTab extends StatelessWidget {
  final  details = [
    {'title': 'Distillery', 'value': 'Text'},
    {'title': 'Region', 'value': 'Text'},
    {'title': 'Country', 'value': 'Text'},
    {'title': 'Type', 'value': 'Text'},
    {'title': 'Age statement', 'value': 'Text'},
    {'title': 'Filled', 'value': 'Text'},
    {'title': 'Bottled', 'value': 'Text'},
    {'title': 'Cask number', 'value': 'Text'},
    {'title': 'ABV', 'value': 'Text'},
    {'title': 'Size', 'value': 'Text'},
    {'title': 'Finish', 'value': 'Text'},
  ];

  DetailsTab({super.key});

  List<Widget> detailsBody() {
    var widgets = <Widget>[];
    for (var detail in details) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detail['title']!,
                style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: whiteTextColor_1,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                detail['value']!,
                style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: whiteTextColor_2,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: detailsBody(),
    );
  }
}
