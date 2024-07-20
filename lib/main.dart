import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixelfield_test_app/bloc/bottom_navigation_cubit.dart';
import 'package:pixelfield_test_app/bloc/wine/wine_cubit.dart';
import 'package:pixelfield_test_app/const_values/colors.dart';
import 'package:pixelfield_test_app/locator.dart';
import 'package:pixelfield_test_app/models/wine/wine.dart';
import 'package:pixelfield_test_app/repository/repository.dart';
import 'package:pixelfield_test_app/services/navigation_service.dart';
import 'package:pixelfield_test_app/ui/screens/main_view.dart';
import 'package:pixelfield_test_app/ui/screens/splash_screen.dart';
import 'package:pixelfield_test_app/base/router.dart' as router;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(WineAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WineCubit(Repository()),
        ),
        BlocProvider(
          create: (context) => BottomNavigationCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: brandMainColor),
          onGenerateRoute: router.Router.generateRoute,
          debugShowCheckedModeBanner: true,
          navigatorKey: locator<NavigationService>().navigatorKey,
          home: const MainView(),
      ),
    );
  }
}
