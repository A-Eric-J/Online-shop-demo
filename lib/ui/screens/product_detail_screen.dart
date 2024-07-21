import 'package:flutter/material.dart';
import 'package:pixelfield_test_app/const_values/assets.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';
import 'package:pixelfield_test_app/locator.dart';
import 'package:pixelfield_test_app/models/wine/wine.dart';
import 'package:pixelfield_test_app/services/navigation_service.dart';
import 'package:pixelfield_test_app/ui/widgets/product_detail_screen/details_tab.dart';
import 'package:pixelfield_test_app/ui/widgets/product_detail_screen/history_tab.dart';
import 'package:pixelfield_test_app/ui/widgets/product_detail_screen/tab_bar_widget.dart';
import 'package:pixelfield_test_app/ui/widgets/product_detail_screen/tasting_notes_tab.dart';

class ProductDetailScreen extends StatefulWidget {
  final Wine? wine;

  const ProductDetailScreen({super.key, this.wine});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var tabBarSelected = TabBarEnum.details;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Image.asset(
                background,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: brandMainColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: const Text(
                            'Genesis Collection',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 12,
                                color: whiteTextColor_1,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        InkWell(
                          splashColor: transparent,
                          highlightColor: transparent,
                          onTap: () => locator<NavigationService>().goBack(),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: brandMainColor,
                              borderRadius: BorderRadius.circular(
                                100.0,
                              ),
                            ),
                            child: const Icon(
                              Icons.clear,
                              color: whiteTextColor_1,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                        color: brandMainColor,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  tag,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Genuine Bottle (Unopened)',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 14,
                                      color: whiteTextColor_1,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: orangeColor_2,
                            )
                          ],
                        )),
                    widget.wine?.imageUrl != null
                        ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: Center(
                              child: Container(
                                width: 308,
                                height: 411,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(widget.wine!.imageUrl!),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                        )
                        : const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                          child: Center(
                              child: Icon(
                                Icons.image_rounded,
                                color: white,
                                size: 48,
                              ),
                            ),
                        ),
                    Container(
                      color: cardBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bottle 135/184',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 12,
                                  color: whiteTextColor_2,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              children: [
                                Text(
                                  'Talisker',
                                  style: TextStyle(
                                      fontFamily: 'EBGaramond',
                                      fontSize: 32,
                                      color: whiteTextColor_1,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(' 18 Year Old',
                                    style: TextStyle(
                                        fontFamily: 'EBGaramond',
                                        fontSize: 32,
                                        color: orangeColor_1,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '#2504',
                              style: TextStyle(
                                  fontFamily: 'EBGaramond',
                                  fontSize: 32,
                                  color: whiteTextColor_1,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 24),
                            TabBarWidget(
                              tabBarEnum: tabBarSelected,
                              onTabTap: (tabBar) {
                                setState(() {
                                  tabBarSelected = tabBar;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            tabBarBody()
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: transparent,
                      highlightColor: transparent,
                      onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(milliseconds: 1500),
                        content: Text(
                          'Added to my collection!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'EBGaramond',
                              fontSize: 16,
                              color: whiteTextColor_1,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                      child: Container(
                        margin: const EdgeInsets.only(top: 32, bottom: 16),
                        padding:
                            const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: orangeColor_1,
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              color: brandMainColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Add to my collection',
                              style: TextStyle(
                                  fontFamily: 'EBGaramond',
                                  fontSize: 16,
                                  color: brandMainColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabBarBody() {
    switch (tabBarSelected) {
      case TabBarEnum.details:
        return DetailsTab();
      case TabBarEnum.tastingNotes:
        return TastingNotesTab();
      case TabBarEnum.history:
        return HistoryTab();
      default:
        return DetailsTab();
    }
  }
}

