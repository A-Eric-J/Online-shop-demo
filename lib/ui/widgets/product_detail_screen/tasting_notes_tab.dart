import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';

class TastingNotesTab extends StatelessWidget {
  final tastingNotesJson = [
    {
      'user': 'Charles MacLean MBE',
      'tastingNotes': [
        {
          'title': 'Nose',
          'description1': 'Description',
          'description2': 'Description',
          'description3': 'Description'
        },
        {
          'title': 'Palate',
          'description1': 'Description',
          'description2': 'Description',
          'description3': 'Description'
        },
        {
          'title': 'Finish',
          'description1': 'Description',
          'description2': 'Description',
          'description3': 'Description'
        },
      ]
    },
    {
      'user': 'me',
      'tastingNotes': [
        {
          'title': 'Nose',
          'description1': 'Description',
          'description2': 'Description',
          'description3': 'Description'
        },
        {
          'title': 'Palate',
          'description1': 'Description',
          'description2': 'Description',
          'description3': 'Description'
        },
        {
          'title': 'Finish',
          'description1': 'Description',
          'description2': 'Description',
          'description3': 'Description'
        },
      ]
    }
  ];

  TastingNotesTab({super.key});

  List<Widget> tastingNoteBody(double width) {
    var widgets = <Widget>[];

    for (var tastingNoteItem in tastingNotesJson) {
      if (tastingNoteItem['user'] != 'me') {
        widgets.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tasting notes',
              style: TextStyle(
                  fontFamily: 'EBGaramond',
                  fontSize: 22,
                  color: whiteTextColor_1,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4,),
            Text(
              'by ${tastingNoteItem['user']}',
              style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 16,
                  color: whiteTextColor_2,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 4,),
          ],
        ));
      } else {
        widgets.add(const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your notes',
                  style: TextStyle(
                      fontFamily: 'EBGaramond',
                      fontSize: 22,
                      color: whiteTextColor_1,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.arrow_back,
                  color: white,
                )
              ],
            ),
            SizedBox(height: 10,),
          ],
        ));
      }
      for (var testingNote in tastingNoteItem['tastingNotes'] as List) {
        widgets.add(
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            color: screensBackgroundColor,
            width: width,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  testingNote['title']!,
                  style: const TextStyle(
                      fontFamily: 'EBGaramond',
                      fontSize: 22,
                      color: whiteTextColor_1,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  testingNote['description1']!,
                  style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      color: whiteTextColor_1,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  testingNote['description2']!,
                  style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      color: whiteTextColor_1,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  testingNote['description3']!,
                  style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      color: whiteTextColor_1,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        );
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          splashColor: transparent,
          highlightColor: transparent,
          onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 1500),
            content: Text(
              'Video Not Available!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'EBGaramond',
                  fontSize: 16,
                  color: whiteTextColor_1,
                  fontWeight: FontWeight.w600),
            ),
          )),
          child: Container(
            color: brandMainColor,
            height: 233,width: width,
            child: const Icon(Icons.play_arrow,color: white,size: 28,),
          ),
        ),
        const SizedBox(height: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: tastingNoteBody(width),
        ),
      ],
    );
  }
}
