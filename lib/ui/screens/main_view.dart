import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield_test_app/bloc/bottom_navigation_cubit.dart';
import 'package:pixelfield_test_app/const_values/assets.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';
import 'package:pixelfield_test_app/ui/screens/collection_screen.dart';
import 'package:pixelfield_test_app/ui/widgets/main_view/bottom_navigation_bar_item_widget.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  Widget comingSoonWidgets(String text){
    return  Center(child: Text(text,style: const TextStyle(
        fontFamily: 'EBGaramond',
        fontSize: 16,
        color: whiteTextColor_1,
        fontWeight: FontWeight.w600)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screensBackgroundColor,
      body: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          switch (state) {
            case 0:
              return comingSoonWidgets('Scan Screen\nComing soon!') ;
            case 1:
              return const CollectionScreen();
            case 2:
              return comingSoonWidgets('Shop Screen\nComing soon!');
            case 3:
              return comingSoonWidgets('Setting Screen\nComing soon!');
            default:
              return const CollectionScreen();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: state,
            backgroundColor: darkColor,
            selectedItemColor: white,
            unselectedItemColor: grey,
            onTap: (index) {
              context.read<BottomNavigationCubit>().updateIndex(index);
            },
            items:  [
              BottomNavigationBarItem(
                icon: BottomNavigationBarItemWidget(svgAssetPath: scan, isSelected: state == 0),
                label: 'Scan',
              ),
              BottomNavigationBarItem(
                icon: BottomNavigationBarItemWidget(svgAssetPath: collection,isSelected: state == 1),
                label: 'Collection',
              ),
              BottomNavigationBarItem(
                icon: BottomNavigationBarItemWidget(svgAssetPath: shop,isSelected: state == 2),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: BottomNavigationBarItemWidget(svgAssetPath: setting,isSelected: state == 3),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
