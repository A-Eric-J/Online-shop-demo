import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixelfield_test_app/const_values/assets.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';

class HistoryTab extends StatelessWidget {
  final historyJson = [
    {
      'label': 'Label',
      'title': 'Title',
      'description1': 'Description',
      'description2': 'Description',
      'attachments' : ['https://www.thesinglecask.co.uk/cdn/shop/files/stockists-squareup.jpg?v=1714142611&width=500','https://www.thesinglecask.co.uk/cdn/shop/files/stockists-squareup.jpg?v=1714142611&width=500','https://www.thesinglecask.co.uk/cdn/shop/files/stockists-squareup.jpg?v=1714142611&width=500'],
    },
    {
      'label': 'Label',
      'title': 'Title',
      'description1': 'Description',
      'description2': 'Description',
      'attachments' : ['https://www.thesinglecask.co.uk/cdn/shop/files/stockists-squareup.jpg?v=1714142611&width=500','https://www.thesinglecask.co.uk/cdn/shop/files/stockists-squareup.jpg?v=1714142611&width=500','https://www.thesinglecask.co.uk/cdn/shop/files/stockists-squareup.jpg?v=1714142611&width=500'],
    },
  ];

  HistoryTab({super.key});

  List<Widget> historyBody(double width) {
    var widgets = <Widget>[];

    for (var historyItem in historyJson) {

      widgets.add(
        Container(
          color: screensBackgroundColor,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: historyItem == historyJson.first ? 16 : 0 , left: 16.0 ,right: 16.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 250,
                          width: 1,
                          decoration: BoxDecoration(
                              color: orangeColor_1,
                              borderRadius: BorderRadius.circular(24)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 63.0),
                          child: SvgPicture.asset(accents),
                        ),
                        Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(24)
                          ),
                        ),

                      ],
                    ),
                    if(historyItem == historyJson.last)
                      Column(
                        children: [
                          const SizedBox(
                            height: 230,
                            width: 1,
                          ),
                          SvgPicture.asset(accents_2),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 28,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      historyItem['label'] as String,
                      style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12,
                          color: whiteTextColor_1,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      historyItem['title'] as String,
                      style: const TextStyle(
                          fontFamily: 'EBGaramond',
                          fontSize: 22,
                          color: whiteTextColor_1,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      historyItem['description1'] as String,
                      style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: whiteTextColor_1,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      historyItem['description2'] as String,
                      style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          color: whiteTextColor_1,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      color: brandMainColor,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                attachments,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Attachments',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 12,
                                    color: whiteTextColor_1,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],

                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage((historyItem['attachments'] as List)[0]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage((historyItem['attachments'] as List)[1]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage((historyItem['attachments'] as List)[2]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: historyBody(width),
    );
  }
}
