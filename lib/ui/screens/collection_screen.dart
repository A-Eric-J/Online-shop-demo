import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pixelfield_test_app/bloc/wine/wine_cubit.dart';
import 'package:pixelfield_test_app/bloc/wine/wine_state.dart';
import 'package:pixelfield_test_app/const_values/assets.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';
import 'package:pixelfield_test_app/ui/widgets/main_view/collection_screen/wine_gride_item.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('My collection',
                      style: TextStyle(
                          fontFamily: 'EBGaramond',
                          fontSize: 32,
                          color: whiteTextColor_1,
                          fontWeight: FontWeight.w500)),
                  InkWell(
                    splashColor: transparent,
                    highlightColor: transparent,
                    onTap: ()=>ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 1500),
                      content: Text(
                        'Notifications!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'EBGaramond',
                            fontSize: 16,
                            color: whiteTextColor_1,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                    child: SvgPicture.asset(
                      bell,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<WineCubit, WineState>(
                builder: (context, state) {
                  if (state is WineInitial) {
                    context.read<WineCubit>().fetchWines();
                    return const Center(
                        child: CircularProgressIndicator(
                      color: white,
                    ));
                  } else if (state is WineLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: white,
                    ));
                  } else if (state is WineLoaded) {
                    if(state.wines.isNotEmpty) {
                      return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: state.wines.length,
                      itemBuilder: (context, index) {
                        final wine = state.wines[index];
                        return WineGridItem(wine: wine);
                      },
                    );
                    }
                    else{
                      return const Center(
                          child: Text(
                            'List is Empty or Device is not connected to internet!',
                            style: TextStyle(
                                fontFamily: 'EBGaramond',
                                fontSize: 16,
                                color: whiteTextColor_1,
                                fontWeight: FontWeight.w600),
                          ));
                    }
                  } else if (state is WineError) {
                    return Center(
                        child: Text(
                      state.message,
                      style: const TextStyle(
                          fontFamily: 'EBGaramond',
                          fontSize: 16,
                          color: whiteTextColor_1,
                          fontWeight: FontWeight.w600),
                    ));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
