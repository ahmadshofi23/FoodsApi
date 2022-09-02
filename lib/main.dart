import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/detail/detail.page.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/favorite/favorite.page.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/home/home.page.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(
          '/detail',
          child: (context, args) => const DetailFood(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute('/favorite',
            child: (context, args) => const FavoritePage(),
            transition: TransitionType.rightToLeft),
      ];
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
