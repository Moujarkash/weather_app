import 'package:flutter/material.dart';
import 'package:weather_app/config/routing/app_router.dart';

class App extends StatelessWidget {
  final appRouter = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      builder: (context, widget) {
        if (widget == null) {
          return Container();
        }
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
            ),
            child: SafeArea(
              top: false,
              left: false,
              right: false,
              child: widget,
            ),
          ),
        );
      },
    );
  }
}
